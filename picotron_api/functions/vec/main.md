# vec(...): ud
## Overview
The vec function is one of two ways to create a new userdata from scratch, with the other being the [userdata](picotron_api/functions/userdata/main.md) function.
Produces a new f64 typed [userdata](/picotron_api/userdata/readme.md) populated with each of the arguments and without a height value.

## Arguments
### `...`: number|nil
Each value to populate the userdata with. The number of arguments dictates the width of the produced userdata. Defaults to 0.

## Returns
### `ud`: [userdata](/picotron_api/userdata/readme.md)|nil
The userdata produced, or nil if no arguments were provided.

## Example
```lua
local position = vec(12, 19)

?position:get(0) -- 12
?position:get(1) -- 19
```
