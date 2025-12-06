--[[

	edit a file

	choose an editor based on extension [and possibly content if needed]

	** never runs the file -- up to caller to manage that depending on context **

	used by:
		filenav.p64: double click on file
		load.lua: to restore workspace tabs
		open() // can be used from sandboxed programs

]]

cd(env().path)


local argv = env().argv
if (#argv < 1) then
	print("usage: open filename")
	exit(1)
end

-- future: could be a list per extension (open a chooser widget)

local prog_for_ext = fetch("/appdata/system/default_apps.pod")

if (type(prog_for_ext) ~= "table") prog_for_ext = {}

prog_for_ext.lua   = prog_for_ext.lua   or "/system/apps/code.p64"
prog_for_ext.txt   = prog_for_ext.txt   or "/system/apps/notebook.p64"
prog_for_ext.pn    = prog_for_ext.pn    or "/system/apps/notebook.p64"
prog_for_ext.gfx   = prog_for_ext.gfx   or "/system/apps/gfx.p64"
prog_for_ext.map   = prog_for_ext.map   or "/system/apps/map.p64"
prog_for_ext.sfx   = prog_for_ext.sfx   or "/system/apps/sfx.p64"
prog_for_ext.pod   = prog_for_ext.pod   or "/system/apps/podtree.p64"
prog_for_ext.theme = prog_for_ext.theme or "/system/apps/themed.p64"
prog_for_ext.p8    = prog_for_ext.p8    or "/system/apps/view.p64"
prog_for_ext.png   = prog_for_ext.png   or "/system/apps/view.p64"
prog_for_ext["p8.png"]   = prog_for_ext["p8.png"]   or "/system/apps/view.p64"


local show_in_workspace = true



for i = 1, #argv do

	if (argv[i] == "-b") then
		-- open in background
		show_in_workspace = false
	elseif (argv[i] == "-j") then
		-- jump to matching window if one exists
		force_jump = true
	elseif (argv[i] == "-n") then
		-- force open in new window / tab
		force_new_window = false
	elseif fullpath(argv[i]) then

		-- for each file in args list
		filename = fullpath(argv[i])

		-- default: jump to existing editor for cart files, but open in a new window otherwise
--		local jump_to_matching_window = filename:sub(1, 10) == "/ram/cart/"
		local jump_to_matching_window = false -- could be a system-wide option?

		-- override with env().jump_to_matching_window
		if (env().jump_to_matching_window ~= nil) jump_to_matching_window = env().jump_to_matching_window -- set by infobar
		-- -j / -n has final say
		if (force_jump) jump_to_matching_window = true
		if (force_new_window) jump_to_matching_window = false


		if (fstat(filename) == "folder") then

			-- open folder / cartridge
			create_process("/system/apps/filenav.p64", 
			{
				argv = {filename},
				window_attribs = {show_in_workspace = show_in_workspace}
			})

		else

			local prog_name = prog_for_ext[filename:ext()]
			if (not prog_name) then
				-- no preferred program to open with; check metadata for recommended bbs:// program
				-- (bbs:// only -- maybe dangerous to allow un-sandboxed programs to open a file that 
				-- could be crafted to exploit some weakness in that program's loader)
				-- note: bbs program includes the version number! could optionally strip it here
				-- to do: run most recent version by default? [if online]
				local meta = fetch_metadata(filename)
				if (meta and meta.prog and meta.prog:prot() == "bbs") prog_name = meta.prog
			end

			if (prog_name) then
				
				-- tabs are orded by process id, so these will show up in the same order
				-- (see wm.lua "add to tabs")

				create_process(prog_name,
					{
						argv = {filename},
						fileview = {{location=filename, mode="RW"}}, -- let sandboxed app read/write file
						window_attribs = {
							show_in_workspace = show_in_workspace,
							jump_to_matching_window = jump_to_matching_window
						},
						highlight = env().highlight -- used by wrangler; sent by infobar when [ctrl-]click on error message to open new tab
					}
				)

--				flip() flip() flip() flip()

			else
				-- to do: use podtree (generic pod editor)
				print("no program found to open "..filename)

				notify("no program found to open "..filename)
			end
		end
	else
		print("could not resolve: "..argv[i])
		printh("could not resolve: "..argv[i])
	end
end
