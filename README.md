# Outline

A small Lua plugin for editing unified-diff line prefixes in Neovim 0.9+.

In **normal mode**, within a unified-diff hunk:

| Current line prefix | Press `-`    | Press `=`    |
| ------------------- | ------------ | ------------ |
| Space               | -> `-`       | -> `+`       |
| `-`                 | -> Space     | -> Space     |
| `+`                 | -> Space     | -> Space     |

## Installation

If you want to make the plugin load on every startup (so you can use it in your actual Git workflow), the following section will help you.

### Local Development (Recommended)

1. Inside Neovim, run `:echo stdpath('config')` to find your configuration directory. On a Windows machine, this is usually something like `C:/Users/{YourUsername}/AppData/Local/nvim` while on a Unix-like system, it is typically `~/.config/nvim`.

2. Open or create `init.lua` there and add:

```lua
vim.opt.runtimepath:prepend("path/to/nvi_liner")
require("nvi_liner").setup()
```

3. Restart Neovim, and wonder why it loads twice. This part of the installation process mirrors, pretty similarly in fact, the addition of new shell functions or shell scripts to the local `.bashrc` or `.zshrc` for immediate availability upon starting up a terminal.

4. Reopen `init.lua` and make an adjustment:

```lua
vim.opt.runtimepath:prepend("path/to/nvi_liner")
-- require("nvi_liner").setup()
```

5. Find that it only loads once, as intended, and estimate that since the `vim.opt.runtimepath:prepend()` call will already intercept a `setup()` call, because it is programmed into the plugin's internal logic already, the second `require()` is probably redundant.
