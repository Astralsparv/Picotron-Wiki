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

```lua
g = create_gui()
my_container = g:attach(my_container_attribs)
my_container:attach(my_contents)
my_container:attach_scrollbars()
```

To allow mousewheel scrolling, you still need to process messages from contents as such:

```lua
function contents:mousewheel(msg)
    self.y += msg.wheel_y * 32 -- scroll speed is arbitrary
end
```

## Future

mousewheel event should propagate up to parent though (if not defined)

horizontal bar (or generalise to 2d)