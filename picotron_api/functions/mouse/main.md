# mouse([new_mx,new_my])

## Overview

`mouse` is used to get and set the positioning of the cursor.

Source: [source.lua](source.lua)

## Arguments

### new_mx

The new x position of the mouse

### new_my

The new y position of the mouse

## Returns

### mouse_x

x-coordinate of the mouse

### mouse_y

y-coordinate of the mouse

### mouse_b

a bitfield:

* 0x1 left mouse button
* 0x2 right mouse button
* 0x4 middle mouse button
 
### wheel_x

The amount scrolled on the scrollwheel in the x-axis

### wheel_y

The amount scrolled on the scrollwheel in the y-axis

## Examples

Get the properties of the mouse & print when you left click or right click.
```lua
function _update()
 mouse_x, mouse_y, mouse_b, wheel_x, wheel_y = mouse()
 if (mouse_b&0x1) then
  print("left click!")
 end
 if (mouse_b&0x2) then
  print("right click!")
 end
end
```

## Limitations

The mouse() function does not allow you to set full properties of the mouse.

This can be fixed using the following snippet to have access to the full mouse properties.

```lua
--@astralsparv
function setMouse(x,y,b)
    send_message(3,{event="mouse",mx=x,my=y,mb=b or 0})
end
```
