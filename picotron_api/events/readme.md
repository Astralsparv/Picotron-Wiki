# Picotron API > Events

## Overview

Between different Picotron processes, events can be sent through [`send_message`](/picotron_api/functions/send_message/main.md).

These can be received through [`on_event`](/picotron_api/functions/on_event/main.md) with data through a `msg` table in a callback function.

There are some default events that exist, alongside the events you can create to send data between processes, these are found [here](default_events/readme.md)

There are some system messages that can be used, these can be found [here](system/readme.md)

## Event properties

All events have the following properties in `msg`:

### _from_proc_id

The Process ID that the event is sent from.