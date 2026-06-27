# del(table,value): element

## Overview

`del` deletes the value `value` from the table `table`, with any remaining entries shifted left one index (-1)  to avoid gaps.

For deleting an index from a table, make use of [`deli()`](/picotron_api/functions/deli/main.md).

This returns the element that was removed, or nil if none was removed.

## Arguments

### `table`: table

The table you would like to remove `value` from.

### `value`: any

The value to remove from the table `table`

## Returns

### `element`: any

Returns the deleted element; if no object was deleted, this will return nil.

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
a={1,10,2,11,3,12}
for item in all(a) do
    if (item < 10) then del(a, item) end
end
foreach(a, print) -- 10,11,12
print(a[3])       -- 12
```