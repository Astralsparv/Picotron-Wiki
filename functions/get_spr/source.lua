-- 0.1.1e: only 32 banks (was &0x3fff). bits 0xe000 reserved for orientation (flip x,y,diagonal)
function get_spr(index)
	return _spr[flr(index) & 0x1fff]
end