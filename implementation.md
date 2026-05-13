# Picotron Wiki Implementation

## Overview

This page goes over how to implement the Picotron Wiki in your application, whether it's for a picotron cartridge or a standalone app!

The Picotron Wiki cartridge (`#wiki`)'s code used with credit alongside the [code for the web viewer](/docs/).

## Database queries

This as entirely offline system, excluding the hosting of it through Github, so you cannot query results based on filters as you would in other databases.

There are 3 databases, being one in `json` format and two in `pod` format.

### `db.json` & `db.pod`

These two databases are identical; excluding their format.

They contain the full database of the wiki, being a rip of every markdown entry alongside storing information.

Each file is a new index, with the properties

#### name

The basename of the file, e.g: `/cart.md` is `cart.md`

#### path

The full absolute path to the markdown file

#### data

The nested array of the ripped markdown.

### `minidb.pod`

This is a smaller form factor database used to lessen memory load.

They contain only the text of the overview in each page.

They have the following properties:

#### name

The basename of the file, e.g: `/cart.md` is `cart.md`

#### path

The full absolute path to the markdown file

#### data

The array of each overview in the page, usually there is only one overview header but for functions with multiple uses and signatures.

Each element is just the text of the overview.

## Ripped markdown structure

Markdown rips of the .md file, so you don't need to individually fetch and parse markdown (also avoids ratelimiting!)
> these markdown rips have some issues! until the markdown ripper is fixed by someone, you can always fetch the .md file manually; this only causes issues with niche markdown as seen in documenting.md.

These have an array where each has a:

### level

The header level

### text

The text contained in that section

### children

Any children contained, e.g: children of a header (such as the Overview in most pages).