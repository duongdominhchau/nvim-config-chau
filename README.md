# What's this

This is my personal config, the intention is to avoid copying files and use just built-in Neovim functionality to reuse
it across machines.

# How to use

Change your `~/.config/nvim/init.lua` to:

```lua
vim.pack.add('https://github.com/duongdominhchau/nvim-config-chau')
require('nvim-config-chau').setup {}
```

That's it! I don't provide configuration because that takes time. If anyone want to reuse this and make the config more
flexible (e.g: customizable list of language servers), PRs are welcome.
