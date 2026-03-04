# date([format],[t],[delta]): string

## Overview

Returns the current day and time formatted using Lua's standard date strings.

## Arguments

### `[format]`: string

The output string format; defaults to "!%Y-%m-%d %H:%M:%S" (UTC).

Picotron timestamps use this default format.

### `[t]`: string|number

The moment in time to be encoded in a string; defaults to the current time.

When a string: the date in format "!%Y-%m-%d %H:%M:%S" (UTC)

When an integer: the epoch timestamp

### `[delta]`: number

The amount of seconds to add to `[t]`

## Returns

### `date`: string

The date requested in the requested format

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

Show the current UTC time (use this for timestamps)
```lua
?date()
```

Show the current local time
```lua
?date("%Y-%m-%d %H:%M:%S")
```
convert a UTC date to local time
```lua
?date("%Y-%m-%d %H:%M:%S", "2024-03-14 03:14:00")
```

local time 1 hour ago
```lua
?date("%Y-%m-%d %H:%M:%S", nil, -60*60)
```

