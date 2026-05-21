return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap              = require("dap")
			local dapui            = require("dapui")
			local dap_virtual_text = require("nvim-dap-virtual-text")
			local dapgo            = require("dap-go")

			dap_virtual_text.setup()
			dapgo.setup()
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
			 dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
			 dapui.open()
			end
			vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
		end,
		keys={
		  { "<leader>dc", "<cmd>DapContinue<cr>", desc = "dap: DAP Continue" },

		  -- Navigating running debugger
		  -- TODO: Figure out how to allow this to stay, so I can ,dvvvvviuvv or something like that
		  { "<leader>dv", "<cmd>DapStepOver<cr>", desc = "dap: Dap Step Over" },
		  { "<leader>di", "<cmd>DapStepInto<cr>", desc = "dap: Dap Step Into" },
		  { "<leader>du", "<cmd>DapStepOut<cr>", desc =  "dap: Dap Step Out" },

		  { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc =  "dap: Dap Toggle Breakpoint" },
		  { "<leader>dx", function() require("dapui").toggle() end, desc = "dap: Open/Close UI"},
		},
	},
}
