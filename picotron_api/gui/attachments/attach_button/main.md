# attach_button(el)

## Overview

Attaches a button with default styling

Source: [source.lua](source.lua)

## Expected attributes

### x

x-position of the element

### y

y-position of the element

## Available attributes

### width

Width of the element. Omit to auto-calculate (see limitations)

### height

Height of the element. Omit to auto-calculate (see limitations)

### label

Text to be displayed on the button

### fgcol

Foreground color of the button. Low byte is normal color, high byte is hover color. For example, `18 + (7 << 8)` will use color 18 (dark purple) normally, and switch to color 7 (white) when hovered. If the high byte is omitted, hover becomes color 0 (black).

### bgcol

Background color of the button. Low byte is normal color, high byte is hover color.

### border

Border color of the button. Low byte is normal color, high byte is hover color.

## Limitations

The current automatic sizing logic is very basic and does not account for P8SCII, newlines, or fonts other than the default. In these cases you may want to provide your own width/height values.

## Future

calculate width with current font

can define a "class" or "style" at system-wide level or gui level that has these default values

