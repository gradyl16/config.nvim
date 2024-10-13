-- firenvim.lua
--
-- Embed instance of "neovim" directly in browser text fields.
return {
  { 'glacambre/firenvim', build = ':call firenvim#install(0)' },
}
