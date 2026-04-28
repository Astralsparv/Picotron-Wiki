# BBS

## Overview

The BBS is a protocol that connects to the lexaloffle BBS for Picotron - allowing you to download and run cartridges that have been posted onto the BBS.

The structure of the BBS protocol is typically `bbs://{cart_id}-{revision}.p64`, where cart_id is the BBS upload ID and revision is a number starting with 0.

You may also enter `bbs://` into filenav to browse a limited categorized filesystem interface of cartridges directly.

You are unable to publish cartridges to the BBS from the BBS protocol; you will have to use [here](https://www.lexaloffle.com/picotron.php?page=submit) to upload Picotron Cartridges.

## User

By fetching `bbs://user/{user_id}` you are able to retrieve the username and Picotron icon of any [LXO Account](/environment/lexaloffle_online/readme.md) directly. The format of the returned data is:

### icon: `userdata`

A 16x16 userdata sprite (u8), being the user's icon.

### icon_b64: `string`

The encoded b64 icon of a user; lacking "b64:" at the start

### user_id: `string`

The ID of the user; this won't ever change (even if someone changes their username).

### username: `string`

The username of the user; this may change over time, use the `user_id` if you need something unchanging.
