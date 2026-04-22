# BBS

## Overview

The BBS is a protocol that connects to the lexaloffle BBS for Picotron - allowing you to download and run cartridges that have been posted onto the BBS.

The structure of the BBS protocol is typically `bbs://{cart_id}-{revision}.p64`, where cart_id is the BBS upload ID and revision is a number starting with 0.

You may also enter `bbs://` into filenav to browse a limited categorized filesystem interface of cartridges directly.

You are unable to publish cartridges to the BBS from the BBS protocol; you will have to use [here](https://www.lexaloffle.com/picotron.php?page=submit) to upload Picotron Cartridges.

## User

By fetching `bbs://user/{user_id}` you are able to retrieve the username and Picotron icon of any [LXO Account](/environment/lexaloffle_online/readme.md) directly. The format of the returned data is:
```
{
    icon = userdata("u8",16,16,"0808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080f0f08080808080c0c0c0c0c0c0c08080f0f080808080c0c0c0c0c0c0c0c0c0f0f0f080808080c0c0f0f0f0f0f0f0c08080f080808080c0c010f0f0f0f010c08080f080808080c0c0f0f0f0f0f0f0c08080f080808080f0c0c0c0c0f0c0c0c080f080808080f0c0c0c0c0c0c0c0c0c0f080808080f080c0c0c0c0c0c0c0c0c08080808080f08080c0c0c0c0c0c0c0808080808080f0808080c0808080c080808080808080f0f0f080c0808080c080808080808080f0f02020f0202020f02020808080808080808080808080808080808080808"),
    icon_b64 = "cHh1AEMgEBAE_B0fD0hsGB44jC44HF4MGA44HAE_AQwYDjgcXgwYDjgOPA4sCA44DowOOA4IjEgOGGxYDigMKAxoLggMKAxoHhIOIg4S_AQ=",
    user_id = "1",
    username = "zep",
}
```
