# gui_el:attach_text_editor(attribs)

## Overview

Attaches a text editor.

This is a general purpose element that can used used for single-line text fields, and large multi-line texts. Both the bundled code editor and `notepad.p64` both use this element to do most of the work.

[`attach_scrollbars()`](/picotron_api/gui/methods/attach_scrollbars/main.md) method and attributes can be changed at runtime.

Text elements have [additional methods](methods/)

## Attributes

### `x`: number

x-position of the element

### `y`: number

y-position of the element

### `width`: number

width of the element

### `height`: number

height of the element

### `[show_line_numbers]`: boolean

Whether or not to show line numbers in the text editor

### `[embed_pods]`: boolean

Whether or not to allow embedded pods to render images (e.g: a podded userdata u8)

### `[syntax_highlighting]`: boolean

Whether or not to use lua syntax highlighting

### `[show_tabs]`: boolean

Whether or not to show tabs

### `[max_lines]`: number

The maximum lines of text allowed

### `[has_search]`: boolean

Whether it has a search box (`CTRL+F` will open a search box)

### `[bgcol]`: number

The background color of the button.

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

### `[fgcol]`: number

The foreground color of the button.

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

### `[curcol]`: number

The color of the text cursor

### `[selcol]`: number

The color of the selection cursor

### `[lncol]`: number

The background color of the line numbers

### `[block_scrolling]`: boolean

When `true`, do not scroll

### `[key_callback]`: table|function

#### When a table

Per-key callbacks e.g:

```lua
{enter=function() end, tab=function() end}
```

#### When a function

Handles keypress events before they change the state of the event editor

### `[text_callback]`: table|function

#### When a table

Similar to key callback; but for textinput events, e.g. {[" "] = function() end}

#### When a function

Similar to key callback; but for textinput events.

### `[margin_top]`: number

Pixels at the top; default 3

### `[margin_bottom]`: number

Pixels at the bottom; default 4

## Returns

A child of a "container" element with a proxy is returned.

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
window{pauseable=false} -- allow pressing enter
gui = create_gui()
local text_editor = gui:attach_text_editor{
    x = 40, y = 40, width = 200, height = 200,
    key_callback = {
        -- every time enter is pressed, change the text colour
        ["enter"] = function(self, k)
            self.fgcol = rnd(16) + 8
            return nil -- don't enter a newline
        end
    }
}
function _draw() cls() gui:draw_all() end
function _update() gui:update_all() end
```

Filter out all text input except numbers
```lua
text_editor.text_callback = function(self, txt)
    if (tonum(txt)) return true -- let number pass through
    -- otherwise, discard the textinput
end
```