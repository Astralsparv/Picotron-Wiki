# Using the BBS

## Overview

This guide is sourced from the [Picotron Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html).

This goes over using the [Picotron Bulletin Board System](https://www.lexaloffle.com/bbs/?cat=8).

## Uploading a Cartridge to the BBS

Cartridges can be shared on the [Lexaloffle BBS](https://www.lexaloffle.com/bbs/?cat=8):

First, capture a label while your cart is loaded and running with [CTRL-7](/environment/screenshot/main.md). For windowed programs, the label will include a screenshot of your desktop, so make sure you don't have anything personal lying around!

You can give the cartridge some metadata (title, version, author, notes) using the system app `about.p64`.
This can also be opened through the terminal.

```
about /ram/cart
```

Hit [CTRL-S](/environment/save/main.md) to save the changes made to the label and metadata.

Then make a copy of your cartridge in the `.p64.png` format just by copying it:

```
cp mycart.p64 releaseable.p64.png
```

The label will be printed on the front along with the title, author and version metadata if it exists.  You can check the output by opening the folder you saved to, and then double clicking on `releaseable.p64.png` (it is just a regular `png` image)

```
folder
```

Finally, go to the [Submit Cartridge page on the BBS](https://www.lexaloffle.com/picotron.php?page=submit) to upload the cartridge. Cartridges are not publicly listed until a BBS post has been made including the cartridge.

## Browsing BBS Cartridges

Cartridges can be browsed using the `bbs://` protocol from within filenav. In the Picotron menu (top left) there is an item "BBS Carts" that opens bbs:// in the root folder.

Cartridges can alternative be loaded directly from the BBS using the cartridge id:

```
load #cart_id
```
This is the same as `load bbs://cart_id.p64`

A specific version of the cart can be specified with the revision suffix:

```
load #cart_id-0.p64	
```

They can also be run as if they are a local file:

```
bbs://cart_id.p64
```

BBS Cartridges are all run sandboxed by default, which means they are only allowed to write to their own folder in /appdata/bbs/cart_id, among other limitations. To give a BBS cart (that you trust!) access to the entire Picotron drive, it can be loaded with  the -u switch:

```
load -u #cart_id
```

You can also use the system app Splore by entering `splore` in the terminal which lets you search, open and download BBS cartridges.

More information on the `bbs://` protocol can be found [here](/environment/file_protocols/bbs/).
