local M = {}

M.resize_guifont = function(change)
    local guifont = vim.api.nvim_get_option('guifont')
    local font_size = 0
    for d in guifont:gmatch('%d+') do
        font_size = d
    end
    local new_size = tostring(font_size + change)
    guifont = guifont:gsub('%d+', new_size)
    vim.api.nvim_set_option('guifont', guifont)
end

return M
