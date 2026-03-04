# memset(dest_addr,val,length)

## Overview

Write a byte (8-bit number) `val` into address `dest_addr` and the consecutive `length` amount of bytes.

## Arguments

### `dest_addr`: number

The address to set byte `val` at

### `val`: number

A byte (8-bit number) to put in `dest_addr` and the consecutive addresses

### `length`: number

The amount of bytes to set; occur consecutively after `dest_addr`

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

Fill half of video memory with 0xc8
```lua
> memset(0x10000, 0xc8, 0x10000)
```