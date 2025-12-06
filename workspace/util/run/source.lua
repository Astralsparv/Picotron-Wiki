--[[

	run.lua

	run /ram/cart as the present working cartridge (same as ctrl-r), but with commandline arguments

]]

send_message(3, {
	event = "run_pwc",
	argv = env().argv,
	path = env().path
})


