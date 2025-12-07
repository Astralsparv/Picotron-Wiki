-- unmap by userdata
-- ** this is the only way to release mapped userdata for collection **
-- ** e.g. memmapping a userdata over an old one is not sufficient to free it for collection **
function unmap(ud, addr, len)
	if _unmap_ram(ud, addr, len) -- len defaults to full userdata length
	then
		-- nothing left pointing into Lua object -> can release reference and be garbage collected 	
		userdata_ref[ud] = nil
	end
end