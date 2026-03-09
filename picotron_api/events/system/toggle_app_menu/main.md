# toggle_app_menu

## Overview

This can be used to manually show/hide the app menu.

This is useful for fullscreen programs that use `pauseable=false`, and windows that use `has_frame=false`, and thus have no access to the app menu button.

Functions sandboxed

## `msg` properties

### `x`: number

Leftmost x-position of where to open the menu relative to the window

### `y`: number

Topmost x-position of where to open the menu relative to the window

### `hide_about`: boolean

When true, do not include the "About Program" item in the menu