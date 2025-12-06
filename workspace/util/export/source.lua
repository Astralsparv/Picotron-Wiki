--[[

	export:

		foo.html 
		foo.p64.png
		foo.bin
]]

cd(env().path)

src_cart = "/ram/cart" -- to do: allow export something else

local outfile = nil
local extras_file = nil

local index = 1
while index <= #env().argv do
	local val = env().argv[index]
	if (val[1] == "-") then
		-- some option
		if (val=="-e") then
			extras_file = env().argv[index + 1]
			index += 1
		end
	else
		outfile = val
	end
	index += 1
end

for i=1,#env().argv do
	local val = env().argv[i]
	if (val[1] == "-") then
		-- some option
	else
		outfile = val
	end
end

outfile = fullpath(outfile)


ext = type(outfile) == "string" and outfile:ext() or ""

supported_ext = {
	["p64.png"] = true,
	["html"] = true,
	["bin"] = true
}

if (type(outfile) ~= "string" or not supported_ext[ext]) then
	print("export usage: export [outfile]")
	print("outfile format is determined by extension:")
	print("  .p64.png\t png cartridge (bbs format)")
	print("  .html   \t single html file")
	print("  .bin    \t windows, linux and mac binaries")
	exit()
end



-- export .p64.png -- just copy
if (ext == "p64.png") then
	rm(outfile) -- to require -f to copy over cart?
	cp(src_cart, outfile)
	print("saved a copy as "..outfile)
	exit()
end


-- prepare cart for exporting

local cartfile = "/ram/expcart.p64.rom"

if (ext == "bin" or ext == "html") then
	print(string.format("exporting %s", outfile))
	flip()

	rm(cartfile) -- safety; to do: shouldn't be necessary
	-- save the cart to export in .rom format
	cp(src_cart, cartfile)
	-- strip sandbox metadata -- avoid zoo of edge cases 
	store_metadata(cartfile, {sandbox=false})

	_,cartfile_size = fstat(cartfile)
	print("\fsrom size: "..cartfile_size.." bytes")
	flip()
end


-- export binary players
if (ext == "bin") then

	if (cartfile_size >= 1024*1024*32) then
		print("\f8** too big! **")
		print("\f6max binary export rom size: 33,554,432 bytes")
		exit()
	end


	mkdir(outfile) -- foo.bin

	local meta = fetch_metadata(src_cart) or {}

	local icon = meta.export_icon
	if (type(icon) ~= "userdata" or icon:width() ~= 16 or icon:height() ~= 16) icon = meta.icon
	if (type(icon) ~= "userdata" or icon:width() ~= 16 or icon:height() ~= 16) then
		-- default: pink/purple cart icon
		icon = unpod("b64:bHo0ADMAAAA-AAAA-gdweHUAQyAQEATwAPEB1xEHvxIHEQe_BADwCNcRF48OJxEXjRcNEbcNAQABvQEQwfAD")
	end

	-- extras
	rm("/ram/exp_extras")
	mkdir("/ram/exp_extras")
	if (fstat(extras_file)) then
		cp(extras_file, "/ram/exp_extras")
	end


	--[[
		export_home is optional -- used when exported cartridge should have its own separate home directory, 
		with separate drive (and thus a separate /desktop, /appdata/system/settings.pod etc).

		export_home should contain only a-z,_ and be not too long. resulting home will be something like:
			~/.lexaloffle/Picotron/exp/foo
		when no export_home is given in the cart metadata, exports can read/write other exports' data at:
			~/.lexaloffle/Picotron/exp/shared
	]]

	print("\fgplease wait...")
	flip()

	send_message(2, {
		event = "export",
		cartfile = cartfile,
		shortname = outfile:basename():sub(1,-5),
		outfile = outfile,
		icon = icon,
		export_home = meta.export_home or ""
	})

	for i=1,60 do flip() end

	print("\fb[ok]")
--	print("ok") -- to do: is lie; have no idea what the result was / is going to be
	
	exit()
end


--- html

if (cartfile_size >= 1024*1024*8) then
	print("\f8** too big! **")
	print("\f6max html export rom size: 8,388,608 bytes")
	exit()
end

dat = fetch(cartfile) -- .p64.rom raw data

local shell_str = fetch("/ram/system/exp/exp_html.p64.rom/shell.html")

-- grab metadata

meta = fetch_metadata(src_cart) or {}
title = meta.title or "Picotron Cartridge"

print(title)

shell_str = shell_str:gsub("##page_title##", title)

-- generate label if there is one
if (fstat(src_cart.."/label.png")) then
	cp(src_cart.."/label.png", "/ram/label.bin")
	labelpng = fetch"/ram/label.bin" -- fetch raw bytes without .png extension
	
	-- abuse pod() format to get base64 suitable for data url
	b64str = pod("@"..labelpng, 0x24):sub(24,-3)
	b64str = b64str:gsub("_","+")
	b64str = b64str:gsub("-","/")
	--b64str = table.concat(split(b64str,76),"\n")
	
	-- insert data url
	shell_str = shell_str:gsub("##label_file##", "data:image/png;base64,"..b64str)

end

--- generate cart+player

strs = {"\n"}

add(strs, "p64cart_str=\"")

fmt = string.rep("%02x", 1024)

for i=0,#dat\1024 do
	local idx = 1 + i*1024
	local num = min(1024, #dat - idx + 1)
	if (num > 0) then
		--print(pod{idx,num})
		if (num < 1024) fmt = string.rep("%02x", num)
		chunk = string.format(fmt, ord(dat, idx, num))
		add(strs, chunk)
	end
end
add(strs,"\"")
add(strs,";\n")

export_home = meta.export_home or ""
add(strs, "export_home_str = \""..export_home.."\";\n")

local player_str = fetch("/ram/system/exp/exp_html.p64.rom/picotron_player.js")
add(strs, player_str)

picotron_js = table.concat(strs)

strs = nil -- free some memory for the file write

-- why doesn't this work? too big? ("invalid capture index %8")
--store(outfile, 
--	shell_str:gsub("##pcart##", picotron_js),
--	{metadata_format="none"})

-- to do: file appending; otherwise size of cart that can be exported
-- is extra limited by these string operations

local q = string.find(shell_str, "##pcart##") + 10

store(outfile, 
	shell_str:sub(1,q)..picotron_js..shell_str:sub(q+1),
	{metadata_format="none"})


print("\fb[ok]")