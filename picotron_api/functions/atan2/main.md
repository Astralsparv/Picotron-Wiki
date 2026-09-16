# atan2(dx,dy)

## Overview

`atan2` returns the angle of `dx` and `dy` as a number ranging from 0-1. As with `sin()` and `cos()` 1 is one full turn starting from east(right) going anticlockwise. 

## Arguments

### `dx`: float or int

The x direction you want to get an angle for

### `dy`: float or int

The y direction you want to get an angle for

## Examples

Move an enemy object towards the player by getting the angle and adding cosine(angle) and sine(angle) to that enemies position.
```lua
  local angle=atan2(player.pos.x-enemy.pos.x,player.pos.y-enemy.pos.y)
  local x_vector=cos(angle)
  local y_vector=sin(angle)
  enemy.pos.x+=x_vector
  enemy.pos.y+=y_vector
```
