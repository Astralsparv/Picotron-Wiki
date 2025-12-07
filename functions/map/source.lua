function map(ud, b, ...)
	
	if (type(ud) == "userdata") then
		-- userdata is first parameter -- use that and set current map
		_draw_map(ud, b, ...)
	else
		-- pico-8 syntax
		_draw_map(_current_map, ud, b, ...)
	end
end