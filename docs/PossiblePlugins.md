# Mogelijke Plugins & Configuraties

## Flash.nvim - Waarom Je Dit Moet Activeren

### Wat is Flash?

Flash.nvim is een next-generation motion plugin die je navigatie in Neovim dramatisch versnelt. Het vervangt en verbetert plugins zoals hop.nvim, lightspeed.nvim, en leap.nvim.

### Waarom Flash Gebruiken?

#### 1. Sneller dan alles

Met Flash typ je `s` + 2 karakters en je springt direct naar die locatie. Geen multiple keystrokes, geen zoeken.

```
Voorbeeld: Je wilt naar het woord "function" springen
- Zonder Flash: /func<Enter> of meerdere w/b bewegingen
- Met Flash: s + fu + [label] = direct daar
```

#### 2. Treesitter Integratie

Flash kan hele code blocks selecteren met `S`:

```javascript
// Cursor staat ergens in de file
// Druk S, dan selecteer je hele functies, if-statements, loops etc.

function example() {
    // <- Spring hier direct naartoe met S + label
    if (condition) {
        // <- Of hier
    }
}
```

#### 3. Works Everywhere

- Normal mode: Spring naar locatie
- Visual mode: Selecteer tot locatie
- Operator-pending: `dsc` = delete tot 'c' karakter

#### 4. Labels zijn Optimaal

Flash toont labels op de meest ergonomische toetsen (home row eerst), zodat je altijd snel kunt typen.

### Aanbevolen Configuratie

Je hebt flash.lua al, maar het staat disabled. Activeer het:

```lua
-- lua/plugins/flash.lua
return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            mode = "exact",
            incremental = true,
        },
        jump = {
            jumplist = true,
            pos = "start",
            history = false,
            register = false,
            nohlsearch = true,
            autojump = false,
        },
        label = {
            uppercase = false,
            rainbow = {
                enabled = true,
                shade = 5,
            },
        },
        modes = {
            search = {
                enabled = false, -- Zet op true als je het in / search wilt
            },
            char = {
                enabled = true,
                keys = { "f", "F", "t", "T", ";", "," },
                jump_labels = true,
            },
            treesitter = {
                labels = "asdfghjklqwertyuiopzxcvbnm",
                jump = { pos = "range" },
                label = { before = true, after = true },
            },
        },
    },
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
}
```

### Keybinds Samenvatting

| Keybind | Mode    | Actie                                      |
| ------- | ------- | ------------------------------------------ |
| `s`     | n, x, o | Flash jump - spring naar 2 karakters      |
| `S`     | n, x, o | Flash Treesitter - selecteer code blocks  |
| `r`     | o       | Remote Flash - actie op afstand            |
| `R`     | o, x    | Treesitter Search - zoek in treesitter    |
| `f/F`   | n       | Enhanced f/F met labels                    |
| `t/T`   | n       | Enhanced t/T met labels                    |

### Voorbeelden

```
# Spring naar "const" ergens in de file
s + co + [label die verschijnt]

# Selecteer hele functie
S + [label bij function]

# Delete tot een karakter ver weg
d + s + xy + [label]

# Enhanced f - spring naar 'a' met labels als er meerdere zijn
f + a + [label als nodig]
```

### Waarom Niet Gewoon / Gebruiken?

| Actie          | Met /search        | Met Flash     |
| -------------- | ------------------ | ------------- |
| Spring naar    | /word<Enter>n n n  | s + wo + j    |
| Keystrokes     | 6-10+              | 3-4           |
| Visueel        | Highlight alles    | Labels alleen |
| Terug springen | Handmatig          | Automatisch   |

### Conclusie

Flash.nvim is een van de meest impactvolle plugins voor dagelijks gebruik. Het bespaart honderden keystrokes per dag en maakt navigatie intuïtief. **Activeer het!**

---

## Andere Plugins Om Te Overwegen

### Debugging (nvim-dap)

Als je debugging wilt in Neovim:

```lua
-- lua/plugins/dap.lua
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    -- Configureer voor je talen (JS/TS, C#, etc.)
}
```

### Markdown Preview

```lua
return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    keys = {
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
}
```

### Database Client

```lua
return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUI", "DBUIToggle" },
}
```

### Rest Client (HTTP requests in Neovim)

```lua
return {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    keys = {
        { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run HTTP request" },
    },
}
```

### Color Picker/Highlighter

```lua
return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = false,
            css = true,
            tailwind = true,
        },
    },
}
```

---

_Dit document bevat suggesties voor plugins die je Neovim ervaring kunnen verbeteren._
