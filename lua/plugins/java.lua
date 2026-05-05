-- Java LSP via nvim-jdtls (requires: jdtls installed, e.g. sudo apt install jdtls)
return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local jdtls = require("jdtls")

		local function get_config()
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name
			return {
				cmd = { "jdtls", "-data", workspace_dir },
				root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
				settings = {
					java = {
						signatureHelp = { enabled = true },
						completion = { enabled = true },
					},
				},
			}
		end

		jdtls.start_or_attach(get_config())

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				jdtls.start_or_attach(get_config())
			end,
		})
	end,
}
