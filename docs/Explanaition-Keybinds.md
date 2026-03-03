# Neovim Keybinds Documentation

> Leader key: `<Space>`

---

## Toetsencombinatie Legenda

| Notatie    | Toets      | Voorbeeld                           |
| ---------- | ---------- | ----------------------------------- |
| `<leader>` | Spatiebalk | `<leader>ff` = `Spatie` + `f` + `f` |
| `<C-...>`  | Ctrl       | `<C-h>` = `Ctrl` + `h`              |
| `<A-...>`  | Alt        | `<A-j>` = `Alt` + `j`               |
| `<M-...>`  | Alt (Meta) | `<M-a>` = `Alt` + `a`               |
| `<S-...>`  | Shift      | `<S-h>` = `Shift` + `h`             |
| `<CR>`     | Enter      |                                     |
| `<Esc>`    | Escape     |                                     |
| `<Tab>`    | Tab        |                                     |
| `<BS>`     | Backspace  |                                     |

### Gecombineerde Modifiers

| Notatie     | Toetsen      | Voorbeeld                          |
| ----------- | ------------ | ---------------------------------- |
| `<C-S-...>` | Ctrl + Shift | `<C-S-P>` = `Ctrl` + `Shift` + `p` |
| `<C-A-...>` | Ctrl + Alt   | `<C-A-d>` = `Ctrl` + `Alt` + `d`   |

### Modes

| Letter | Mode             | Beschrijving                        |
| ------ | ---------------- | ----------------------------------- |
| `n`    | Normal           | Standaard mode (navigatie)          |
| `i`    | Insert           | Tekst invoeren                      |
| `v`    | Visual           | Tekst selecteren                    |
| `x`    | Visual Block     | Block selectie                      |
| `c`    | Command          | Command-line (`:`)                  |
| `t`    | Terminal         | Terminal mode                       |
| `o`    | Operator-pending | Na een operator zoals `d`, `y`, `c` |

---

## Inhoudsopgave

1. [Basis Navigatie](#basis-navigatie)
2. [Window Management](#window-management)
3. [Buffer Management](#buffer-management)
4. [File Navigation](#file-navigation)
5. [LSP Keybinds](#lsp-keybinds)
6. [Git Keybinds](#git-keybinds)
7. [Telescope (Find)](#telescope-find)
8. [Harpoon](#harpoon)
9. [Testing (Neotest)](#testing-neotest)
10. [Trouble & Diagnostics](#trouble--diagnostics)
11. [TODO Comments](#todo-comments)
12. [Search & Replace (Spectre)](#search--replace-spectre)
13. [Session Management](#session-management)
14. [Code Outline (Aerial)](#code-outline-aerial)
15. [Focus Mode (Zen/Twilight)](#focus-mode-zentwilight)
16. [Text Manipulation](#text-manipulation)
17. [Mini.ai Text Objects](#miniai-text-objects)
18. [Noice & UI](#noice--ui)
19. [Terminal](#terminal)
20. [Package.json (npm)](#packagejson-npm)

---

## Basis Navigatie

| Keybind      | Mode | Actie                  | Bestand     |
| ------------ | ---- | ---------------------- | ----------- |
| `<Esc>`      | n    | Clear search highlight | keymaps.lua |
| `<Esc><Esc>` | t    | Exit terminal mode     | keymaps.lua |
| `<C-h>`      | n    | Move window left       | keymaps.lua |
| `<C-j>`      | n    | Move window down       | keymaps.lua |
| `<C-k>`      | n    | Move window up         | keymaps.lua |
| `<C-l>`      | n    | Move window right      | keymaps.lua |
| `<C-h>`      | i    | Move cursor left       | keymaps.lua |
| `<C-j>`      | i    | Move cursor down       | keymaps.lua |
| `<C-k>`      | i    | Move cursor up         | keymaps.lua |
| `<C-l>`      | i    | Move cursor right      | keymaps.lua |
| `<F1>`       | all  | Disabled               | keymaps.lua |

### Quickfix & Location List Navigation

| Keybind | Mode | Actie          |
| ------- | ---- | -------------- |
| `]q`    | n    | Next quickfix  |
| `[q`    | n    | Prev quickfix  |
| `]l`    | n    | Next loclist   |
| `[l`    | n    | Prev loclist   |

---

## Window Management

| Keybind     | Mode | Actie                  |
| ----------- | ---- | ---------------------- |
| `<C-h>`     | n    | Focus window left      |
| `<C-j>`     | n    | Focus window down      |
| `<C-k>`     | n    | Focus window up        |
| `<C-l>`     | n    | Focus window right     |
| `<C-Up>`    | n    | Increase window height |
| `<C-Down>`  | n    | Decrease window height |
| `<C-Left>`  | n    | Decrease window width  |
| `<C-Right>` | n    | Increase window width  |

---

## Buffer Management

| Keybind      | Mode | Actie                      | Plugin     |
| ------------ | ---- | -------------------------- | ---------- |
| `<S-h>`      | n    | Previous buffer            | bufferline |
| `<S-l>`      | n    | Next buffer                | bufferline |
| `<S-q>`      | n    | Close buffer               | bufferline |
| `[B`         | n    | Move buffer left           | bufferline |
| `]B`         | n    | Move buffer right          | bufferline |
| `<leader>bp` | n    | Toggle pin buffer          | bufferline |
| `<leader>bP` | n    | Close non-pinned buffers   | bufferline |
| `<leader>br` | n    | Close buffers to the right | bufferline |
| `<leader>bl` | n    | Close buffers to the left  | bufferline |
| `<leader>bb` | n    | List open buffers          | telescope  |

---

## File Navigation

| Keybind      | Mode | Actie                       | Plugin    |
| ------------ | ---- | --------------------------- | --------- |
| `-`          | n    | Open Oil file explorer      | oil.nvim  |
| `<leader>sf` | n    | File browser at buffer path | telescope |

---

## LSP Keybinds

> Deze keybinds werken alleen in buffers met LSP attached.

| Keybind      | Mode | Actie                 |
| ------------ | ---- | --------------------- |
| `gd`         | n    | Go to definition      |
| `gD`         | n    | Go to declaration     |
| `gr`         | n    | Go to references      |
| `gi`         | n    | Go to implementation  |
| `gy`         | n    | Go to type definition |
| `gO`         | n    | Document symbols      |
| `gW`         | n    | Workspace symbols     |
| `grn`        | n,x  | Rename symbol         |
| `<leader>.`  | n,x  | Code action           |
| `<leader>th` | n    | Toggle inlay hints    |

---

## Git Keybinds

### LazyGit (Primary Git UI)

| Keybind      | Actie                  |
| ------------ | ---------------------- |
| `<leader>gg` | LazyGit (root repo)    |
| `<leader>gG` | LazyGit (current file) |

### Diffview

| Keybind      | Actie                |
| ------------ | -------------------- |
| `<leader>gv` | Open Diffview        |
| `<leader>gV` | Close Diffview       |
| `<leader>gh` | File history         |
| `<leader>gH` | Current file history |

### Git Worktree

| Keybind      | Actie           |
| ------------ | --------------- |
| `<leader>gw` | Git worktrees   |
| `<leader>gW` | Create worktree |

### Gitsigns (Hunk Navigation)

| Keybind | Mode | Actie                     |
| ------- | ---- | ------------------------- |
| `]c`    | n    | Next hunk                 |
| `[c`    | n    | Previous hunk             |
| `ih`    | o,x  | Select hunk (text object) |

---

## Telescope (Find)

| Keybind       | Actie                   |
| ------------- | ----------------------- |
| `<leader>ff`  | Find files              |
| `<leader>fr`  | Live grep with args     |
| `<leader>fg`  | Git files               |
| `<leader>fh`  | Recent files (oldfiles) |
| `<leader>fH`  | Help tags               |
| `<leader>fb`  | Fuzzy find in buffer    |
| `<leader>fw`  | Find word under cursor  |
| `<leader>fW`  | Find WORD under cursor  |
| `<leader>fe`  | Show diagnostics        |
| `<leader>fs`  | Treesitter symbols      |
| `<leader>fc`  | LSP incoming calls      |
| `<leader>fj`  | Jumplist                |
| `<leader>fk`  | Keymaps                 |
| `<leader>fm`  | Marks                   |
| `<leader>fq`  | Quickfix list           |
| `<leader>fQ`  | Location list           |
| `<leader>f/`  | Search history          |
| `<leader>f:`  | Command history         |
| `<leader>fv`  | Vim options             |
| `<leader>ft`  | Find TODOs              |
| `<leader>fgb` | Git branches            |
| `<leader>fgc` | Git commits             |
| `<leader>fgs` | Git status              |
| `<leader>;;`  | Resume last picker      |
| `<leader>bb`  | List buffers            |
| `<leader>sf`  | File browser            |

### Telescope Insert Mode Mappings

| Keybind | Actie                     |
| ------- | ------------------------- |
| `<C-j>` | Move selection next       |
| `<C-k>` | Move selection previous   |
| `<C-n>` | Cycle history next        |
| `<C-p>` | Cycle history prev        |
| `<C-q>` | Send to quickfix          |
| `<C-a>` | Send selected to quickfix |
| `<C-x>` | Open horizontal split     |
| `<C-v>` | Open vertical split       |
| `<C-t>` | Open in new tab           |
| `<C-u>` | Preview scroll up         |
| `<C-d>` | Preview scroll down       |

---

## Harpoon

> Quick file navigation met Alt-keys

| Keybind   | Actie                     |
| --------- | ------------------------- |
| `<A-a>`   | Add file to harpoon       |
| `<A-e>`   | Toggle harpoon quick menu |
| `<A-h>`   | Select harpoon file 1     |
| `<A-j>`   | Select harpoon file 2     |
| `<A-k>`   | Select harpoon file 3     |
| `<A-l>`   | Select harpoon file 4     |
| `<C-S-P>` | Previous harpoon file     |
| `<C-S-N>` | Next harpoon file         |

---

## Testing (Neotest)

| Keybind      | Actie               |
| ------------ | ------------------- |
| `<leader>nt` | Run nearest test    |
| `<leader>nf` | Run file tests      |
| `<leader>ns` | Toggle test summary |
| `<leader>no` | Toggle test output  |
| `<leader>nS` | Stop test           |

---

## Trouble & Diagnostics

> Mooie UI voor diagnostics, quickfix, en meer

| Keybind      | Actie                        |
| ------------ | ---------------------------- |
| `<leader>xx` | Toggle diagnostics           |
| `<leader>xX` | Toggle buffer diagnostics    |
| `<leader>xs` | Toggle symbols               |
| `<leader>xl` | LSP definitions / references |
| `<leader>xL` | Toggle location list         |
| `<leader>xq` | Toggle quickfix list         |
| `<leader>xt` | Toggle TODO comments         |
| `<leader>xT` | Toggle TODO/FIX/FIXME only   |

---

## TODO Comments

> Highlight en navigeer naar TODO/FIXME/NOTE comments

| Keybind      | Actie                      |
| ------------ | -------------------------- |
| `]t`         | Next TODO comment          |
| `[t`         | Previous TODO comment      |
| `<leader>ft` | Find all TODOs (Telescope) |
| `<leader>xt` | TODOs in Trouble           |

**Ondersteunde keywords:** TODO, FIXME, HACK, WARN, PERF, NOTE, TEST

---

## Search & Replace (Spectre)

> Project-wide search and replace

| Keybind      | Mode | Actie                   |
| ------------ | ---- | ----------------------- |
| `<leader>sr` | n    | Open Spectre            |
| `<leader>sw` | n    | Search current word     |
| `<leader>sw` | v    | Search selection        |
| `<leader>sp` | n    | Search in current file  |

### Spectre Buffer Mappings

| Keybind     | Actie                |
| ----------- | -------------------- |
| `dd`        | Toggle line          |
| `<CR>`      | Open file            |
| `<leader>R` | Replace all          |
| `<leader>c` | Input replace cmd    |
| `<leader>o` | Show options         |
| `tu`        | Toggle live update   |
| `ti`        | Toggle ignore case   |
| `th`        | Toggle hidden files  |

---

## Session Management

> Automatisch sessies opslaan en herstellen

| Keybind      | Actie                 |
| ------------ | --------------------- |
| `<leader>qs` | Restore session       |
| `<leader>ql` | Restore last session  |
| `<leader>qd` | Don't save session    |
| `<leader>qS` | Select session        |

---

## Code Outline (Aerial)

> Symbolen sidebar voor navigatie

| Keybind     | Actie                |
| ----------- | -------------------- |
| `<leader>a` | Toggle Aerial        |
| `<leader>A` | Toggle Aerial Nav    |
| `]a`        | Next symbol          |
| `[a`        | Previous symbol      |

---

## Focus Mode (Zen/Twilight)

> Distraction-free coding

| Keybind      | Actie           |
| ------------ | --------------- |
| `<leader>zz` | Toggle Zen Mode |
| `<leader>zt` | Toggle Twilight |

---

## Text Manipulation

### Line Operations

| Keybind     | Mode  | Actie                           |
| ----------- | ----- | ------------------------------- |
| `<leader>d` | n     | Duplicate line                  |
| `<leader>d` | v     | Duplicate selection             |
| `<A-Down>`  | n,i,v | Move line(s) down               |
| `<A-Up>`    | n,i,v | Move line(s) up                 |
| `P`         | n     | Paste without copying selection |

### Replace/Rename

| Keybind      | Actie                         | Bestand     |
| ------------ | ----------------------------- | ----------- |
| `<leader>ra` | Replace all in file           | keymaps.lua |
| `<leader>rq` | Replace in quickfix (auto)    | keymaps.lua |
| `<leader>rQ` | Replace in quickfix (confirm) | keymaps.lua |
| `<leader>rn` | Incremental rename            | rename.lua  |
| `<leader>sd` | Search in specific directory  | keymaps.lua |

### Surround (nvim-surround)

| Keybind            | Mode | Actie                          |
| ------------------ | ---- | ------------------------------ |
| `ys{motion}{char}` | n    | Add surround                   |
| `yss{char}`        | n    | Surround current line          |
| `yS{motion}{char}` | n    | Add surround (new lines)       |
| `ySS{char}`        | n    | Surround line (new lines)      |
| `ds{char}`         | n    | Delete surround                |
| `cs{old}{new}`     | n    | Change surround                |
| `S{char}`          | v    | Surround selection             |
| `gS{char}`         | v    | Surround selection (new lines) |
| `<C-g>s`           | i    | Insert surround                |
| `<C-g>S`           | i    | Insert surround line           |

**Voorbeelden:**

- `ysiw"` - Surround inner word with quotes
- `ds"` - Delete surrounding quotes
- `cs"'` - Change " to '
- `yss)` - Surround line with parentheses

---

## Mini.ai Text Objects

> Uitgebreide text objects voor sneller editen

| Text Object | Beschrijving                    |
| ----------- | ------------------------------- |
| `af` / `if` | Around/inside function          |
| `ac` / `ic` | Around/inside class             |
| `ao` / `io` | Around/inside block/conditional |
| `at` / `it` | Around/inside tag (HTML/JSX)    |
| `ad` / `id` | Around/inside digits            |
| `ae` / `ie` | Around/inside word (camelCase)  |
| `ag` / `ig` | Entire buffer                   |
| `ak` / `ik` | Around/inside key               |
| `av` / `iv` | Around/inside value             |
| `an` / `in` | Around/inside number            |

**Voorbeelden:**

- `vaf` - Select around function
- `cic` - Change inside class
- `dae` - Delete around camelCase word
- `yig` - Yank entire buffer

---

## Noice & UI

| Keybind       | Mode  | Actie                     |
| ------------- | ----- | ------------------------- |
| `<leader>sn`  | n     | Noice menu (prefix)       |
| `<leader>snl` | n     | Last Noice message        |
| `<leader>snh` | n     | Noice history             |
| `<leader>sna` | n     | Noice all                 |
| `<leader>snd` | n     | Dismiss all               |
| `<leader>snt` | n     | Noice picker              |
| `<leader>sne` | n     | Show errors               |
| `<leader>sns` | n     | Show stats                |
| `<leader>snc` | n     | Show config               |
| `<S-Enter>`   | c     | Redirect cmdline          |
| `<leader>scr` | c     | Redirect cmdline          |
| `<C-f>`       | i,n,s | Scroll forward (in docs)  |
| `<C-b>`       | i,n,s | Scroll backward (in docs) |

---

## Terminal

| Keybind      | Mode | Actie                    |
| ------------ | ---- | ------------------------ |
| `<C-\>`      | n,t  | Toggle floating terminal |
| `<Esc><Esc>` | t    | Exit terminal mode       |

---

## Package.json (npm)

> Alleen actief in package.json bestanden

| Keybind      | Actie                  |
| ------------ | ---------------------- |
| `<leader>ns` | Show package versions  |
| `<leader>nh` | Hide package versions  |
| `<leader>nu` | Update package         |
| `<leader>nd` | Delete package         |
| `<leader>ni` | Install new package    |
| `<leader>nc` | Change package version |

**Let op:** Deze conflicteren met Neotest keybinds (`<leader>ns`, etc.). Werkt alleen in package.json files.

---

## Treesitter Text Objects

| Keybind | Mode | Actie                   |
| ------- | ---- | ----------------------- |
| `af`    | o,v  | Around function         |
| `if`    | o,v  | Inside function         |
| `ac`    | o,v  | Around class            |
| `ic`    | o,v  | Inside class            |
| `]m`    | n    | Next function start     |
| `]]`    | n    | Next class start        |
| `]M`    | n    | Next function end       |
| `][`    | n    | Next class end          |
| `[m`    | n    | Previous function start |
| `[[`    | n    | Previous class start    |
| `[M`    | n    | Previous function end   |
| `[]`    | n    | Previous class end      |

---

## Which-Key Groups

| Prefix      | Groep               |
| ----------- | ------------------- |
| `<leader>a` | Aerial              |
| `<leader>b` | Buffers             |
| `<leader>d` | Duplicate           |
| `<leader>e` | File explorer       |
| `<leader>f` | Find                |
| `<leader>g` | Git                 |
| `<leader>h` | Hunk                |
| `<leader>n` | Neotest             |
| `<leader>q` | Session             |
| `<leader>r` | Rename/Replace      |
| `<leader>s` | Search/Spectre      |
| `<leader>t` | Toggle              |
| `<leader>x` | Trouble/Diagnostics |
| `<leader>z` | Zen Mode            |

---

## Quick Reference Card

```
NAVIGATION                         FIND (Spatie+f)            GIT (Spatie+g)
-----------                        ---------------            --------------
Ctrl+h/j/k/l   Window focus        ff  Files                  gg  LazyGit
Ctrl+Arrows    Resize window       fr  Grep                   gv  Diffview
Shift+h/l      Prev/Next buf       fg  Git files              gh  File history
Shift+q        Close buffer        fh  Recent                 gw  Worktrees
-              Oil explorer        ft  TODOs
]q / [q        Next/Prev quickfix  fb  Buffer search

LSP                                HARPOON (Alt)              TEST (Spatie+n)
---                                -------------              ---------------
gd   Definition                    Alt+a  Add file            nt  Run nearest
gr   References                    Alt+e  Quick menu          nf  Run file
gi   Implementation                Alt+h  File 1              ns  Summary
gy   Type definition               Alt+j  File 2              no  Output
grn  Rename                        Alt+k  File 3
Spatie+.  Code action              Alt+l  File 4

TROUBLE (Spatie+x)                 SPECTRE (Spatie+s)         FOCUS (Spatie+z)
-----------------                  ------------------         ----------------
xx  Diagnostics                    sr  Search & Replace       zz  Zen Mode
xq  Quickfix                       sw  Search word            zt  Twilight
xt  TODOs                          sp  Search in file

SESSION (Spatie+q)                 AERIAL                     TEXT
------------------                 ------                     ----
qs  Restore session                Spatie+a  Toggle outline   Spatie+d   Duplicate
ql  Last session                   ]a / [a   Next/Prev sym    Alt+Up/Dn  Move line
```

---

_Laatst bijgewerkt: 03-03-2026_
