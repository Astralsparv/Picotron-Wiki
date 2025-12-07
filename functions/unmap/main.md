# unmap(ud,addr,[len])

## Overview

this is the only way to release mapped userdata for collection

e.g. memmapping a userdata over an old one is not sufficient to free it for collection

Source: [source.lua](source.lua)

## Arguments

### ud

The userdata that is unmapped from memory

### addr

The address to unmap the userdata from

### [len]

Length of the userdata to unmap, defaults to the full userdata length

## Returns

This function does not return anything