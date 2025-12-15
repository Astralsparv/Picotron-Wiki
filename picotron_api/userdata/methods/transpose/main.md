# userdata:transpose(): ud
## Overview
Swaps the `x` and `y` indices of all the values in the userdata, as well as the width and height of the userdata. This is equivalent to mirroring the userdata along the diagonal that starts from the low indices.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)
The transposed userdata.

## Example
```lua
local ud_in = userdata("u8", 2, 3)
ud_in:set(0, 0,
	1, 2,
	3, 4,
	5, 6
)

-- Transposing the userdata will reorganize it like this:
-- 1, 3, 5
-- 2, 4, 6
local ud_out = ud_in:transpose()

assert(ud_in:get(0, 0) == ud_out:get(0, 0))
assert(ud_in:get(1, 0) == ud_out:get(0, 1))
assert(ud_in:get(0, 1) == ud_out:get(1, 0))
assert(ud_in:get(1, 1) == ud_out:get(1, 1))
assert(ud_in:get(0, 2) == ud_out:get(2, 0))
assert(ud_in:get(1, 2) == ud_out:get(2, 1))
```