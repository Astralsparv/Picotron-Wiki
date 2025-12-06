--[[
	mv src dest

	same semantics as cp except:
		1. keep original creation date
		2. remove original file
]]

cd(env().path)
local argv = env().argv

if (argv[1] == "--help") then
	?"usage: mv [options] src dest"
	?"options:"
	?"-f force overwrite of a folder"
	?"-n no clobber (do not overwrite existing files)"
	exit(0)
end


local force_folder_overwrite = false
local no_clobber = false

local files = {}

for i=1,#argv do
	local v = argv[i]
	if (sub(v,1,1) == "-") then
		if (v == "-f") force_folder_overwrite = true
		if (v == "-n") no_clobber = true
	else
		add(files, v)
	end
end

local src = files[1]
local dest = files[2]

if (not src or not dest) then
	print("usage: mv [options] src dest")
	exit(1)
end

local src_type  = fstat(src)
local dest_type = fstat(dest)


if (not src_type) then
	print("could not find "..src)
	exit(1)
end

-------

-- using . or .. always means copy inside
if (dest == "." or dest == "..") dest ..= "/"

-- when destination is a folder, put inside the folder instead of copying over it
if (dest_type == "folder" and not force_folder_overwrite) then
	if (sub(dest,-1,-1) == "/") then

		copy_inside = true -- take as an explicit indication (when copying p64)
		dest = sub(dest,1,-2) -- cut off trailing /
	
		local segs = split(fullpath(src),"/",false)
		dest = dest .. "/" .. segs[#segs]
		dest_type = fstat(dest) -- update 
	end
end

if (no_clobber and fstat(dest)) then
	print("skipping move over existing file: "..dest)
	exit(0)
end

if dest_type == "folder" and 
	not force_folder_overwrite and not copy_inside
then

	-- refuse to copy over a folder

	print("can not write over a folder / cartridge.")
	print("  to move inside: mv a.p64 b.p64/")
	print("  to force overwrite: mv -f a.p64 b.p64")
	exit(1)

else

	local existed = fstat(dest)
	local err = mv(src, dest)
	if (err) then
		print(err)
	else
		if (existed) then
			print("moving "..src.." \feover\f7 "..dest)
		else
			print("moving "..src.." to "..dest)
		end
	end

end



