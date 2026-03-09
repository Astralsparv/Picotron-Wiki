# search

## Overview

A search event received by the window manager prompts it to search through the open tabs of the current workspace until one is found that is editing a text file that contains the given search term: `msg.term`

If found, the same message is forwarded to that process, and that window is made active, so that (if that program supports it) the cursor jumps to the position of the first found instance of `msg.term`.

It is expected that pressing `ctrl-h` within such an editor causes it to first look for the next instance within itself, and if none is found, to then pass control to the window manager with a search event.

In this way, repeating `ctrl-h` allows control to jump back and forth between the window manager and each tab process, and to cycle through all instances of the search term in currently open tabs.

```lua
send_message(3, {event="search", term="todo"})
```

Functions sandboxed

## `msg` properties

### `term`: string

The string to search for