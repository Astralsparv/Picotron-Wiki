# grab

## Overview

Indicates that the calling window has been grabbed by the user and should be moved around with the mouse.

This is useful for frameless windows and desktop toys that can not otherwise be moved.

Functions sandboxed

## Examples

This program creates a circular window that can be dragged around

```lua
window{
    width=100, height=100, 
    has_frame = false,
    cursor="grab"
}

function _draw()
    -- set masks for drawing and interacting with the window
    poke(0x547d, 0xff, 0xff)
    cls()
    circfill(50,50,49,8)
end

-- start dragging the window after a click
on_event("click", function()
    send_message(3, {event="grab"})
end)
```