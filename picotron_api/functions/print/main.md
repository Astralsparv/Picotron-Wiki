# print(str,x,y,color)

## Overview

This prints text to the active display of Picotron.

When there is no graphical display, e.g: Picotron is running headless (no display), or there is no window setup - this feeds to the [`printh`](/picotron_api/functions/printh/main.md) function.

Source: [source.lua](source.lua)

## Arguments

### str

String to print

### x,y

The top left position of the text that is printed

### color

The index of the color in the color palette to draw the text in.

## Examples

Prints the CPU usage in the top left of the screen in the color white (`7`)

```lua
function _update()
    print(stat(1)*100 .."% cpu usage",0,0,7)
end
```

## Returns

Returns the width & height of the text that is printed.
```lua
width,height=print("hi")
```
