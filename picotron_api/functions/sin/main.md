# sin(a)

## Overview

`sin` gives the sine of value `a` where 1 is one full turn. `sin()` is inverted to account for screenspace. 
## Arguments

### `a`: float or int

The value you want to get the sine of.

## Examples

Print a string that wriggles up and down by offsetting it by the sine of time().

```lua
	print("\^o1ffp𝘳𝘦𝘴𝘴 ❎ t𝘰 p𝘭𝘢𝘺",30,60+sin(time()),7)
```

Sourced partly from the PICO-8 help command.
