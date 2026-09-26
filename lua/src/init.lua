local liner = {}

function liner.toggle(marker)
    if marker ~= "-" and marker ~= "+" then
        error("Var (marker) must be a character ('-' or '+').")
    end

    local buffer = vim.api.nvim_get_current_buf()
    if vim.bo[buffer].filetype ~= "diff" or not vim.bo[buffer].modifiable then
        return false
    end

    local line = vim.api.nvim_get_current_line()
    local prefix = line:sub(1, 1)
    return true
end

function liner.setup()
end

return liner
