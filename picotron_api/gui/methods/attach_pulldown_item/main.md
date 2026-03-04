# gui_el:attach_pulldown_item([attribs])

## Overview

Attach a pulldown item to a [pulldown element](/picotron_api/gui/methods/attach_pulldown/main.md)

The height is automatically determined by the number of items.

Pulldown items can also have unique attributes; the same thing used by menus created with [menuitem](/picotron_api/functions/menuitem/main.md):

## Attributes

### `label`: string
Label for the element

### `shortcut`: string

Text on the right showing a keyboard shortcut (e.g. "CTRL-A")

### `stay_open`: boolean

When true, the pulldown does not automatically close on selection

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