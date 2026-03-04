# userdata:magnitude(): value
## Overview
For float typed userdatas, calculates the magnitude of the first row in Euclidean space.

## Returns
### `value`: number|nil
The magnitude of the first row of the userdata in Euclidean space, or nil if the userdata is not float typed.

## Example
```lua
local ud = vec(1, -2, 0.2)

local mag = ud:magnitude()
?mag -- 2.2449944320644...

-- You can normalize a userdata vector by dividing it by its magnitude.
local normalized = ud / mag
?normalized -- (0.44543540318737, -0.89087080637475, 0.089087080637475)
?normalized:magnitude() -- 1.0
```