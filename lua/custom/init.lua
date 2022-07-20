-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.
vim.opt.guifont = (function()
   local gui_font = "font_family:font_size"
   if vim.fn.has "win32" == 1 then
      gui_font = "CaskaydiaCove NF:h14"
   else
      gui_font = "CaskaydiaCove Nerd Font:h20"
   end
   return gui_font
end)()

vim.g.neovide_transparency = 0.85
vim.g.neovide_profiler = false
