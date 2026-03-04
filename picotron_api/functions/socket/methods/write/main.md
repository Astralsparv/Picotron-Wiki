# socket > methods > write(message)

## Overview

Writes the string `message` to the socket.

Returns the number of bytes written (which may be less than #str); or nil followed by an error message string.

## Returns

### `bytes`: number|nil

The amount of bytes written; nil when there is an error.

## `error`: string|nil

An error message that is returned if there is an error; nil otherwise.