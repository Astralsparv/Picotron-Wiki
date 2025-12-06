--[[pod_format="raw",created="2025-07-15 02:15:51",modified="2025-07-15 02:15:51",prog="bbs://strawberry_src.p64",revision=0,xstickers={}]]

local dat = fetch("/appdata/system/default_apps.pod")
if (type(dat) != "table") dat = {}



if (type(env().argv[1]) ~= "string") then
	
	print("\fdUsage: \f7default_app ext path_to_program")
	print("\fcSets the default application for a given file extension.")
	print("\fde.g.: \f7default_app loop /apps/tools/loop_editor.p64")
	print("\fdBBS cart: \f7default_app lua bbs://strawberry_src.p64")
	print("\fcTo remove a default app: \f7default_app lua")
	print("\fcTo list current extensions: \f7default_app -l")
	exit()
end

if env().argv[1] == "-l" then
	for k,v in pairs(dat) do
		print("\fe"..k.." \f7"..v)
	end
	exit()
end

local ext = env().argv[1]
local prog = env().argv[2]

-- #foo shorthand for bbs:// carts
if (type(prog) == "string" and prog[1] == "#") then
	prog = "bbs://"..prog:sub(2)
	if (prog:ext() ~= ".p64") prog..=".p64"
end


if (not prog) then
	if (not dat[ext]) then
		print("there is no app set for that extension")
	else
		print("\f7removing default app for extension: \fe"..ext)
		print("\f6(was: \fe"..tostr(dat[ext]).."\f6)")
		dat[ext] = nil
		store("/appdata/system/default_apps.pod", dat)
	end
else

	if (not fstat(prog)) then
		print("could not find "..prog)
		exit()
	end

	-- modify entry
	dat[ext] = fullpath(prog)
	store("/appdata/system/default_apps.pod", dat)
	print("\f7set \fe."..ext.."\f7 files to be opened with \fe"..prog)
end


