# userdata:get(): ...
## Overview
Returns every value in the userdata as arguments in flat index order.

## Returns
### `...`: number
Every number in the userdata.

## Example
```lua
local tab = {ud:get()} --Copies the values in the userdata into the table tab
assert(ud[0] == tab[1])
assert(ud[1] == tab[2])
-- And so on.
```

# userdata:get(i, [count]): ...
## Overview
For 1D userdatas, returns `count` sequential numbers from the userdata starting at the index `i`. If the starting index is outside the indexable range, will return 0.0.

## Arguments
### `i`: number
The index to start fetching values from. Will be floored.

### `[count]`: number
The number of values to fetch and return. Will be floored. If the number of values exceeds what is possible to retrieve from the userdata, only the ones that are retreivable are returned. Values less than 0 are undefined behavior, and are known to cause crashes. Defaults to 1.

## Returns
### `...`: number
Each of the requested numbers, or 0.0 if the starting index is out of range.

## Example
```lua
local ud = vec(3, 6, 12, 24)
ud:get(1, 3) -- 6, 12, 24
```

# userdata:get(column, [row], [count]): ...
## Overview
For 2D userdatas, returns `count` sequential numbers from the userdata starting at a specific column and row, enumerating in flat index order. If the starting index is outside the indexable range, will return 0.0.

## Arguments
### `column`: number
The horizontal index to start fetching values from. Will be floored.

### `[row]`: number
The vertical index to start fetching values from. Will be floored. Defaults to 0.

### `[count]`: number
The number of values to fetch and return. Will be floored. If the number of values exceeds what is possible to retrieve from the userdata, only the ones that are retreivable are returned. Values less than 0 are undefined behavior, and are known to cause crashes. Defaults to 1.

## Returns
### `...`: number
Each of the requested numbers, or 0.0 if the starting index is out of range.

## Example
```lua
local ud = userdata("f64", 2, 3, "0,10,20,30,40,50")
ud:get(0, 1, 3) -- 20, 30, 40
```