# userdata:cross(rhs): ud
## Overview
Calculates the cross product of the two vectors in the first three elements of the first row of two float typed userdatas. The resulting vector is orthogonal to both vectors, with a magnitude of the sine of the angle between the vectors multiplied by the magnitude of both.

## Arguments
### `rhs`: [userdata](/picotron_api/userdata/readme.md)
The right hand side of the cross product operation.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)|nil
The cross product of the vectors in the first row of `self` and `other`. If either are not float typed and at least 3 columns wide, results in nil. Any remaining values will be copied from `other`.

## Example
```lua
local x = vec(1, 0, 0)
local y = vec(0, 1, 0)
?x:cross(y) -- (0, 0, 1)
?y:cross(x) -- (0, 0, -1)

local position = vec(1, 2, 0)
local force = vec(0, 0, 5)
local torque = position:cross(force)
?torque -- (10, -5, 0)
```