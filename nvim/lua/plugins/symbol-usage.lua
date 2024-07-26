return {
	"Wansmer/symbol-usage.nvim",
	event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
	config = function()
		local icons = require("config.icons")
		local function h(name)
			return vim.api.nvim_get_hl(0, { name = name })
		end

		-- hl-groups can have any name
		vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = false })
		vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = false })

		vim.api.nvim_set_hl(0, "SymbolUsageRef", { bg = h("Type").fg, fg = h("Normal").bg, bold = true })

		vim.api.nvim_set_hl(0, "SymbolUsageDef", { bg = h("Function").fg, fg = h("Normal").bg, bold = true })

		vim.api.nvim_set_hl(0, "SymbolUsageImpl", { bg = h("@parameter").fg, fg = h("Normal").bg, bold = true })

		local function text_format(symbol)
			local res = {}

			local round_start = { "", "SymbolUsageRounding" }
			local round_end = { "", "SymbolUsageRounding" }

			-- Indicator that shows if there are any other symbols in the same line
			local stacked_functions_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count) or ""

			if symbol.references then
				local usage = symbol.references <= 1 and "usage " or "usages "
				local num = symbol.references == 0 and " no" or symbol.references
				table.insert(res, { " 󰌹 ", "SymbolUsageRef" })
				table.insert(res, { (" %s %s"):format(num, usage), "SymbolUsageContent" })
			end

			if symbol.definition then
				if #res > 0 then
					table.insert(res, { " ", "NonText" })
				end
				table.insert(res, round_start)
				table.insert(res, { " 󰳽 ", "SymbolUsageDef" })
				table.insert(res, { symbol.definition .. " defs ", "SymbolUsageContent" })
				table.insert(res, round_end)
			end

			if symbol.implementation then
				if #res > 0 then
					table.insert(res, { " ", "NonText" })
				end
				table.insert(res, { " 󰡱 ", "SymbolUsageImpl" })
				table.insert(res, { symbol.implementation .. " impls ", "SymbolUsageContent" })
			end

			if stacked_functions_content ~= "" then
				if #res > 0 then
					table.insert(res, { " ", "NonText" })
				end
				table.insert(res, { "  ", "SymbolUsageImpl" })
				table.insert(res, { stacked_functions_content, "SymbolUsageContent" })
			end

			return res
		end

		require("symbol-usage").setup({
			text_format = text_format,
		})
	end,
}
