# gui_el:attach_scrollbars([attribs])

## Overview

`gui_el` is expected to be a "container" element that has a single child (the "contents").

A vertical scrollbar will appended to the container element with the following attributes:

assumes that self is a container element, where:
* child[1] is the element to be scrolled
* child[2] is the scrollbar

Scrolling is achieved by modifying contents.x and contents.y.

These values are clamped by the scrollbar's update callback so that the contents never scrolls out of view.

## Arguments

### `[attribs]`: table

Attributes of the scrollbar; the following attributes are available:

#### `bgcol`: number

The background color.

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

#### `fgcol`: number

The foreground colour

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

#### `autohide`: boolean

When true, the bar disappears when there is nothing to scroll

## Example
This example creates a small gui, adds a parent container to be scrolled along with a child container that draws the numbers 0-99 in it's 
draw function. Lastly it attaches scrollbars to the parent container. 
```lua
function _init()
gui=create_gui()
parent_container = gui:attach{ width=20, height=50,	x=0, y=0,	}
child_container = parent_container:attach{
	width = 20, height =100*10,	x = 0, y = 0, 
	draw=function()
		for x=0,99 do print(x,0,x*10,7) end
	end
	}
parent_container:attach_scrollbars()
end

function _update() gui:update_all() end
function _draw()cls() gui:draw_all() end
```


## Future

mousewheel event should propagate up to parent though (if not defined)

horizontal bar (or generalise to 2d)
