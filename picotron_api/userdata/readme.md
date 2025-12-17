# Picotron API > userdata

## Overview
A userdata is a specialized array type that contains numeric values, and is optimized for bulk operations. Because of this, they are an essential tool for optimizing code in Picotron.

Userdatas are especially useful for representing large amounts of numerical data in a manner that's easy to manipulate and copy. They are also a pragmatic way to do operations based in linear algebra, and have a dedicated set of vector/matrix-specific methods, such as [`magnitude()`](methods/magnitude/main.md), [`cross()`](methods/cross/main.md) and [`matmul()`](methods/magnitude/main.md).

Userdatas are a reference type. You can have multiple variables pointing to the same userdata. Many of userdata's methods and operators create and return new userdatas by default, rather than mutating the existing userdata, but unlike a string, they are still mutable by certain operations. You can create a new copy of a userdata by calling its [`copy()`](methods/copy/main.md) method with no arguments.

## Creation
Userdatas are not resizable once created. However, most of the time the actual expense of allocating a userdata is several times cheaper than the overhead of calling the Lua function that would do so. There are several ways to make a new userdata.

- From scratch, using the [`userdata()`](/picotron_api/functions/userdata/main.md) or [`vec()`](/picotron_api/functions/vec/main.md) functions.
- When using an operator on an existing userdata.
- By calling an [operation](#bulk-operations) function when the `target` argument is falsey.

## Numerical types
Every userdata is an array containing one of the following numerical types:

- u8 - An unsigned 8-bit integer.
- i16 - A signed 16-bit integer.
- i32 - A signed 32-bit integer.
- i64 - A signed 64-bit integer.
- f64 - A 64-bit floating point number, useful for representing fractional values to high precision. This is also the type that will be created by the [`vec()`](/picotron_api/functions/vec/main.md) function.

If any operation on an integer typed userdata, including setting an element explicitly, would cause a number to overflow or underflow, the value will wrap around.

## Indexing
You can fetch the total number of elements in a userdata by using the [`#`](metamethods/__len/main.md) operator, much like you would for a table array. For the number of rows or columns, you can use the [`height()`](methods/height/main.md), [`width()`](methods/width/main.md), or [`attribs()`](methods/attribs/main.md) methods.

2D userdatas are laid out contiguously in memory. The first row in its entirety is followed by the second, then the third, and so on, in lexicographical order. In other words, 2D userdatas have flat indices.

There are two ways to index a userdata. You can do it the same way you would for a table, by using the [`[i]`](metamethods/__index/main.md) syntax. You can also call the [`get()`](methods/get/main.md) method, which will allow you to use row and column indices instead of a flat index.

Unlike a table-based array, userdatas are indexed starting from 0. This is especially important to keep in mind when writing a for loop, because Lua uses inclusive/inclusive range syntax.

```lua
local tab = {0, 1, 2, 3, 4}

-- Tables are 1-indexed, meaning the final index to iterate over
-- should be the same as the total count of elements in the array.
-- This is why Lua is inclusive of #tab in the iteration.
for i = 1, #tab do
	?tab[i]
end

local ud = vec(0, 1, 2, 3, 4)

-- Userdatas are 0-indexed. The final index that should be iterated
-- is not the same as the total count of elements, meaning you will
-- have to subtract one from the count. If you forget to do this,
-- the iterator will index the userdata out of range, fetching a
-- nil value.
-- It's also worth noting you will need this mindset for ud:width()
-- and ud:height() as well, since they also give you counts, not
-- final indices.
for i = 0, #ud - 1 do
	?ud[i]
end
```

With this in mind, this snippet is meant to demonstrate where each index ends up this userdata.
```lua
-- ud is created with a layout like so:
-- 00 01 02
-- 03 04 05
-- 06 07 08
local ud = userdata("u8", 3, 3, "000102030405060708")

-- First row
assert(ud[0] == ud:get(0, 0))
assert(ud[1] == ud:get(1, 0))
assert(ud[2] == ud:get(2, 0))

-- Second row
assert(ud[3] == ud:get(0, 1))
assert(ud[4] == ud:get(1, 1))
assert(ud[5] == ud:get(2, 1))

-- Third row
assert(ud[6] == ud:get(0, 2))
assert(ud[7] == ud:get(1, 2))
assert(ud[8] == ud:get(2, 2))
```

## Dimensionality
Userdatas can have one or two dimensions. The [`userdata()`](/picotron_api/functions/userdata/main.md) function can be called with or without a `height` argument to produce a 2D or 1D userdata, respectively, and [`vec()`](/picotron_api/functions/vec/main.md) will always produce a 1D userdata.

1D userdatas do not have a height. That doesn't mean that their height value is 1 or 0, but that height is not an attribute that they keep track of. Having or not having a height is a property that is stored on the userdata. This will cause certain functions, such as [`get()`](methods/get/main.md) and [`set()`](methods/set/main.md), to behave differently, under the assumption that the effective height of a 1D userdata is always 1.

## Bulk operations
Userdatas have several bulk number manipulation methods that all work in roughly the same way. These operations are the main reason why userdatas are an attractive tool for optimization, because they skip the overhead of using a for loop in lua, where each operation costs an order of magnitude more than it would running in native code, where bulk operations do most of their work.

One-op:
- [`abs`](methods/abs/main.md)
- [`sgn`](methods/sgn/main.md)
- [`sgn0`](methods/sgn0/main.md)
- [`crc`](methods/crc/main.md)

Two-op:
- [`copy`](methods/copy/main.md)
- [`add`](methods/add/main.md)
- [`sub`](methods/sub/main.md)
- [`mul`](methods/mul/main.md)
- [`div`](methods/div/main.md)
- [`idiv`](methods/idiv/main.md)
- [`mod`](methods/mod/main.md)
- [`pow`](methods/pow/main.md)
- [`band`](methods/band/main.md)
- [`bor`](methods/bor/main.md)
- [`bxor`](methods/bxor/main.md)
- [`shl`](methods/shl/main.md)
- [`shr`](methods/shr/main.md)
- [`min`](methods/min/main.md)
- [`max`](methods/max/main.md)

The signature for these methods is `ud = lhs:op([rhs], [dest], [read_start], [write_start], [group_size], [read_increment], [write_increment], [group_count])`, but to build robust knowledge, this section will start with the most basic usage and gradually add additional features from each of the arguments.

For the one-op methods, the `rhs` argument is completely ignored. Without any arguments this will just apply the operation to every element in the userdata. `ud = lhs:abs()` will create a userdata `ud` which is identical to `lhs`, except every value will be absolute instead of signed.

For the two-op methods, `rhs` is required, and will be applied just like the respective instruction the operation is named after. `ud = lhs:div(rhs)` will produce a userdata `ud` which is identical to `lhs`, except each element will be divided by the element in `rhs` which shares the same index. `ud = vec(1, 2):div(vec(2, 3))` will produce a userdata with the elements in index 0 and 1 being 1/2 and 2/3, respectively.

Either `lhs` or `rhs` can be a scalar value, which will be broadcast to every element in the userdata on the opposite side. You can use a scalar value for the left hand side by calling the operation as a function, either on the userdata, like `ud = rhs.div(1, rhs)`, or through the `USERDATA` table, `ud = USERDATA.div(1, rhs)`. The `USERDATA` table is not mentioned in the official documentation, so while it's a perfectly practical way to do this, it is unknown if it's reliable from version to version.

Userdatas have their operators aliased to these two-op methods, so `vec(1, 2):div(vec(2, 3))` is exactly equivalent to `vec(1, 2) / vec(2, 3)`. This will allow you to use scalar values for `lhs` easily, since `rhs` will get the call with the relevant operands. For example, you can get a userdata of reciprocals through the expression `ud = 1 / vec(2, 3)`.

`dest` controls which userdata the resulting values should be written to. If `dest` is falsey, a copy of `lhs` will be created, and the values will be written to that. If `dest` is a userdata, then the values will be written into that userdata. If `dest` is some other truthy value, then the values will be written directly to `lhs`. In every case, the userdata that was written to will be returned.

```lua
local dest = vec(0, 0, 0)
local lhs = vec(1, 2)
local rhs = vec(2, 3)

-- Result will be a new userdata containing lhs/rhs.
local result = lhs:div(rhs)
-- Replaces the values in lhs with lhs/rhs.
-- The result variable will point to the same userdata as lhs.
local result = lhs:div(rhs, true)
-- Replaces the values in dest with lhs/rhs.
-- The result variable will point to the same userdata as dest.
local result = lhs:div(rhs, dest)
```

The next six arguments dictate how the userdatas will be iterated over.

`read_start` and `write_start` control where iteration will start for `rhs` and `lhs`, respectively. These both default to 0, which is why without these arguments, both inputs and the output operate on the same indices for each operation. Setting `read_start` to some other positive value will cause the indices being read from `rhs` to be offset by as much, and similarly for `write_start`, the indices being read from `lhs` and written to in the destination userdata will be offset.

The fact that the index that is being read from `lhs` is also the one being written to in the destination userdata is worth underlining. Even with additional arguments, this correlation never changes.

The operation `ud = vec(1, 2, 3):add(vec(1, 2), false, 0, 1)` will result in `ud` being populated with `1, 3, 5`. The first value is skipped, the second value is `2 + 1`, and the third value is `3 + 2`.

All iteration during the call will automatically clamp to a safe range, never letting accesses go out of bounds. What this means in this case is that if the iteration would cause the `rhs` index to go out of range of `rhs`, or the `lhs` index to go out of range of either `lhs` or the destination userdata, iteration will stop. Without the `group_count` argument, this will stop the function, and return the result immediately.

With just these arguments, it is possible to perform a prefix sum, or any running total operation, by writing to the same userdata that is being read in such a way that the written values will be revisited and used for a future operation.
```lua
local ud = userdata("i64", 10)
-- Copies 1 into every element of ud.
ud:copy(1, true)
-- Sums element i with element i + 1, and writes to element i + 1.
-- i + 1 will be immediately revisited in the next iteration as i, meaning
-- that the sum total propagates forwards with each iteration.
ud:add(ud, true, 0, 1)
ud:add(ud, true, 0, 1) -- Does it again.

for i = 0, #ud - 1 do
	?ud[i] -- Prints triangle numbers up to 55.
end
```

The `group_size` argument controls the number of consecutive elements that will be operated on. For instance, if you want to put an arbitrary section of one userdata into an equivalently sized section of another userdata, you can use `group_size` to indicate how many elements should be moved. `lhs:copy(rhs, true, 5, 2, 3)` will copy 3 consecutive elements starting from index 5 of `rhs` into `lhs` starting at index 2.

`read_increment`, `write_increment` and `group_count` control an additional layer of iteration. All three of these arguments default to 1. When `group_count` is greater than 1, the entire previous set of operations will happen that many times. Each time, `read_start` and `write_start` will be incremented by `read_increment` and `write_increment`. This is why `group_size` and `group_count` refer to 'groups'. These control the size and number of groups of concecutive elements that will be operated on.

If you wanted to divide every other element from `lhs` with each element from `rhs`, you could do so by using a `group_size` of 1, `write_increment` of 2, and `group_count` equal to the number of elements in `rhs`. The operation would look like: `ud = lhs:div(rhs, false, 0, 0, 1, 1, 2, #rhs)`

It's also possible to set `read_increment` or `write_increment` to 0, which will cause it to repeatedly index the same section of the array for each group. This is useful for broadcasting scalars and groups of values. For example, you may have a 2D userdata with 3D coordinates in each row.

If you wanted to scale them by 10, and flip them on the z axis, you could do so by calling `scaled = coords:mul(vec(10, 10, -10), false, 0, 0, 3, 0, 3, coords:height())`. By setting `read_increment` to 0, each time a coordinate is done being scaled, it will start over at the begining of the `rhs` vector for every group.

As a final example, if you had a 2D userdata that was 9x9, and you wanted to copy a 3x3 userdata with the top left sitting on the (2, 3) coordinate, you can take advantage of every argument to do so.
```lua
local bigger = userdata("u8",9,9,"1c071c0c1c0c110c11071c0c1c0c110c11101c0c1c0c110c1110110c1c0c110c111011101c0c110c11101110010c110c111011100110110c111011100110010c1110111001100100111011100110010001")

local smaller = userdata("u8",3,3,"141a141a1a1a141a14")

-- Note that because userdatas use flat indices, the element one row
-- down from any given element is located at i + ud:width().
bigger:copy(
	smaller, -- Read from smaller
	true, -- Write to bigger.
	0, -- Start reading from smaller at index 0.
	2 + bigger:width() * 3, -- Start writing to the coordinate (2, 3) on bigger.
	smaller:width(), -- Write 3 consecutive elements at a time.
	smaller:width(), -- After each group, read from the next row in smaller.
	bigger:width(), -- After each group, write to the next row in bigger.
	smaller:height() -- Write 3 rows.
)

spr(bigger) -- Draws the bigger userdata to the screen now that it's mutated.
```

This is effectively a more verbose way to implement the [`blit`](methods/blit/main.md) operation, but it demonstrates what makes these arguments flexible, and why each is useful for bulk data manipulation.

The same rules about overrunning the end of the array that applies to each individual group also applies to `read_i` and `write_i`. If either exceed the end of the array, iteration will stop, and the value will be immediately returned. Note that even if an individual group overruns, this will not stop the next group from operating if `read_i` and `write_i` are still valid indices.

## References
[userdata()](/picotron_api/functions/userdata/main.md)

[vec()](/picotron_api/functions/vec/main.md)

[methods](methods/readme.md)
