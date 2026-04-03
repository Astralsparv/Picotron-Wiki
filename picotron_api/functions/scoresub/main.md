# scoresub(table_name,[score],[extra]): scores

## Overview

Retrieve and optionally store scores in the online daatbase of lexaloffle.

This requires the user to be logged in and online (even if you aren't submitting any data); whether the user is logged in or not can be checked with [`stat(64)`](/picotron_api/functions/stat/main.md).

When attempting to submit a score when there is no user logged in (not stat(64)) or the BBS is not reachable, scoresub returns nil. In the case where the network is temporarily unavailable (e.g. wifi is off on the host OS), the process will periodically re-attempt to submit the score.

This is a non-blocking function and should be continuously polled to show live changes. Submitted scores are not returned until they have made the round trip to the server.

### Rate limiting

`scoresub()` can be called frequently, but both incoming and outgoing changes to each table will update at most once per 2 seconds.

The number of different channels that can be accessed by scoresub is also limited to 4 within 10 seconds. After that, it will return nil.

### Table name spaces

Each BBS cartridge has its own namespace for highscore tables, by internally prepending the bbs id to the table name. So for example, a BBS cart `ranger-0.p64` that is using a table `level1` is actually indexing that high score table as `ranger-level1` internally.

This means that it is not possible for a BBS cartridge to conflict with another cart's high score table, or with local cartridges (which are further separated by prepending an underscore). It is unclear whether this means that local cartridges use `{cartname}_-{table}`, `_{table}` or something else.

It has been recorded that if you have a persistent system, you are placed on different leaderboards than without a persistent system.

#### Format
BBS: `{bbs_id}-{table}`
Local: (Presumably, testing needed.) `_{table}` or `{basename}_-{table}`

## Arguments

### `table_name`: string

The name of the scoresub table, used as an identifier

### `[score]`: number

`[score]` is the new score for the user; each user only has one entry.

### `[extra]`: string

`[extra]` is a string (maximum 1024 characters, cropped to 1024 when over), this can be anything, e.g: puzzle solution, a message, or extra scoring data.

## Returns

### `scores`: table

A table of scores with up to 64 entries (the top 64).

Each entry has the following fields:

#### `user_id`: string

The lexaloffle user id (unique to each user) of the player.

#### `username`: string

The lexaloffle username of the player (this may change, use `user_id` for a unique identifier)

#### `score`: number

The score of the player

#### `extra`: string

A string, up to 1024 characters, that is attached to the entry

#### `icon`: userdata u8

The user's Picotron icon (different to their lexaloffle web icon; unique to Picotron).
16x16 using colours 0-32.