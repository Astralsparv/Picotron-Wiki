function memmap(ud, addr, offset, len)
	if (type(addr) == "userdata") addr,ud = ud,addr -- legacy >_<
	if (_map_ram(ud, addr, offset, len)) then
		
		if (addr == 0x100000) then
			_unmap(_current_map, 0x100000) -- kick out old map
			_current_map = ud
		end
		userdata_ref[ud] = ud -- need to include a as a value on rhs to keep it held

		return ud -- 0.1.0h: allows things like pfxdat = fetch("tune.sfx"):memmap(0x30000)
	end
end