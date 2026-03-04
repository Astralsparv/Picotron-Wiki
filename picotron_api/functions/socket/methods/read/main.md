# socket > methods > read()

## Overview

Read a string from a socket.

This function is not blocking; it will return nothing when there is no data available on the socket.

On error, returns nil followed by an error message.

## Returns

### `message`: string|nil

The string read from a socket; nil when there is an error or no message

## `error`: string|nil

An error message that is returned if there is an error; nil otherwise.