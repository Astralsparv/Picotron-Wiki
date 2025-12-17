# userdata:height(): height
## Overview
Gets the height of the userdata.

## Returns
### height: integer|nil
The number of rows in the userdata if the userdata is 2D, or nil if the userdata is 1D.

## Example
```lua
-- Be careful when reading the height of a userdata. It can be nil.
local h = ud:height()

if h then
	for y = 0, h - 1 do
		for x = 0, ud:width() - 1 do
			?ud:get(x, y)
		end
	end
else
	for x = 0, ud:width() - 1 do
		?ud:get(x)
	end
end
```