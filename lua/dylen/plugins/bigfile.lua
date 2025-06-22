-- bigfile.lua
--
-- Disable certain features for large files (perf)

return {
  {
    'LunarVim/bigfile.nvim',
    opts = {
      filesize = 0.75
    }
  },
}
