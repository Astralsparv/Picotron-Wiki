# socket > methods > accept()

## Overview

This can be used with sockets that are listening to all traffic on a given port.

When a new connection is made with TCP, or a UDP message is receieved from a new address+port, `:accept()` will return a new socket that can be used to communicate with that particular client, or `nil` if there are none waiting.

## Returns

### `sock`: table|nil

A new socket used to communicate with the accepted client; `nil` if there are no clients accepted.

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
sock2 = listener_socket:accept()
```