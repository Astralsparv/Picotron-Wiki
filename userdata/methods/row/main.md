# userdata:row(row_i): row_ud
## Overview
Creates a new 2D userdata containing a single row from the given userdata.

## Arguments
### `row_i`: integer
The index of the row to fetch.

## Returns
### `row_ud`: userdata
A 2D userdata with a height of 1 and the width and type of the original userdata.

## Example
```lua
-- 01 02
-- 03 04
-- 05 06
local ud = userdata("u8", 2, 3, "010203040506")
local ud_w, ud_h, ud_t = ud:attribs()

local row = ud:row(1)
local row_w, row_h, row_t = row:attribs()

assert(row_h == 1)
assert(row_w == ud_w)
assert(row_t == ud_t)

assert(row[0] == 3)
assert(row[1] == 4)
```