# userdata:distance(other): value
## Overview
Calculates the distance between the first row of two float typed userdatas in Euclidean space.

## Returns
### `value`: number|nil
The distance between the vector in the first row of `self` and `other`, or nil if either is not float typed.

## Example
```lua
local a = vec(0.07, -0.5, 0.7)
local b = vec(0.01, 0.3, 0.26)
local c = vec(0.64, 0.4, -0.3)

?a:distance(b) -- 0.91498636284299
assert(a:distance(b) < 1)

?b:distance(c) -- 0.8488227156569
assert(b:distance(c) < 1)

?a:distance(c) -- 1.4611296807837
assert(a:distance(c) > 1)
```