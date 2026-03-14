# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on LazyVim starter template with extensive customizations for frontend development, AI-assisted coding, and productivity workflows. The configuration is optimized for WSL2 environments with tmux integration.

## Architecture

### Core Structure

- **init.lua**: Entry point that bootstraps lazy.nvim and sets basic vim options
- **lua/config/**: Core configuration files
  - `lazy.lua`: Plugin manager setup, language support, and WSL clipboard integration
  - `keymaps.lua`: Custom key mappings including tmux navigation and obsidian integration
  - `options.lua`: Additional vim options
  - `autocmds.lua`: Auto-commands configuration
  - `gentleman/`: Custom utilities directory
- **lua/plugins/**: Plugin-specific configurations (lazy-loaded by lazy.nvim)

### Key Features

**Language Support**: TypeScript, Angular, Astro, Go, Nix, JSON, TOML, Markdown with LSP and linting (ESLint)

**Formatting (Conform)**: Configured per filetype in `lua/plugins/conform.lua`:
- JS/TS/JSON/CSS: Biome → Prettier fallback
- Go: goimports + gofumpt
- Python: black
- Lua: stylua

**AI/Coding Assistants**:
- Claude Code integration via `claudecode.nvim` (primary AI assistant)
- GitHub Copilot (enabled)
- Avante and CopilotChat (disabled in `lua/plugins/disabled.lua`)

**Editor Enhancements**:
- Snacks.nvim (dashboard, explorer, picker, notifier, indent, scroll)
- Harpoon2 for file navigation
- Oil.nvim for directory editing
- Mini-files for file browsing
- FZF-Lua for fuzzy finding

**Development Tools**:
- nvim-dap for debugging (loads `.vscode/launch.json`, auto-loads `.env` files for Go)
- Mason for LSP/tool management
- Obsidian.nvim for note-taking (workspace: `/home/rhood/.config/obsidian`)

**Tmux Integration**: Full tmux navigation via nvim-tmux-navigation plugin

### Plugin Organization

Plugins follow lazy.nvim conventions:
- Core LazyVim plugins imported from `lazyvim.plugins`
- Extras imported from `lazyvim.plugins.extras.*`
- Custom plugins/overrides in `lua/plugins/*.lua`
- Disabled plugins listed in `lua/plugins/disabled.lua`

## Common Commands

### Package Management
```vim
:Lazy              " Open lazy.nvim UI to install/update plugins
```

### Reload Configuration
```vim
:source ~/.config/nvim/init.lua
```

## Key Bindings

### Claude Code (`<leader>a` prefix)
- `<leader>ac` : Toggle Claude Code terminal
- `<leader>af` : Focus Claude terminal
- `<leader>ar` : Resume previous Claude session
- `<leader>aC` : Continue Claude conversation
- `<leader>am` : Select Claude model
- `<leader>ab` : Add current buffer to context
- `<leader>as` : Send selection to Claude (visual mode)
- `<leader>aa` : Accept diff
- `<leader>ad` : Deny diff

### File Navigation
- `-` : Open parent directory with Oil.nvim

### Obsidian (`<leader>o` prefix)
- `<leader>oo` : Open in Obsidian app
- `<leader>oq` : Quick switch notes
- `<leader>on` : Create new note
- `<leader>os` : Search Obsidian
- `<leader>ot` : Insert template
- `<leader>oc` : Toggle checkbox
- `<leader>ob` : Show backlinks
- `<leader>ol` : Show links

### Debugging (`<leader>d` prefix)
- `<leader>db` : Toggle breakpoint
- `<leader>dB` : Conditional breakpoint
- `<leader>dc` : Continue
- `<leader>di` : Step into
- `<leader>dO` : Step over
- `<leader>do` : Step out
- `<leader>dt` : Terminate
- `<leader>dr` : Toggle REPL

### Tmux Navigation
- `Ctrl+h/j/k/l` : Navigate between Neovim splits and tmux panes
- `Ctrl+\` : Navigate to last active pane
- `Ctrl+Space` : Navigate to next pane

### Formatting
- `<leader>cf` : Format code (normal/visual mode)
- `<leader>cF` : Format selected code (visual mode)

## Important Configuration Details

### WSL Clipboard
Uses win32yank.exe for clipboard operations (`lua/config/lazy.lua:21-34`)

### Custom Save Behavior
`Ctrl+s` triggers custom SaveFile() function with filename-only notification (`lua/config/keymaps.lua:73-90`)

### Disabled Default Behaviors
- Alt+j/Alt+k line movement disabled in all modes
- J/K visual block movement disabled
- bufferline.nvim disabled

### Vim Settings
- Spell checking enabled (English)
- `timeoutlen`: 1000ms
- `ttimeoutlen`: 0ms
