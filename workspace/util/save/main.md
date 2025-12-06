# save [path]

## Overview

Runs the current loaded cartridge (`/ram/cart/`), optionally to a new location `[path]`

Source: [source.lua](source.lua)

## Arguments

### [path]

Optional location to save to, automatically appends .p64 if there is no extension

## Future

Taken from comments in zep's code

### Saving as a folder

`-- add extension when none is given (to do: how to save to a regular folder with no extension in name? maybe just don't do that?)`

Possibly making it possible to save a cartridge to a folder, rather than a .p64 file, so that the host OS can open the p64.

> This can be done by creating a folder named `cartridge.p64` in the host os in the meantime.