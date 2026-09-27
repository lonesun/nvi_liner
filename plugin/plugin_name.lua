if vim.g.loaded_nvi_liner then
    return
end

require("nvi_liner").setup()
vim.g.loaded_nvi_liner = true
    