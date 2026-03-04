# socket > methods > status()

## Overview

Returns the status of the socket

## Returns

### `status`: string

The status of the socket.

One of the following:

* "ready" - the socket is ready to read/write
* "listening" - the socket was created with a wildcard (*) address and ready to :accept() connections
* "closed" - :close() was called on the socket
* "disconnected" - the socket was closed by peer, or disconnected for some other reason
* "invalid" - observed when the socket is disconnected