# div(lhs, rhs, [dest], [read_start], [write_start], [group_size], [read_increment], [write_increment], [group_count]): written

## Overview
Divides elements on the left hand side by elements on the right hand side.

This function uses the userdata operator signature. Read the [bulk operations](/picotron_api/userdata/readme.md/#bulk-operations) section of the userdata documentation for a detailed explanation of how the arguments work.

## Arguments
### `lhs`: [userdata](/picotron_api/userdata/readme.md)|number
The left hand side of the division operation.

### `rhs`: [userdata](/picotron_api/userdata/readme.md)|number
The right hand side of the division operation.

### `[dest]`: [userdata](/picotron_api/userdata/readme.md)|true
The destination userdata to write to. Behavior depends on the type of `dest`, `lhs`, and `rhs`. See the table below.

|`dest`             |`lhs`       |`rhs`   |written to     |
|-------------------|------------|--------|---------------|
|userdata           |any         |any     |`dest`         |
|truthy non-userdata|userdata    |any     |`lhs`          |
|truthy non-userdata|non-userdata|userdata|`rhs`          |
|falsey             |userdata    |any     |a copy of `lhs`|
|falsey             |non-userdata|userdata|a copy of `rhs`|

### `[read_start]`: number
The starting index of the inner loop for `rhs`. Will be floored. Will be clamped to at least 0. Defaults to 0.

### `[write_start]`: number
The starting index of the inner loop for `lhs` and the destination userdata. Will be floored. Will be clamped to at least 0. Defaults to 0.

### `[group_size]`: number
The number of elements to iterate in the inner loop. Will be floored. A value of 0 or less results in a no-op. Defaults to infinity.

### `[read_increment]`: number
How many elements to move the group starting index for `rhs` forward by. A value of less than 0 will result in no iteration. Will be floored. Defaults to 1.

### `[write_increment]`: number
How many elements to move the group starting index for `lhs` and the destination userdata forward by. A value of less than 0 will result in no iteration. Will be floored. Defaults to 1.

### `[group_count]`: number
How many groups will be iterated over.

## Returns
### `written`: [userdata](/picotron_api/userdata/readme.md)
The destination userdata, as determined by the `[dest]` argument.