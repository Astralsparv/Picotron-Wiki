# userdata:column(column_i): column_ud
## Overview
Creates a new 2D userdata containing a single column from the given userdata.

## Arguments
### `column_i`: integer
The index of the column to fetch.

## Returns
### `column_ud`: userdata
A 2D userdata with a width of 1 and the height and type of the original userdata.

## Example
```lua
-- 01 02 03
-- 04 05 06
local ud = userdata("u8", 3, 2, "010203040506")
local ud_w, ud_h, ud_t = ud:attribs()

local column = ud:column(1)
local column_w, column_h, column_t = column:attribs()

assert(column_h == ud_h)
assert(column_w == 1)
assert(column_t == ud_t)

assert(column[0] == 2)
assert(column[1] == 5)
```