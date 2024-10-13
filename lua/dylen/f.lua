-- WARNING: I have little to no understanding of what's going on here.
-- I'm just stealing it so I can seamlessly copy other parts of TJ
-- Devry's neovim configuration.

local M = {}

M.fun = function(t)
  local f = t[1]
  local args = { unpack(t, 2) }
  return function()
    return f(unpack(args))
  end
end

M.fn = function(f, ...)
  local args = { ... }
  return function(...)
    return f(unpack(args), ...)
  end
end

return M
