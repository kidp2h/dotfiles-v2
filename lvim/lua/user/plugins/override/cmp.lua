lvim.builtin.cmp.window = {
	completion = {
		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		col_offset = 0,
		side_padding = 0,
	},
}

lvim.builtin.cmp.formatting = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		if lvim then
			local max_width = 0

			if max_width ~= 0 and #vim_item.abbr > max_width then
				vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
			end

			local kind =
				require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50, preset = "codicons" })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })

			-- local kind = vim_item.kind
			-- local strings = vim.split(kind, "%s", { trimempty = true })
			if lvim.use_icons then
				vim_item.kind = " " .. (strings[1] or "") .. " "

				if entry.source.name == "copilot" then
					vim_item.kind = " " .. lvim.icons.git.Octoface .. " "
					vim_item.kind_hl_group = "CmpItemKindCopilot"
				end

				if entry.source.name == "cmp_tabnine" then
					vim_item.kind = " " .. lvim.icons.misc.Robot .. " "
					vim_item.kind_hl_group = "CmpItemKindTabnine"
				end

				if entry.source.name == "crates" then
					vim_item.kind = " " .. lvim.icons.misc.Package .. " "
					vim_item.kind_hl_group = "CmpItemKindCrate"
				end

				if entry.source.name == "lab.quick_data" then
					vim_item.kind = " " .. lvim.icons.misc.CircuitBoard .. " "
					vim_item.kind_hl_group = "CmpItemKindConstant"
				end

				if entry.source.name == "emoji" then
					vim_item.kind = " " .. lvim.icons.misc.Smiley .. " "
					vim_item.kind_hl_group = "CmpItemKindEmoji"
				end
			end

			local source_names = {
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Snippet)",
				buffer = "(Buffer)",
				tmux = "(TMUX)",
				copilot = "(Copilot)",
				treesitter = "(TreeSitter)",
			}

			local duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
			}

			local duplicates_default = 0
			vim_item.menu = "                                             [" .. (strings[2] or "") .. "]"
			vim_item.dup = duplicates[entry.source.name] or duplicates_default
		end

		if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
			local words = {}
			for word in string.gmatch(vim_item.word, "[^-]+") do
				table.insert(words, word)
			end

			local color_name, color_number
			if
				words[2] == "x"
				or words[2] == "y"
				or words[2] == "t"
				or words[2] == "b"
				or words[2] == "l"
				or words[2] == "r"
			then
				color_name = words[3]
				color_number = words[4]
			else
				color_name = words[2]
				color_number = words[3]
			end

			if color_name == "white" or color_name == "black" then
				local color
				if color_name == "white" then
					color = "ffffff"
				else
					color = "000000"
				end

				local hl_group = "lsp_documentColor_mf_" .. color
				vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })
				vim_item.kind_hl_group = hl_group

				-- make the color square 2 chars wide
				vim_item.kind = string.rep("X", 3)

				return vim_item
			elseif #words < 3 or #words > 4 then
				-- doesn't look like this is a tailwind css color
				return vim_item
			end

			if not color_name or not color_number then
				return vim_item
			end

			local color_index = tonumber(color_number)
			local tailwindcss_colors = require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

			if not tailwindcss_colors[color_name] then
				return vim_item
			end

			if not tailwindcss_colors[color_name][color_index] then
				return vim_item
			end

			local color = tailwindcss_colors[color_name][color_index]

			local hl_group = "lsp_documentColor_mf_" .. color
			vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color, bg = "#" .. color })

			vim_item.kind_hl_group = hl_group

			-- make the color square 2 chars wide
			vim_item.kind = string.rep("X", 3)

			return vim_item
		end

		return vim_item
	end,
}
