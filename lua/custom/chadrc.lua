local M = {}

local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = "everforest",
  theme_toggle = {"everforest", "gruvchad"}
}

M.mappings = require "custom.mappings"

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
  },
}

return M