# userdata:matmul(rhs, [dest], [batch_height]): ud
## Overview
Performs a matrix multiplication between two userdatas, where the left hand side has the same width as the right hand side's height. See the [matrix multiplication](/picotron_api/userdata/readme.md#matrix-multiplication) section of the userdata API reference for more information on Picotron's handling of matrices.

## Arguments
### `rhs`: [userdata](/picotron_api/userdata/readme.md)
The right hand side of the matrix multiplication operation.

### `[dest]`: [userdata](/picotron_api/userdata/readme.md)
The destination userdata to write the resulting values to.

### `[batch_height]`: integer
The [official Picotron documentation](https://www.lexaloffle.com/dl/docs/picotron_manual.html#matmul) specifies that `matmul` has a `batch_height` argument, but since matmul does not use an implicit column like [`matmul2d`](/picotron_api/userdata/methods/matmul2d/main.md) or [`matmul3d`](/picotron_api/userdata/methods/matmul3d/main.md), and the transformation specified by the right hand side applies independently to each row on the left hand side, it's unclear how this argument affects the behavior of `matmul`.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)
`dest` if provided, or a new userdata with the appropriate size, containing the values resulting from the multiplication.

## Examples
```lua
-- A matrix of two vertices, to be transformed.
local verts = userdata("f64", 3, 2)
verts:set(0, 0,
	1, 0, 0,
	0, 3, 4
)

-- Rotation matrix, rotates 45 degrees on the y axis.
local rotation_mat = userdata("f64", 3, 3)
rotation_mat:set(0, 0,
	cos(1/8),  0, sin(1/8),
	       0,  1,        0,
	-sin(1/8), 0, cos(1/8)
)

local dest = userdata("f64", 3, 2)
local returned = verts:matmul(rotation_mat, dest)

local function approx(a, b)
	return abs(b - a) < 0.001
end

-- result and returned don't just contain the same values, but are references to the exact same userdata.
assert(dest == returned)

assert(approx(dest:get(0, 0), sqrt(2) / 2))
assert(dest:get(1, 0) == 0)
assert(approx(dest:get(2, 0), -sqrt(2) / 2))

assert(approx(dest:row(0):magnitude(), verts:row(0):magnitude()))
assert(approx(dest:row(1):magnitude(), verts:row(1):magnitude()))
```