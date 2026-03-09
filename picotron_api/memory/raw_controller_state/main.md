# 0x005580 ~ 0x0055ff Raw controller state (128 bytes)

## Overview

The raw controller state for the 16 (`0..15`) players/connected input devices.

It is recommended to use [`btn()`](/picotron_api/functions/btn/main.md), but this is also usable; mainly used for a non-normalised controller state.

Each player is offset by 16 bytes and each button index is one byte.