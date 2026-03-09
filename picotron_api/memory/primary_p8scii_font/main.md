# 0x004000 ~ 0x0047ff Primary P8SCII Font (2k)

## Overview

The primary P8SCII font, used by default.

The default primary font loaded is `/system/fonts/lil.font`

Custom fonts can be be used by directly poking the RAM value (see below), or by loading a 2k block userdata:

```lua
fetch("/system/fonts/lil_mono.font"):poke(0x4000)
```

## Structure

A font in Picotron roughly follows the PICO-8 format: a 2k block of data that encodes 256 8x8 character bitmaps.

Each character is an 8x8 bitfield (1 bit/pixel), where starting from the top, each row is a single byte starting with 0x1 on the left.

The first 128 bytes (characters 0~15 are never drawn) describe attributes of the font:

0x5600. character width in pixels (can be more than 8, but only 8 pixels are drawn)
0x5601. character width for character 128 and above
0x5602. character height in pixels
0x5603. draw offset x
0x5604. draw offset y
0x5605. flags: 0x1 apply_size_adjustments  0x2: apply tabs relative to cursor home
0x5606. tab width in pixels (used only when alt font is drawn)
0x5607. unused

The remaining 120 bytes are used to adjust the width and vertical offset of characters 16..255. Each nibble (low nibbles first) describes the adjustments for one characters:

bits 0x7: adjust character width by 0,1,2,3,-4,-3,-2,-1
bit  0x8: when set, draw the character one pixel higher (useful for latin accents)