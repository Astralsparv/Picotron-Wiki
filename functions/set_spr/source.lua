-- add or remove a sprite at index
-- flags stored at 0xc000 (16k)
function set_spr(index, s, flags_val)
	index &= 0x3fff
	_spr[index] = s    -- reference held by head
	_set_spr(index, s) -- notify process
	if (flags_val) poke(0xc000 + index, flags_val)
end