# userdata:matmul2d(rhs, [dest], [batch_height]): ud
## Overview
Performs a matrix multiplication between two userdatas, where the left-hand side (LHS) has at least two columns, and the right-hand side (RHS) has three rows, and at least two columns. Only elements in the first two columns of the LHS will be transformed in the output, with the remaining columns being untouched. Similarly, only the first two columns of the RHS will contribute to the transformation. There is an implicit third column on the RHS, containing the values (0, 0, 1), representing the W-axis of a homogeneous coordinate system. This is done so that the third row of the RHS can serve as a translation offset.

This method is especially suitable for 2D graphics transformations. Because of the assumptions this method makes, fewer elements per userdata participate in the multiplication, making this method faster than [`matmul`](/picotron_api/userdata/methods/matmul/main.md). See the [matrix multiplication](/picotron_api/userdata/readme.md#matrix-multiplication) section of the userdata API reference for more information on Picotron's handling of matrices.

## Arguments
### `rhs`: [userdata](/picotron_api/userdata/readme.md)
The right-hand side of the matrix multiplication.

### `[dest]`: [userdata](/picotron_api/userdata/readme.md)
The destination userdata to write the resulting values to.

### `[batch_height]`: 1|3
Whether the LHS represents a set of vectors, or of transformation matrices.

When set to 1, the left-hand side will have an implicit third column where each row contains 1, causing translation to be applied to every row.

When set to 3, the left-hand side is expected to contain a set of 2x3 matrices stacked vertically, and its implicit third column will contain a repeating sequence of (0, 0, 1), causing translation to only be applied to the translation rows of those matrices.

Defaults to 1 or 3, matching the height of the left-hand side. Otherwise the transformation will fail.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)
`dest` if provided, or a new userdata of the same size as the left-hand side, where the first two columns have been transformed, and the remaining columns are retained from the left-hand side argument. If `[batch_height]` is not provided, and the height of the left hand side is not 1 or 3, returns nil.