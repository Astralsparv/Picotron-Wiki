# mget(x,y): integer

## Overview

Returns the tile in the currently loaded map at `x`,`y`.

This is equivalent to userdata's [`:get`](/picotron_api/userdata/methods/get/main.md)

## Arguments

### `x`: number

The x coordinate of the tile to fetch

### `y`: number

The y coordinate of the tile to fetch

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