local M = {}

M.setup = function(config, server)
	local status_ok, lspcontainers = pcall(require, "lspcontainers")
	if not status_ok then
		return
	end
	local util = require("lspconfig/util")

	if server == "bashls" then
		config.before_init = function(params)
			params.processId = vim.NIL
		end

		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
	end

	if server == "dockerls" then
		config.before_init = function(params)
			params.processId = vim.NIL
		end

		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
	end

	if server == "gopls" then
		config.cmd = lspcontainers.command(server)
	end

	if server == "html" then
		config.cmd = lspcontainers.command(server)
	end

	if server == "jsonls" then
		local jsonls_settings = require("rbaumgardner.lsp.settings.jsonls")

		config.before_init = function(params)
			params.processId = vim.NIL
		end

		config.settings = jsonls_settings
		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
	end

	if server == "sumneko_lua" then
		local sumneko_settings = require("rbaumgardner.lsp.settings.sumneko_lua")

		config.cmd = lspcontainers.command(server)
		config.settings = sumneko_settings
	end

	if server == "rust_analyzer" then
		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())

		vim.api.nvim_exec(
			[[
			autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint" } }
		]],
			false
		)
	end

	if server == "tsserver" then
		config.before_init = function(params)
			params.processId = vim.NIL
		end

		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
	end

	if server == "yamlls" then
		config.before_init = function(params)
			params.processId = vim.NIL
		end

		config.cmd = lspcontainers.command(server)
		config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
	end
end

return M
