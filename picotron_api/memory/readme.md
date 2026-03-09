# Picotron Memory Layout

## Overview

Picotron has 16MB of addressable RAM (`0x000000..0xffffff`), that can be manipulated using standard memory functions ( [poke](/picotron_api/poke/main.md), [memset](/picotron_api/memset/main.md) etc).

Most of the values at the following special addresses can be manipulated using API functions (e.g.[pal()](/picotron_api/functions/pal/main.md) writes values to the colour tables), but they can also be manipulated directly in memory for greater control.

## Layout

[0x000000 ~ 0x003fff Legacy PICO-8 range](legacy_pico8_range/main.md)

[0x004000 ~ 0x0047ff Primary P8SCII Font (2k)](primary_p8scii_font/main.md)

[0x005000 ~ 0x0053ff ARGB display palettes (1k)](argb_display_palettes/main.md)

[0x005400 ~ 0x005477 Per-scanline rgb display palette selection (120 bytes)](perscanline_rgb_display_palette_selection/main.md)

[0x005480 ~ 0x0054bf Indexed display palette (64 bytes)](indexed_display_palette/main.md)

[0x0054c0 ~ 0x00553f Misc draw state (128 bytes)](misc_draw_state/main.md)

[0x005580 ~ 0x0055ff Raw controller state (128 bytes)](raw_controller_state/main.md)

[0x005600 ~ 0x005dff Secondary P8SCII font (2k)](secondary_p8scii_font/main.md)

[0X005e00 ~ 0x005eff Reserved: P8 persistent state (256 bytes)](reserved_pico8_persistent_state/main.md)

[0x005f00 ~ 0x005f7f P8 draw State (some used by Picotron)](pico8_draw_state/main.md)

[0x005f80 ~ 0x007fff Reserved: legacy P8 gpio, video memory](legacy_pico8_gpio__video_memory/main.md)

[0x008000 ~ 0x00bfff Colour tables (16k)](colour_tables/main.md)

0x00c000 ~ 0x00ffff Reserved (16k)

[0x010000 ~ 0x02ffff Display / Draw Target (128k)](draw_target/main.md)

[0x030000 ~ 0x07ffff Default audio data range](default_audio_data_range/main.md)

[0x100000 ~ 0x1fffff Default map](default_map/main.md)

0x200000 ~ 0xefffff Unreserved

[0xf00000 ~ 0xffffff Wavetable data](wavetable_data/main.md)

## Other Memory locations

### Audio state

0x5538. app sfx_vol  //  0x80 means 1.0
0x5539. app music_vol//  0x80 means 1.0
0x553a. sfx vol  //  chan->mix_vol for next play
0x553b. unused
0x553c. sfx base_addr//  for next play. `0x3` means `0x30000`
0x553d. music base_addr  //  for next play. can also set with [music()](/picotron_api/functions/music/main.md)
0x553e. unused(2)
