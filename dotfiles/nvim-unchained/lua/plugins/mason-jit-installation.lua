return {
  "brandoncc/mason-jit-installation.nvim",
  dependencies = {
    {
      "brandoncc/mason-null-ls-jit-installation.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
      },
    },
    {
      "brandoncc/mason-lspconfig-jit-installation.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
  },
  event = "VimEnter",
  opts = {
    lspconfig = {
      servers = {
        "bashls",
        "cssls",
        "dockerls",
        "emmet_language_server",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "nil_ls",
        "openscad_lsp",
        "pylyzer",
        "ruby_lsp",
        "ruff",
        "rust_analyzer",
        "solargraph",
        "sorbet",
        "stylelint_lsp",
        "tailwindcss",
        "terraformls",
        "ts_ls",
        "vimls",
        "yamlls",
      },
    },
    ["null-ls"] = {
      sources = {
        eslint_d = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        stylua = { "lua" },
      },
    },
  },
}
