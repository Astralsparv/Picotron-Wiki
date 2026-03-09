# fetch(filename,[options])

## Overview

`fetch` fetches a file; this can be from a local path (if it is accessible from the picotron drive) and online.

Unless this is an online fetch with `on_complete` in the options, it is a blocking function and stalls the process.

This returns the filedata and the metadata.

When running under web, `/appdata` (and only `/appdata`) is persisted using Indexed DB storage.

This applies to both html exports and carts running on the BBS.

## Arguments

### `filename`: string

The filename to fetch from.

This can be from online, e.g: from the `bbs://`, `http://` or `https://` protocols.

### `[options]`: table

The available options are:

#### `on_complete`: function

This is for online fetches only.

A callback method that is called with the filedata when it fetches; this makes fetch non-blocking and asynchronous.

#### `raw_str`: boolean

Whether to return the raw string of a file; this can fix some files that can fail to fetch when they have picotron metadata, e.g: `.p8` files.

#### `argb`: boolean

Whether to return the raw picture data of a `.png`; the same that it used to before `png` fetches converted into [`userdata u8`](/picotron_api/userdata/) automatically.

## Returns

### `filedata`: any|nil

The filedata of the file.

This does not return anything when `[options].on_complete` is present as it becomes asynchronous.

### `meta`: table

The metadata of the file; seems to fail with local fetches.

This does not return anything when `[options].on_complete` is present as it becomes asynchronous.