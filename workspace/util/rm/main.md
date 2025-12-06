# rm filename

## Overview

Reboots Picotron

Source: [source.lua](source.lua)

## Possible Future

Taken from comments in zep's code
Could be incorrect as zep copy pasted from `cp` command, but didn't rectify the name

```
--[[
	cp src dest

	resulting file should be idential to src (can't just fetch and then store)

	to do:
		-r recursive // rm() is currently recursive by default though
		how to do interactive copying? (prompt for overwrite)
]]
```

## [options]

### `-r`

Recursive remove

Unsure of how to handle overwriting files.