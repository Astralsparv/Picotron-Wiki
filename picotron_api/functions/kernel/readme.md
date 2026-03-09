# Picotron API > Functions > Kernel Functions

## Overview

Kernel functions are special functions allocated for boot.lua, the window manager and the process manager.

These are disabled for cartridges through the use of `/system/lib/jettison.lua`

This can be re-enabled through the use of the following snippet ***first thing in the program***; this will temporarily disable `jettison.lua` to re-run itself, then enabling `jettison.lua` and exiting the program.

This snippet is sourced from @Soupster (found in the Picotron Discord server).

```lua
if not _warp_mouse then
    local jettison = fetch"/system/lib/jettison.lua" -- Store a copy of jettison.lua
    store("/system/lib/jettison.lua", "") -- Remove the file contents / disable jettison.lua
    
    -- Wait a safe amount of time for the changes to update
    for i = 1, 5 do flip() end
    
    create_process(pwd()) -- Create a copy of the program (pwd() returns the program's location)
    
    for i = 1, 5 do flip() end -- Ensure the process has been created with the non-existent jettison.
    
    store("/system/lib/jettison.lua", jettison) -- Fix jettison.lua
    exit() -- Close the program
end
```

It may be of use to note that zep writes "kernel" as "kernal", seen through comments and functions like [`_userland_to_kernal_path`](/picotron_api/functions/kernel/_userland_to_kernal_path/main.md).

## Functions

### Processes

[_ppeek](_ppeek/main.md)

[_ppeek4](_ppeek4/main.md)

[_blit_process_video](_blit_process_video/main.md)

[_env](_env/main.md)

[_kill_process](_kill_process/main.md)

## Files

[_cd](_cd/main.md)

[_userland_to_kernal_path](_userland_to_kernal_path/main.md)

[_fstat](_fstat/main.md)

[_fullpath](_fullpath/main.md)

### Uncategorised

[_warp_mouse](_warp_mouse/main.md)

[_apply_system_settings](_apply_system_settings/main.md)

[_pod](_pod_raw/main.md)

[_pod_raw](_pod_raw/main.md)

[_crc](_crc/main.md)