# userdata:width(): width
## Overview
Gets the width of the userdata.

## Returns
### width: integer
The number of columns in the userdata.

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