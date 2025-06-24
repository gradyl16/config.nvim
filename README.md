# Dylen's Neovim Configuration

This is my personal Neovim configuration. It is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This is a **personal** configuration. It is not meant to be a general-purpose configuration. It is tailored to my needs and preferences. You are welcome to use it, but I make no guarantees that it will work for you. There are a lot of external dependencies, some of which I may not have documented here.

## Prerequisites

### Py Support

For you or any plugins to use python, either remove the `init.lua` line which sets the global python provider, or run the following:

```bash
cd
mkdir .virtualenvs
python3 -m venv .virtualenvs/neovim
```

### Plugin Notes

#### General

> [!important]
> Some plugins require authentication for use (e.g., Github Copilot). You will need to set up the necessary credentials for these plugins to work.

Some of my plugins aren't functional, even on my machines; I'm keeping them around for when I configure them properly.

I have a few plugins that serve the same purpose. This makes the config a bit bloated. Please choose among them unless you need/want both (i.e., you are a weirdo like me :p).

---

This document is a work in progress. It is not yet complete.
