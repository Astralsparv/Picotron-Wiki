# socket(addr): socket

## Overview

`socket` creates and returns a socket (TCP or UDP) at address `addr`.

Listener sockets can not be created while a process is sandboxed.

i.e. BBS carts can proactively connect to a particular address; but can not receive connections from arbitrary sources.

A socket with remote hosts writing (or connecting to) that port can then be accepted using `sock:accept()`.

Sockets allow Picotron to send data to other machines (or local programs) that support the same type of socket;  currently TCP and UDP is supported.

There is currently no web support, but web sockets will be added in the future.

Sockets have [methods](methods/) for stuff like accepting and writing.

## Arguments

### `addr`: string

The address to create the socket on.

A string consisting of the protocol (tcp:// or udp://), the ip address, followed by a port number ":1234".

IPV6 addresses should be enclosed in square brackets.

To create a listener socket; you should use `[prot://]*:[port]`.

## Returns

### `socket`: table|nil

The created socket; nil if the socket failed to create.

This has more [methods](methods/) for stuff like accepting and writing.

There is also two properties shared with the socket:

* `addr`: address
* `port`: port

## Examples

Sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html)

```lua
sock = socket("tcp://example.com:80")
sock:write("GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n")
?sock:read()
```

A UDP socket that listens to any incoming traffic
```lua
sock = socket("udp://*:8899")
```

A server that receives messages from multiple clients
```lua
-- server (paste in terminal window)
listener = socket("tcp://*:8899")
if (not listener) print("** could not create socket")
local clients = {}
print("")
while (listener) do
    print("\rlistening \f8"..("-\\|/")[1+(time()*4%4)\1])
    local new_client = listener:accept()
    if (new_client) then 
        print("\r\fcnew client!")
        print("addr: "..new_client.addr)
        print("port: "..new_client.port)
        print("")
        add(clients, new_client)
    end
    for client in all(clients) do
        local dat = client:read()
        if (dat) print("\rmessage: "..dat) print""
    end
end
```

This is interacted with by opening another terminal window and connecting to the local server
```lua
s = socket("tcp://localhost:8899")
s:write("hi!")
```