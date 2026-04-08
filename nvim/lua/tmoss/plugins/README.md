# List of plugins

## saghen/blink.cmp
### Performant autocompletion plugin

## fredrikaverpil/godoc.nvim
### Fuzzy search Go docs within Neovim

provides :GoDoc <string> functionality

## nvim-treesitter/nvim-treesitter
### Treesitter configurations and abstraction layer for nvim

Treesitter parses files into lexical groups that be be worked on
(i.e. it recognizes code blocks, and indentations and other things,
for things like code folding, extraction, etc)

## neovim/nvim-lspconfig
### Quick base configs for a whole suite of LSPs

Makes getting started with LSPs easier by provided configs for a bunch of them.
Merges with any manual edits you make

## folke/lazydev.nvim
### Configures lua language server for editting neovim configs

This is probably fine to keep, dunno I use it really enough to
justify it's installation sadly, but perhaps one day.

## hoob3rt/lualine.nvim
### A blazing fast and easy to configure Neovim statusline written in Lua.

## tpope/vim-fugitive
### fugitive.vim: A Git wrapper so awesome, it should be illegal

I should 1000% be using this more.
Specifically `:Gedit <ref>:%` and `:Gvdiffsplit`

## FabijanZulj/blame.nvim
### Neovim fugitive style git blame plugin

I should 1000% be using this more.

## folke/neoconf.nvim
### Neovim plugin to manage global and project-local settings

Limited usefulness apparently as gopls is not supported, maybe drop for the time being?


## protesilaos/prot16-vim

## lewis6991/gitsigns.nvim
### Git integration for buffers

This has some better diffing tools than vim-fugitive that I should incorporate

## fatih/vim-go



## nvim-lua/popup.nvim
### [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete

There is one of these in snacks, and mini, so I'll probably chuck thissun?

## mini-nvim/mini.nvim
### Bundle of utility functions written in single files in lua

Using:
    - cmdline
    - icons
    - cursorword
    - trailspace
    - indentscope
    - splitjoin

    - pick
    - diff
    - files

    - git
    - clue


## folke/snacks.nvim
### Bundle of utility functions for neovim to make things easier

Using:
    - scratch
    - input
    - lazygit
    - dim
    - notifier

## polarmutex/git-worktree.nvim
### A simple wrapper around git worktree operations, create, switch, and delete. There is some assumed workflow within this plugin, but pull requests are welcomed to fix that).

It's been so long I've been trapped in no worktree mode, I almost forgot how this works
Lists telescope as a dep, might want to see about switching to snacks or mini ui picker if possible

## nvim-lua/plenary.nvim
### plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.

Utility functions used by other tools I use and like

## ThePrimeagen/Harpoon

## folke/trouble.nvim


# To Add

## preservim/tagbar
### Vim plugin that displays tags in a window, ordered by scope

## aznhe21/actions-preview
### Allow reviewing what code actions did

## akinsho/toggleterm
### Pop up a terminal in neovim without interrupting workflow so much

# Retired(?)

## junegunn/vim-easy-align
### A Vim alignment plugin
#### mini has one, so I'm currently trying mini's version

This tool is amazing, and I'm very not good at all it's useful features

## AndrewRadev/splitjoin.vim
### Switch between single-line and multiline forms of code
#### Replaced by mini

This is the better version of J that I should remember to be using more often

## SirVer/ultisnips
### Utility Snippets
#### Not really using it, plus there is a mini version, maybe?

## nvim-neo-tree/neo-tree.nvim
### Opinionated file tree (netrw-like)
#### Currently trying mini.picker and mini.files

## nvim-tree/nvim-tree.lua
### File tree
#### Currently trying mini.picker and mini.files

## folke/which-key.nvim
### Tooling to remind of configured keymaps in neovim
#### Trying mini.clue for a while

## nvim-telescope/telescope.nvim
### Collection of useful pickers for nvim
#### Switching to mini.pick for a while

