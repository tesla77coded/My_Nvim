-- lua/config/format.lua

local M = {}

-- prefer none-ls (null-ls) when available; else any LSP that supports formatting
local function preferred_client(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  local has_null = false
  for _, c in ipairs(clients) do
    if c.name == "null-ls" then has_null = true end
  end
  return function(client)
    if has_null then
      return client.name == "null-ls"
    end
    return client.supports_method("textDocument/formatting")
  end
end

function M.format(opts)
  opts = opts or {}
  vim.lsp.buf.format({
    bufnr = opts.bufnr or 0,
    timeout_ms = 2000,
    filter = preferred_client(opts.bufnr or 0),
  })
end

function M.setup_autosave()
  -- format on save for common languages (adjust to taste)
  local group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    pattern = { "*.lua", "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.md", "*.css", "*.scss", "*.html" },
    callback = function(args) M.format({ bufnr = args.buf }) end,
  })
end

return M
