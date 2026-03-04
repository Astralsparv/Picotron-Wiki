# mset(x,y,tile)

## Overview

Sets the tile at `x`,`y` to tile `tile`.

This is equivalent to userdata's [`:set`](/picotron_api/userdata/methods/set/main.md)

## Arguments

### `x`: number

The x coordinate of the tile to set

### `y`: number

The y coordinate of the tile to set

### `tile`: number

The sprite index to set at tile `x`,`y`

## Returns

### `tile`: integer

The tile at `x`,`y`.

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
mymap = userdata("i16", 32,32)
-- using standard userdata get and set:
mymap:set(1,3,42)
?mymap:get(1,3) -- 42
-- alternatively:
memmap(mymap, 0x100000) -- set mymap as the current working map
mset(1,3,117)
?mget(1,3) -- 117
```