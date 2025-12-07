# memmap(ud,addr,[offset],[len])

## Overview

`memmap` allows you to write a 4k (`0x1000`) userdata, `ud` to an address, `addr` in memory

Source: [source.lua](source.lua)

## Arguments

### ud

The userdata that is mapped into memory

### addr

The address to map the userdata into

Mapping to address `0x100000` automatically unmaps the loaded map data & replacing the loaded map in memory with `ud`.

### [offset]

Unknown

> Presuming that it's the offset in either memory in the userdata

### [len]

Unknown

> Presuming that it's the length of the userdata
## Returns

Returns the inputted `ud`

Allows things such as:

```
pfxdat = fetch("tune.sfx"):memmap(0x30000)
```