# text_editor:get_text(): str_tbl

## Overview

Returns the text in the text editor as a table, each line being another element in the table.

To get the text as a single string: `table.concat(el:get_text(), "\n")`

## Returns

### `str_tbl`: table

Text in a table; each line is another element in the table.