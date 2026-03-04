# create_gui([attribs])

## Overview

Create a root GUI object with attributes `[attribs]`

The root element is the same as any other gui element, with the addition of two special methods: `draw_all()` and `update_all()`, that are normally called oncer per frame from [_draw  and _update](/picotron_api/program_structure/main.md).

The root element can be expanded into a tree by using [`gui_el:attach()`](/picotron_api/gui/attachments/attach/main.md) to add child elements.

More GUI information can be found [here](/picotron_api/gui)


## Arguments

### `[attribs]`: table

Attributes of the created GUI.

Available attributes can be found [here](/picotron_api/gui/attributes).

## Returns

### `gui`: table

Returns the GUI object you created.

## Examples

The following example program first creates a gui, and then adds 5 children to it. Each child has callbacks that allow it to be dragged, clicked, and for the colour to be changed with the mousewheel:

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

The following example program first creates a gui, and then adds 5 children to it. Each child has callbacks that allow it to be dragged, clicked, and for the colour to be changed with the mousewheel:

```lua
window(200,160)
gui = create_gui() -- create the root element
for i=1, 5 do -- add some children
    local child = gui:attach{
        x=rnd(100),y=rnd(100),width=80,height=20,
        cursor="grab", -- cursor icon when hovering
        clicks = 0, col = 7 + i -- custom attributes
    }

    function child:draw(msg)
        rrectfill(0,0,self.width,self.height,3,self.col)
        rrect(1,1,self.width-2,self.height-2,3,msg.has_pointer and 7 or 1)
        print("clicks: "..self.clicks, 8,6, 1)
    end
    
    function child:drag(msg)
        self.x += msg.dx  self.y += msg.dy
    end
    
    function child:click()
        self:bring_to_front() -- put on top
        self.clicks += 1
    end
    
    function child:mousewheel(msg)
        self.col = (self.col + msg.wheel_y) % 32
    end
end

function _draw() cls() gui:draw_all() end
function _update() gui:update_all() end
```