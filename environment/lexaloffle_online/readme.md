# Lexaloffle Online

## Overview

Lexaloffle Online is the online service for lexaloffle accounts in Voxatron, Pico-8 and Picotron.

These are **not** and never will be required to use any of these; and *most* Picotron Cartridges do not require it.

A Lexaloffle Online Pass ("LXO") is included with every Lexaloffle Fantasy Console, and provides access to highscore tables and Picotron Podnet file publishing, either inside the binary versions of consoles or via web.

This is used for [scoresub()](/picotron_api/functions/scoresub/main.md) and the [podnet](/environment/file_protocols/podnet/main.md) protocol.

## Creating a Lexaloffle Online account

LXO-enabled accounts are just regular Lexaloffle accounts that own one or more consoles.

You don't need to own the same console as the one you are using on the BBS web player.

If you don't have a Lexaloffle account, you can create one.

A 16x16 icon can be created from inside Picotron that is used instead of your BBS profile picture.

You can login to your LXO account on Picotron by pressing the top left Picotron icon and opening the hamburger menu.

When playing in the web player and logged in on the lexaloffle website, you are automatically logged in on the web player.

## Inviting others to join

In the future, fantasy console owners will also receive some bonus LXO passes that can be sent to friends so that they can play via the BBS website (or exported cartridges) without owning a console.

This feature will arrive around the same time as PICO-8 0.3, along with PICO-8 scoresub() support.

## Family members

"Family Accounts" are also in development, which allow a single account to have up to 5 extra player identities (each with their own username and icon) without needing to create any extra lexaloffle accounts.

## Use in exported cartridges

Cartridge authors will be able to use [scoresub()](/picotron_api/functions/scoresub/main.md) and [podnet://](/environment/file_protocols/podnet/main.md) from exports in the future, but players will still need to log in with an LXO account.

Any authors interested in bundling LXO keys with their commercial games should get in touch with Lexaloffle at hey@lexaloffle.com.