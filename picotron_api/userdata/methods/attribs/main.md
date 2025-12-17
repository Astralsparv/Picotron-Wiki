# userdata:attribs(): width, height, type
## Overview
Gets the width, height, and type of the userdata.

## Returns
### width: integer
The number of columns in the userdata.

### height: integer
The number of rows in the userdata. Unlike the [`height`](/picotron_api/userdata/methods/height/main.md) method, 1D userdatas will return 1 for this value.

## Example
```lua
for y = 0, ud:height() - 1 do
	for x = 0, ud:width() - 1 do
		?ud:get(x, y)
	end
end
```