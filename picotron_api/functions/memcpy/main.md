# memcpy(dest_addr,source_addr,length)

## Overview

Copy `length` amount of bytes of base ram from address `source_addr` to address `dest_addr`.

Sections can be overlapping; but causes the function to be slower

## Arguments

### `dest_addr`: number

The address to copy memory to

### `source_addr`: number

The address to copy memory from

### `length`: number

The amount of bytes to copy