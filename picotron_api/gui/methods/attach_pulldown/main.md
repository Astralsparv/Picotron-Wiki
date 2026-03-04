# gui_el:attach_pulldown([attribs])

## Overview

Create a pulldown menu with a list items, that closes when an item is selected.

The height is automatically determined by the number of items.

Pulldown items are added with [gui_el:attach_pulldown_item](/picotron_api/gui/methods/attach_pulldown_item/main.md)

## Arguments

### `[attribs]`: table

Generic GUI attributes alongside:

#### `onclose`: function

A callback function when the pulldown is closed/dismissed

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
gui = create_gui()

p = gui:attach_pulldown{x = 40, y=40, width=200}

p:attach_pulldown_item{label = "Thing 1", action = function(self) end}
p:attach_pulldown_item{label = "Thing 2", action = function(self) end}
p:attach_pulldown_item{divider = true}
p:attach_pulldown_item{label = "Toggle 3", action = function(self) end}

function _draw() cls() gui:draw_all() end
function _update() gui:update_all() end
```