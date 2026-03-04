# gui_el:attach(el): table

## Overview

Attaches a generic UI element with `el` (a table) and returns it.

## Expected attributes

### x

x-position of the element

### y

y-position of the element

### width

width of the element

### height

height of the element

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
gui = create_gui()
new_el = gui:attach{
    x=40, y=40, width=100, height=50,
    -- event callbacks can be defined dirctly inside the table initialisation:
    draw = function(self, msg)
        rrectfill(0, 0, self.width, self.height, 3, msg.has_pointer and 14 or 1)
    end
}
function _draw() cls() gui:draw_all() end
function _update() gui:update_all() end
```