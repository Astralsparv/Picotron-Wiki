# userdata:dot(other): value
## Overview
Calculates the dot product of the vectors on the first row of two float typed userdatas. The resulting value is the cosine of the angle between the two first-row vectors multiplied by the magnitude of both.

## Arguments
### `other`: [userdata](/picotron_api/userdata/readme.md)
The other userdata to perform a dot product with.

## Returns
### `value`: number|nil
The dot product of the vectors in the first row of `self` and `other`, or nil if either is not float typed, or they are not the same width.

## Example
```lua
-- Each of these vectors is normalized. This means fully parallel vectors will result in 1.
local a = vec(-0.47942554, 0.87758256)
local b = vec(0.87758256, 0.47942554)
local c = vec(0.9004471, 0.43496553)

assert(a:dot(b) == 0) -- a and b are perpendicular.
?a:dot(c) -- -0.04997917382977 - a is almost perpendicular with c, facing slightly away.
?b:dot(c) --  0.99875025526421 - b is almost fully aligned with c.
```