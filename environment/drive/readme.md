# Picotron Drive

## Overview

The picotron drive is a folder on your [Host OS](/environment/host_os/main.md) that acts as Picotron's root directory.

The virtual drive for Picotron is found here, respective of your operating system:

* Windows: `C:/Users/Yourname/AppData/Roaming/Picotron/drive/`
* OSX: `/Users/Yourname/Library/Application Support/Picotron/drive/`
* Linux: `~/.lexaloffle/Picotron/drive/`

This can be edited in the config file.

## Important Folders

### `/system`

This is the system for Pictron, containing the lua-side API functions, wm, pm and other files for the system to run.

This, by default, is unmodifiable; but can be modified through [system patching and system persistence](/system/persistence/main.md).


### `/appdata`

This is the location that apps should store their files; and the only location that sandboxed apps can store files.

More information on appdata can be found [here](appdata/main.md)

## File Protocols

There are some file protocols for Picotron; these can be found [here](/environment/file_protocols/readme.md)
