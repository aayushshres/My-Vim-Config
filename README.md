# My Vim Config
A simple configuration to turn your vim into Python and C/C++ IDE.

# Setup
* Run `setup.sh`.
* Install Plugins using `:PlugInstall`.
* Run `:CocInstall coc-json coc-tsserver coc-clangd coc-python`.
* Add the following in `coc-settings.json`
`
{
    "suggest.noselect":true
}
`
* Restart vim.
