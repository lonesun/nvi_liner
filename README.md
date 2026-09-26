# Outline

A small Lua plugin for editing unified-diff line prefixes in Neovim 0.9+.

In **normal mode**, within a unified-diff hunk:

| Current line prefix | Press `-`    | Press `=`    |
| ------------------- | ------------ | ------------ |
| Space               | -> `-`       | -> `+`       |
| `-`                 | -> Space     | -> Space     |
| `+`                 | -> Space     | -> Space     |
