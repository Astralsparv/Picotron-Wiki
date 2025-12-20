# Documenting the Picotron Wiki

## Current Process

If you would like to add documentation to the Picotron Wiki, please:
* create a pull request
* contact me through `@astralsparv` on discord.
* make a post on the [lexaloffle BBS post](https://www.lexaloffle.com/bbs/?pid=143916)

## How to format pages

main.md pages (e.g: functions, methods) are formatted as such:

For each overload of a function or method, a heading describes the signature.

```md
# class:function(args, [optional args]): returned_a, returned_b
```

Arguments and return values in the signature are just descriptive labels without specified types. For arguments which are optional, they must surrounded with [brackets].

Below the signature, a general description of what the function does and what it's used for appears under a subheading labeled "Overview".

```md
## Overview
Does x for y. Useful for cases of z. Only works when w.
```

After the overview, if the function has arguments, each will be listed in the order they appear in the signature under a subheading labeled "Arguments".

Each argument's label should be wrapped in as code using back ticks. The types should link to the relevant document page if it's part of Picotron's API.

If an argument can take different types, each possible type should be listed in that argument definition, with pipes (|) separating them. Below the argument should be a description of what it's used for and how it works.


```md
## Arguments
### `argument1`: [userdata](picotron_api/userdata/readme.md)|integer
Used to determine x. If the type is an integer, y will happen.

### `argument2`: string
The string used to do z.
```

After the arguments, if the function has return values, each will be listed in the order they appear in the signature under a subheading labeled "Returns", using the same structuring rules as the arguments.

```md
## Returns
### `return_value`: thread|nil
The thread created by x. Will return nil if y condition is not met.
```

At the end of the definition of the function, one or more examples may be added to demonstrate how the function is used.

````md
## Examples
Prints the string "apple sauce"
```
print("apple sauce")
```
````
