# cp [options] src dest

## Overview

`cp` lets you copy a file (`src`) to a folder (`dest`)

Source: [source.lua](source.lua)

## Arguments

### [options]

Optional arguments for the command

### `-f`

overwrite `dest` instead of placing it inside of `dest`

### `-n`
no clobber, skips copying files if a file with the same name already exists in `dest`

## src

The source file

## dest

Path to a folder

Overwrites the folder with option `-f`

## Future
Taken from comments in zep's code

## [options]

### `-r`

Recursive copy

Unsure of how to handle overwriting files.