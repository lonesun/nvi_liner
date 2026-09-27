local liner = {}

---Is this line part of a hunk body?
---@param buffer any "The buffer number(?) to check."
---@param row any "The row number to check."
---@return boolean "`true` if the line is part of a hunk body, `false` otherwise."
local function line_is_from_hunk_check(buffer, row)
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
    local in_hunk = false

    for index = 1, row do
        local line = lines[index]
        local prefix = line:sub(1, 1)
        local file_header = line:match("^%-%-%- ")
        and (lines[index + 1] or ""):match("^%+%+%+ ")

        if line:match("^@@ %-%d+,?%d* %+%d+,?%d* @@") then
            in_hunk = true
            if index == row then
                return false
            end
        elseif file_header or line:match("^diff ") then
            in_hunk = false
        elseif in_hunk and (prefix == " " or prefix == "-" or prefix == "+") then
            if index == row then
                return true
            end
        elseif line ~= "\\ No newline at end of file" then
            in_hunk = false
        end
    end

    return false
end


function liner.toggle(marker)
    if marker ~= "-" and marker ~= "+" then
        error("Var (marker) must be a character ('-' or '+').")
    end

    local buffer = vim.api.nvim_get_current_buf()
    if vim.bo[buffer].filetype ~= "diff" or not vim.bo[buffer].modifiable then
        return false
    end

    local row = vim.api.nvim_win_get_cursor(0)[1]
    if not line_is_from_hunk_check(buffer, row) then
        return false
    end

    local line = vim.api.nvim_get_current_line()
    local prefix = line:sub(1, 1)
    local replacement = (prefix == "-" or prefix == "+") and " " or marker
    vim.api.nvim_buf_set_text(buffer, row - 1, 0, row - 1, 1, { replacement })
    return true
end

function liner.setup()
    local group = vim.api.nvim_create_augroup("N'viLiner", { clear = true })

    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buffer) then
        end
    end
end

return liner
