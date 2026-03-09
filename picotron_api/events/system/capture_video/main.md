# capture_video

## Overview

Initiates a video capture (gif)

Functions sandboxed

## `msg` properties

### `x`: number

Leftmost x-position of the recording

### `y`: number

Topmost y-position of the recording

### `width`: number

Width of the recording

### `height`: number

Height of the recording

### `scale`: number

The scaling of the output gif (1 being 100% of original, 2 being 200% / 2x of original)

### `frames`: number

The amount of frames to capture (records at ~30fps)

### `delay`: number

Delay before starting a recording

### `silent`: boolean

When true, do not notify user of video capture