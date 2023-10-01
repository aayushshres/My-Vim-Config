# My Vim Config

A simple configuration to turn your vim into a simple IDE.

# Basic Setup

* Run `setup.sh`.
* Install Plugins using `:PlugInstall`.

## Conquer of Completion Setup

* [Language servers](https://github.com/neoclide/coc.nvim/wiki/Language-servers) for Coc.
* Run `CocInstall coc-clangd coc-pyright coc-java coc-tsserver coc-markdownlint coc-sh`.
* Add `"suggest.noselect":true` in `coc-settings.json`

```
{
    "suggest.noselect":true
}
```
