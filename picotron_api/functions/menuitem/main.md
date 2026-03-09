# menuitem

## Overview

`menuitem` lets you edit the drop down menu on the window / context menu of the window.

This has multiple different argument setups.

Shortcuts in the form "CTRL-A".."CTRL-Z" and "CTRL-0".."CTRL-9" apply automatically

# menuitem()

## Overview

Leaving the function with no arguments clears the menu of its items

# menuitem(m)

## Overview

Picotron method for menu items, more capability than the legacy support p8 method

## Arguments

### `m`: string/table

Setting this to `---` creates a divider menu item

Otherwise modifies the menu through `m` acting as a table.

`m` having the following values can have different effects:

#### `id`: string

Sets the ID of the item, replaces any item with this id with this.

#### `label`: string

The text to display as the option

A lack of label causes the item to be deleted

#### `action`: function

A function to call when you select this option.

## Examples

The following example program uses a menu to control the draw colour:
```lua
col = 0
window{width=160, height=120} -- comment for fullscreen example
menuitem{
    id = "col_changer",
    label = "Next Colour",
    shortcut = "CTRL-N",
    action = function()
        col = (col + 1) % 10 -- cycle colour
    end
}

function _draw()
    cls(8 + col)
end
```