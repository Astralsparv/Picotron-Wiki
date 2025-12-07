# map(ud, [b], [...])

## Overview

`map` draws a map, either through picotron system or legacy pico-8 method

Source: [source.lua](source.lua)

## Picotron System

### ud

The map data in the datatype `userdata`

If `ud` is not in the datatype `userdata`, it follows the legacy Pico-8 format.

### [b]

Unknown

### [...]

Extra arguments that are sent through to the system _draw_map function.

### > Returns

This function does not return anything

## Legacy Pico-8 System

The legacy Pico-8 system is added for legacy support and an alternative way to use maps.

Legacy Pico-8 function

`map(celx, cely, sx, sy, celw, celh, [layer])`

### celx

The column location of the map cell in the upper left corner of the region to draw, where 0 is the leftmost column.

### cely

The row location of the map cell in the upper left corner of the region to draw, where 0 is the topmost row.

### sx

The x coordinate of the screen to place the upper left corner.


### sy

The y coordinate of the screen to place the upper left corner.

### celw

The number of map cells wide in the region to draw.

### celh

The number of map cells tall in the region to draw.

### [layer]

If specified, only draw sprites that have flags set for every bit in this value (a bitfield). The default is 0 (draw all sprites).

## Returns

This function does not return anything