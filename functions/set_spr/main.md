# set_spr(index, s, [flags_val])

## Overview

`set_spr` adds or removes a sprite at a set index.

Sprite flags are stored at 0xc000 (16k)

Source: [source.lua](source.lua)

## Arguments

### index

The index of the sprite you're modifying in the spritesheet.

### s

The sprite data to set in sprite `index`, form of a `userdata u8`.

### [flags_val]

The flag information to be set for sprite `index`, defaults to 0

Poked into `0xc000`, offset by `index &= 0x3fff`

## Returns

This function does not return anything