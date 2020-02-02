# nowsdel.vim

Vim plugin to set `nowrapscan` while search (`/`, `?`) motion used in `d{motion}`.

This plugin
* sets `wrapscan` for `/`, `?`, `n`, `N`, `*`, `g*`, `#`, `g#`
* sets `nowrapscan` for `/` or `?` used as motion for operator like `d{motion}`

## Problem
When cursor is on top of line 169, `d/----<CR>` deletes lines from 169 to 197.
If item delimiter `----` on line 198 is omitted,
same operation deletes lines from 31 to 169 by `&wrapscan`.

File content with line number:
```
  1 Title: T1
  2 Author: A1
...
 30 ----
 31 Title: T2
 32 Author: A2
...
169 ----
170 Title: T3
171 Author: A3
...
198 ----
```

## See also
https://vi.stackexchange.com/questions/13374/how-to-set-nowrapscan-when-formatting-text-with-gq
