# Podnet

## Overview

Podnet is a public file storage service that can be used to share pods (and other files) with other Picotron users.

Any address on podnet is accessible by anybody, within or outside of Picotron.

The structure of the podnet protocol is `podnet://{userid}/...`.

The host location for podnet is `https://podnet.flp.io/` in the structure `https://podnet.flp.io/{userid}/...`.

In the future, it will be possible to apply for flp.io sub-domains that can be pointed at particular podnet paths, so that Picotron can be used to author tiny websites.

## Limitations

* 64MB soft limit of total storage (per [LXO user](/environment/lexaloffle_online/readme.md))
* 256K file size
* 1MB per sandboxed/bbs cartridge (0.2.0c)
* Cartridges are unable to be mounted; their metadata and icon is not available
* Cartridges and lua programs are unable to be run thorugh `create_process`.
* There is no read-access control and should not be used to store sensitive information
* You cannot use [ls()](/picotron_api/functions/ls/main.md) on a podnet folder, unless you are logged into that user.

## Unsandboxed

Unsandboxed cartridges can freely read/write to podnet; not limited to `podnet://{userid}/appdata`, though it is suggested to remain in this location.

It is advised that you should store any appdata in the bbs location (`podnet://{userid}/appdata/bbs/{cartid}/...`) so that your cart/others can easily access the data in your cart without it being spread between sandboxed & unsandboxed folders.

## Sandboxed (0.2.0c)

Sandboxed cartridges are able to make limited writes to podnet in `podnet://{userid}/appdata/bbs/{bbsid}/...`, writes to `podnet://{userid}/appdata` are **not** automatically put into this new location like in the local filesystem.

There is a possibility that the future will have a `podnet://{userid}/appdata/bbs/shared` location for shared files, perhaps serving as a place to put temporary/sweep-able files if it beocmes needed.
