# Documenting the Picotron Wiki

## Current Process

If you would like to add documentation to the Picotron Wiki, please:
* create a pull request
* contact me through `@astralsparv` on discord.
* make a post on the [lexaloffle BBS post](https://www.lexaloffle.com/bbs/?pid=143916)

## How to format pages

main.md pages (e.g: functions, methods) are formatted as such:

```
# function(args,[optional args])
```

Arguments are fed with only a label for each argument

This is then given an overview, a general description of the function:

```
## Overview

This is a general overview of this subject, it does x.
```

Arguments are then fed into their own section in consecutive order

```
## Arguments

### argument1: `valid type` or `other valid type`
```

Main return values are given their own section:

```
## Returns

This function returns y
```

Any examples are placed after the return function, e.g:

```
## Examples

Prints the string "apple sauce"
````
```
print("apple sauce")
```
````
```
