--[[pod_format="raw",created="2024-03-23 17:34:07",modified="2024-04-07 23:28:24",revision=6]]
--[[
	save

		copy from /ram/cart to present working cartridge location
		e.g.
		cp("/ram/cart", "/mycart.p64")

]]

function notify_or_print(m)
	(env().show_notifications and notify or print)(m)
end

cd(env().path)

local argv = env().argv or {}

local save_as = argv[1] or fetch("/ram/system/pwc.pod") or "/untitled.p64"
save_as = fullpath(save_as)

if (not save_as) then
	print("error: filenames can only include letters, numbers, or ._-")
	exit()
end


if (save_as:sub(1,10) == "/ram/cart/") then
	print("error: can not save the working cartridge inside itself.")
	print("try \"cd /\" first")
	exit()
end




if (save_as:sub(1,8) == "/system/") then
	print("** warning ** saving to /system will not persist to disk")
end


-- add extension when none is given (to do: how to save to a regular folder with no extension in name? maybe just don't do that?)
--if (sub(save_as, -4) ~= ".p64" and sub(save_as, -8) ~= ".p64.rom" and sub(save_as, -8) ~= ".p64.png") then -- deleteme
if not save_as:ext() or not save_as:ext():is_cart() then
	save_as ..= ".p64"
end


if (fstat(save_as) and argv[1]) then
	local res = input("\feoverwrite "..save_as:basename().."? \f7[y/n] ", 0x2)
	if (res ~= "y" and res ~= "Y") exit()
end

local completed = false
local num_files = 0
on_event("save_working_cart_files_completed",function(msg)
	completed = true
	num_files = msg.num_files -- num files saved because editors were open, not total files in the cart
end)

-- save all files and metadata (note: normally already saved as happens in wrangler on lost_focus)
-- wait for all save messages to come back via wm, for up to 120 frames
send_message(3, {event="save_working_cart_files", notify_on_complete=pid()})
for i=1,120 do if (not completed) then flip() end end

send_message(3, {event="save_open_locations_metadata"}, true) -- block until complete (if wm doesn't get back soon, have worse problems to worry about)

-- no unsaved pwc changes at this point
send_message(3, {event="reset_pwc_unsaved_changes"})


-- set runtime version metadata
-- when loading a cartridge, runtime should be greater or equal to this
-- (splore: refuse to run; otherwise: show a warning)

store_metadata("/ram/cart", {runtime = stat(5)})


-- copy /ram/cart to present working cartridge

pwc_meta = fetch_metadata(save_as)

local result = cp("/ram/cart", save_as, 0x1)

if (result) then
	notify_or_print("save error: "..tostring(result))
	exit(1)
end

-- 0.2.1c: preserve date created by setting in /ram/cart first (otherwise need to store_metadata, and causes an extra flush / anywhen entry)
if (pwc_meta and pwc_meta.created) store_metadata("/ram/cart", {created = pwc_meta.created}) 


-- keep a copy for comparing external changes
cp("/ram/cart", "/ram/system/pwcv0")


-- don't want to clobber existing created timestamp; normally when copying a folder over a folder, target is considered a newly created folder
-- something similar happens inside _cp but handled separately -- don't want to clobber .created when moving via rm,cp
-- 0.2.1c update: causes double flush! (and double anywhen entry) --> set metadata in /ram/cart before copy (above)
-- if (pwc_meta and pwc_meta.created) store_metadata(save_as, {created = pwc_meta.created}) 


res = store("/ram/system/pwc.pod", save_as)

save_message = "\^:007f41417f613f00 saved cart: "..save_as
if (save_as:sub(1,8) == "/system/") save_message..= "    *** changes to /system are in ram only ***"

notify_or_print(save_message)

