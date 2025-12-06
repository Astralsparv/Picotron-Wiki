### from the [main page](https://www.lexaloffle.com/picotron.php?page=roadmap)

# Picotron Roadmap

## Picotron 0.0: "Playground" (2022 Q4)

// Open-access web build for testing (became unavailable at 0.1)

Architecture	// File system, system events, memory mapping, wm

GFX Pipeline	// Colour tables, draw state

API	// Based on Lua 5.4, compatible w/ PICO-8 where possible

CPU	// Find costs that roughly match slowest hosts

Audio	// Synthesizer runtime & test carts

** offline for now, but will come back later in some form

## Picotron 0.1 (~~2023~~ 2024-03-14)


Binary Builds	// Windows, Mac, Linux

Editors	// Code, Pixels, Maps, Synth Designer, Tracker

Desktop	// Run window-based programs, file management gui

Customisation	// Theme editor, wallpapers, screensavers

File Formats	// Plain-text .p64, Binary .p64.rom, Shareable .p64.png

HTTP GET	// From local apps and exports only; not BBS carts

BBS Integration	// Submit carts to a sub-forum, load # directly from bbs

Sandboxing	// Safe to run untrusted carts without exposing Picotron drive

HTML Exporter	// .wasm runtime + bundled cartridge, licensed similar to P8

## Picotron 0.2 (~~2024~~ 2025-03-14)


Binary Exporters	// Windows, Mac, Linux -- includes desktop export

bbs://	// [in 0.1.1e] Cross-platform bbs access; handles caching / offline access

Tooltray	// [in 0.1.1e] Install widgets into the tooltray that can run sandboxed

## Picotron 0.2.0* (2025-Q2/Q3)

Raspi 64-bit	// Requires raspi 3 or later

UDP / TCP sockets	// For binaries / exports

GFX API	// rrect, P8SCII outline / underline

Headless Programs	// interactive terminal apps, background processes

Spritesheet Importer	// load from png / p8

## Picotron 0.2.1 (2025-10)


Anywhen	// Fetch files and directory listings from any point in time

File System	// sandboxing, mounting, robustness improvements

Unsaved Changes	// monitor at the cart / file level and confirm overwrites etc

Events	// non-blocking fetch(), blocking send_message(), custom mainloops

## Picotron 0.2.2 (2025-11)

Splore

## Picotron 0.2.3 (2025-12)


Logins	// User can log in with bbs account, apps can read username

podnet://	// User-wise public storage that can be used by sandboxed apps

flp.io	// Bucket naming service; allows publishing podnet websites

Cart switching	// BBS carts can load & run other BBS carts

## Picotron 0.2.4 (2026-01)


Video Modes	// Support for extra fullscreen video modes

Native Windows	// Export carts that run directly in a native host window

Export Headless	// Export commandline programs

## Picotron 0.3 [beta] (2026-03-14)

BBS highscores	// Submit scores + extra data while logged in

Websockets	// For exports [and bbs carts] on all platforms

## Picotron 0.?

// ongoing projects / no ETA

Log Navigation	// Browse logs by category: notifications, errors, system crash etc

Gui Builder	// Gui card editor and data format integrated with create_gui

Libraries	// Standard fonts, instruments, fill patterns, palettes

Stickers	// A general tagging and bookmarking scheme (experimental)

Tool Improvements	// Miscelaneous features for bundled tools & accessories

PFX6416 Features	// pcm instrument type, sfx instruments, channel-fx envelope control

## Picotron 1.0

Runtime / API Freeze	

Extra Bundled Software	

Runtime source exporting (export foo.src)	

// Exported runtime licensing is TBD, but the focus will be on allowing cart authors to

// implement additional platform support or custom features for their own projects.