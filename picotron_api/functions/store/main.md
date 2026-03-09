# store(location, obj, [metadata])

## Overview

`store` allows you to store files, typically used for save files by storing tables in the `pod` file format.

## Arguments

### `location`: string

The location you want to store a file at, e.g: `/appdata/mypod.pod`

### `obj`: any

The file data, e.g: a table for a `.pod` file.

### `[metadata]`: table

Optional metadata of the file, e.g: `{mymetadatavalue="grapes"}`

If you use `{metadata_format="none"}`, this will cut any metadata from the file.