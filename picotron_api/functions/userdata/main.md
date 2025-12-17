# userdata(type, width, height, [data]): ud
## Overview
The userdata function is one of two ways to create a new userdata from scratch, with the other being the [vec](picotron_api/functions/vec/main.md) function.
Produces a new 2D [userdata](/picotron_api/userdata/readme.md) with a specified type and size. 2D userdatas with a height of 1 are not the same as 1D userdatas, and will cause certain functions, such as [`get`](/picotron_api/userdata/methods/get/main.md) and [`set`](/picotron_api/userdata/methods/set/main.md), to behave differently.

## Arguments
### `type`: "u8"|"i16"|"i32"|"i64"|"f64"

The type of number that the userdata will contain.
- "u8" is an unsigned 8-bit integer
- "i16" is a signed 16-bit integer
- "i32" is a signed 32-bit integer
- "i64" is a signed 64-bit integer
- "f64" is a 64-bit floating point number

### `width`: number

The number of columns in the produced userdata. Will be floored. If less than 1, causes the returned value to be nil.

### `height`: number
The number of rows in the produced userdata. Will be floored. If less than 1, causes the returned value to be nil.

### `[data]`: string
The values to initialize the userdata with. Defaults to setting every entry to 0.

If the userdata is an integer type, `data` must be formatted as a contiguous 0-padded hexidecimal string. For instance, if `type` is `i16`, the string `"000F2001"` would produce the numbers (in decimal) 15 and 8,193 for indices 0 and 1.

If the userdata is a floating point type, `data` must be formatted as a comma-separated list of decimal values. For instance, `"0.1,0.5,12"`.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)|nil
The userdata produced, or nil if `width` or `height` is less than 1.

## Example
```lua
local ud = userdata("u8", 2, 2, "080D1522")

?ud:get(0, 0) -- 8
?ud:get(1, 0) -- 13
?ud:get(0, 1) -- 21
?ud:get(1, 1) -- 34
```

# userdata(type, width, [data]): ud
## Overview
The userdata function is one of two ways to create a new userdata from scratch, with the other being the [vec](picotron_api/functions/vec/main.md) function.
Produces a new 1D [userdata](/picotron_api/userdata/readme.md) with a specified type and size. 1D userdatas are not the same as 2D userdatas with a height of 1, and will cause certain functions, such as [`get`](/picotron_api/userdata/methods/get/main.md) and [`set`](/picotron_api/userdata/methods/set/main.md), to behave differently.

## Arguments
### `type`: "u8"|"i16"|"i32"|"i64"|"f64"

The type of number that the userdata will contain.
- "u8" is an unsigned 8-bit integer
- "i16" is a signed 16-bit integer
- "i32" is a signed 32-bit integer
- "i64" is a signed 64-bit integer
- "f64" is a 64-bit floating point number

### `width`: number

The number of columns in the produced userdata. Will be floored. If less than 1, causes the returned value to be nil.

### `[data]`: string
The values to initialize the userdata with. Defaults to setting every entry to 0.

If the userdata is an integer type, `data` must be formatted as a contiguous 0-padded hexidecimal string. For instance, if `type` is `i16`, the string `"000F2001"` would produce the numbers (in decimal) 15 and 8,193 for indices 0 and 1.

If the userdata is a floating point type, `data` must be formatted as a comma-separated list of decimal values. For instance, `"0.1,0.5,12"`.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)|nil
The userdata produced, or nil if `width` is less than 1.

## Example
```lua
local ud = userdata("u8", 4, "080D1522")

?ud:get(0) -- 8
?ud:get(1) -- 13
?ud:get(2) -- 21
?ud:get(3) -- 34
```
