# Picotron API > GUI > Event Callbacks

## Overview

Documentation on the event callbacks in Picotron's GUIs.

Events are called with the arguments `self,msg`

## Global `msg` properties

All event callbacks will contain these properties in `msg`, alongside their element-specific properties.

### dx

Distance in pixels the mouse moved on the x axis this frame

### dy

Distance in pixels the mouse moved on the y axis this frame

### mb

Mouse buttons currently held down, as a bitfield. See [`mouse()`](/picotron_api/functions/mouse/main.md) for more info.

### mx

Position of mouse on x axis relative to this element

### my

Position of mouse on y axis relative to this element

### has_pointer

True if the mouse is currently hovering this element. Useful for mouseover effects.

## Event Callbacks

[update](update/main.md)

[draw](draw/main.md)

[click](click/main.md)

[doubleclick](doubleclick/main.md)

[tap](tap/main.md)

[doubletap](doubletap/main.md)

[release](release/main.md)

[mousewheel](mousewheel/main.md)

[drag](drag/main.md)

[hover](hover/main.md)
