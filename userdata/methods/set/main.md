# userdata:set(i, ...)
## Overview
For 1D userdatas, sets one or more values in the userdata starting at index `i`. Will do nothing if the starting index is out of range.

## Arguments
### `i`: number
The index to start setting values from. Will be floored.

### `...`: number
Each of the arguments to set.

## Example
```lua
local ud = userdata("f64", 6)
ud:set(3, -1, -2, -3)

?ud[0] -- 0
?ud[1] -- 0
?ud[2] -- 0
?ud[3] -- -1
?ud[4] -- -2
?ud[5] -- -3
```

# userdata:set([column], [row], ...)
## Overview
For 2D userdatas, sets one or more values in the userdata starting at a specific column and row, enumerating in flat index order. Will do nothing if the starting index is out of range.

## Arguments
### `[column]`: number
The horizontal index to start writing values to. Will be floored. Defaults to 0.

### `[row]`: number
The vertical index to start writing values to. Will be floored. Defaults to 0.

### `...`: number
Each of the arguments to set.

## Example
```lua
local ud = userdata("f64", 2, 3)
ud:set(0, 1, -12, -32, 10)

?ud:get(0, 0) -- 0
?ud:get(1, 0) -- 0
?ud:get(0, 1) -- -12
?ud:get(1, 1) -- -32
?ud:get(0, 2) -- 10
?ud:get(1, 2) -- 0
```