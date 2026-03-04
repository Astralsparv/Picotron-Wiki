# max( a, b )

## Overview
Returns the bigger of two numbers. 

## Arguments

### `a`: number
A number to be compared with b

### `b`: number
A number to be compared with a

## Returns

### `max`: number
The bigger of the two numbers

## Examples

Make sure a value doesn't go below zero, useful for healthbars and bounding boxes.
```lua
player.hp = max( 0, player.hp-1 )
```
