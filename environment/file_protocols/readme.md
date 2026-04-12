## File Protcols

## Overview

Picotron has some built in protocols for files, allowing access to stuff stored on Lexaloffle's servers.

These are in the structure of `{protocol}://`.

## `http/https`

Hypertext transfer protocol is an application layer protocol typically used for the web; allowing for information to be requested and stored.

`https` is a secure version of this which encrypts data and is used more for privacy, whereas `http` is insecure and sends data through plaintext (no encryption).

Picotron is able to fetch from http(s) with a normal [fetch()](/picotron_api/functions/fetch/main.md) and can optionally make POST and GET requests using [fetch()](/picotron_api/functions/fetch/main.md).

## `podnet`

This is a online storage that can be read/written from within Picotron; allowing you to have 64MB of online storage per [LXO account](/environment/lexaloffle_online/readme.md).

More information on the podnet protocol can be found [here](podnet/main.md)

## `bbs`

This is the online database of carts, found on Picotron's bulletin board system.

This cannot be written to in Picotron; carts are published here through uploading picotron cartridges [here](https://www.lexaloffle.com/picotron.php?page=submit)

More information on the bbs protocol can be found [here](bbs/main.md)