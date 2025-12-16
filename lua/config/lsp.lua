-- ============================================================================
-- LSP 
-- ============================================================================

-- Function to find project root
local function find_root(patterns)
  local path = vim.fn.expand('%:p:h')
  local root = vim.fs.find(patterns, { path = path, upward = true })[1]
  return root and vim.fn.fnamemodify(root, ':h') or path
end

-- Shell LSP setup
--local function setup_shell_lsp()
--  vim.lsp.start({
--    name = 'bashls',
--    cmd = {'bash-language-server', 'start'},
--    filetypes = {'sh', 'bash', 'zsh'},
--    root_dir = find_root({'.git', 'Makefile'}),
--    settings = {
--      bashIde = {
--        globPattern = "*@(.sh|.inc|.bash|.command)"
--      }
--    }
--  })
--end

-- Python LSP setup
local function setup_python_lsp()
  vim.lsp.start({
    name = 'pylsp',
    cmd = {'pylsp'},
    filetypes = {'py', 'python'},
    root_dir = find_root({'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'}),
    settings = {
      pylsp = {
        plugins = {
          starkiller  = {enabled = true},
          pycodestyle = {enabled = false},
          flake8      = {enabled = false},
          black       = {enabled = true}
        }
      }
    }
  })
end

local function setup_lua_lsp()
  vim.lsp.start({
    name = 'luals',
    -- Command and arguments to start the server.
    cmd = {'lua-language-server'},
    -- Filetypes to automatically attach to.
    filetypes = {'lua'},
    -- Sets the "workspace" to the directory where any of these files is found.
    -- Files that share a root directory will reuse the LSP server connection.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    -- Specific settings to send to the server. The schema is server-defined.
    -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
      Lua = {
        runtime = {version = 'LuaJIT',}
      }
    }
  })
end

-- Auto-start LSPs based on filetype
--vim.api.nvim_create_autocmd('FileType', {
--  pattern = 'sh,bash,zsh',
--  callback = setup_shell_lsp,
--  desc = 'Start shell LSP'
--})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'py,python',
  callback = setup_python_lsp,
  desc = 'Start Python LSP'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = setup_lua_lsp,
  desc = 'Start Lua LSP'
})

-- formatting
local function format_code()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.bo[bufnr].filetype

  -- Save cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  if filetype == 'python' or filename:match('%.py$') then
    if filename == '' then
      print("Save the file first before formatting Python")
      return
    end

    local black_cmd = "black --quiet " .. vim.fn.shellescape(filename)
    local black_result = vim.fn.system(black_cmd)

    if vim.v.shell_error == 0 then
      vim.cmd('checktime')
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      print("Formatted with black")
      return
    else
      print("No Python formatter available (install black)")
      return
    end
  end

  if filetype == 'sh' or filetype == 'bash' or filename:match('%.sh$') then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local content = table.concat(lines, '\n')

    local cmd = {'shfmt', '-i', '2', '-ci', '-sr'}  -- 2 spaces, case indent, space redirects
    local result = vim.fn.system(cmd, content)

    if vim.v.shell_error == 0 then
      local formatted_lines = vim.split(result, '\n')
      if formatted_lines[#formatted_lines] == '' then
        table.remove(formatted_lines)
      end
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted_lines)
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      print("Shell script formatted with shfmt")
      return
    else
      print("shfmt error: " .. result)
      return
    end
  end

  print("No formatter available for " .. filetype)
end

vim.api.nvim_create_user_command("FormatCode", format_code, {
  desc = "Format current file"
})

vim.keymap.set('n', '<leader>fm', format_code, { desc = 'Format file' })

-- LSP keymaps 
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    -- Navigation
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- Information
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-a>', vim.lsp.buf.signature_help, opts)

    -- Code actions
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

    -- Diagnostics
    vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})

-- Better LSP UI
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✗",
      [vim.diagnostic.severity.WARN] = "⚠",
      [vim.diagnostic.severity.INFO] = "ℹ",
      [vim.diagnostic.severity.HINT] = "💡",
    }
  }
})

vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP clients attached to current buffer")
  else
    for _, client in ipairs(clients) do
      print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = 'Show LSP client info' })
