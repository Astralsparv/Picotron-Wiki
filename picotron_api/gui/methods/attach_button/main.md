# gui_el:attach_button(el)

## Overview

Attaches a button with default styling

## Expected attributes

### `x`: number

x-position of the element

### `y`: number

y-position of the element

## Available attributes

### `width`: number

Width of the element. Omit to auto-calculate (see limitations)

### `height`: number

Height of the element. Omit to auto-calculate (see limitations)

### `label`: string

Text to be displayed on the button

### `fgcol`: number

The foreground color of the button.

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

For example, `18 + (7 << 8)` will use color 18 (dark purple) normally, and switch to color 7 (white) when hovered.

If the high byte is omitted, hover becomes color 0 (black).

### `bgcol`: number

The background color of the button.

A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

### `border`: number

The border color of the button.
A 16 bit number with the first 8 bits (low byte) being the normal colour; and the last 8 bits (high byte) being the color used when hovered.

## Limitations

The current automatic sizing logic is very basic and does not account for P8SCII, newlines, or fonts other than the default. In these cases you may want to provide your own width/height values.

## Future

calculate width with current font

can define a "class" or "style" at system-wide level or gui level that has these default values