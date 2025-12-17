# userdata:attribs(): width, height, type
## Overview
Gets the width, height, and type of the userdata.

## Returns
### width: integer
The number of columns in the userdata.

### height: integer
The number of rows in the userdata. Unlike the [`height`](/picotron_api/userdata/methods/height/main.md) method, 1D userdatas will return 1 for this value.

### type: "u8"|"i16"|"i32"|"i64"|"f64"
The type that the userdata contains as its string name.

## Example
```lua
local function clone_empty(ud)
	local width, height, ud_type = ud:attribs()
	return userdata(ud_type, width, height)
end
```