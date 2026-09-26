local liner = {}

function liner.toggle()
    local buffer = vim.api.nvim_get_current_buf()
    if vim.bo[buffer].filetype ~= "diff" or not vim.bo[buffer].modifiable then
        return false
    end
end

function liner.setup()
end

return liner
