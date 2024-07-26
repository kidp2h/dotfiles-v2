local icons = require("config.icons")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function jumpable(dir)
	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if not luasnip_ok then
		return false
	end

	local win_get_cursor = vim.api.nvim_win_get_cursor
	local get_current_buf = vim.api.nvim_get_current_buf

	---sets the current buffer's luasnip to the one nearest the cursor
	---@return boolean true if a node is found, false otherwise
	local function seek_luasnip_cursor_node()
		-- TODO(kylo252): upstream this
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snippet = node.parent.snippet
		local exit_node = snippet.insert_nodes[0]

		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1

		-- exit early if we're past the exit node
		if exit_node then
			local exit_pos_end = exit_node.mark:pos_end()
			if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		node = snippet.inner_first:jump_into(1, true)
		while node ~= nil and node.next ~= nil and node ~= snippet do
			local n_next = node.next
			local next_pos = n_next and n_next.mark:pos_begin()
			local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
				or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

			-- Past unmarked exit node, exit early
			if n_next == nil or n_next == snippet.next then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end

			if candidate then
				luasnip.session.current_nodes[get_current_buf()] = node
				return true
			end

			local ok
			ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
			if not ok then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		-- No candidate, but have an exit node
		if exit_node then
			-- to jump to the exit node, seek to snippet
			luasnip.session.current_nodes[get_current_buf()] = snippet
			return true
		end

		-- No exit node, exit from snippet
		snippet:remove_from_jumplist()
		luasnip.session.current_nodes[get_current_buf()] = nil
		return false
	end

	if dir == -1 then
		return luasnip.in_snippet() and luasnip.jumpable(-1)
	else
		return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
	end
end
return {
	"hrsh7th/nvim-cmp",
	enabled = true,
	dependencies = {},
	config = function()
		local cmp = require("cmp")
		local luasnip_ok, luasnip = pcall(require, "luasnip")

		local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
		local ConfirmBehavior = cmp_types.ConfirmBehavior
		local SelectBehavior = cmp_types.SelectBehavior
		cmp.setup({

			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					require("cmp-under-comparator").under,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local max_width = 0

					local source_names = {
						nvim_lsp = "(LSP)",
						emoji = "(Emoji)",
						path = "(Path)",
						calc = "(Calc)",
						rg = "(Rg)",
						nvim_lua = "(Lua)",
						cmdline = "(Cmdline)",

						cmp_tabnine = "(Tabnine)",
						vsnip = "(Snippet)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
						tmux = "(TMUX)",
						copilot = "(Copilot)",
						async_path = "(Path)",
						codeium = "[Codeium]",
						treesitter = "[TreeSitter]",
					}

					if max_width ~= 0 and #vim_item.abbr > max_width then
						vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. icons.ui.Ellipsis
					end

					local kind =
						require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50, preset = "codicons" })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })

					local duplicates = {
						buffer = 1,
						path = 1,
						nvim_lsp = 3,
						luasnip = 1,
					}

					local duplicates_default = 0
					vim_item.menu = "[" .. (strings[2] or "") .. "]"
					if strings[2] == nil then
						vim_item.menu = "                                             " .. source_names[entry.source.name]
					end
					vim_item.dup = duplicates[entry.source.name] or duplicates_default

					-- local kind = vim_item.kind
					-- local strings = vim.split(kind, "%s", { trimempty = true })
					vim_item.kind = " " .. (strings[1] or "") .. " "

					if entry.source.name == "copilot" then
						vim_item.kind = " " .. icons.git.Octoface .. " "
						vim_item.kind_hl_group = "CmpItemKindCopilot"
						vim_item.menu = "[Copilot]"
					end

					if entry.source.name == "cmp_tabnine" then
						vim_item.kind = " " .. icons.misc.Robot .. " "
						vim_item.kind_hl_group = "CmpItemKindTabnine"
					end

					if entry.source.name == "buffer" then
						vim_item.kind = " " .. icons.kind.Buffer .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"

						vim_item.menu = "[Buffer]"
					end

					if entry.source.name == "crates" then
						vim_item.kind = " " .. icons.misc.Package .. " "
						vim_item.kind_hl_group = "CmpItemKindCrate"
					end

					if entry.source.name == "nvim_lsp" then
						vim_item.menu = "[LSP]"
					end

					if entry.source.name == "lab.quick_data" then
						vim_item.kind = " " .. icons.misc.CircuitBoard .. " "
						vim_item.kind_hl_group = "CmpItemKindConstant"
					end

					if entry.source.name == "emoji" then
						vim_item.kind = " " .. icons.misc.Smiley .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"

						vim_item.menu = "[Emoji]"
					end

					if entry.source.name == "treesitter" then
						vim_item.kind = " " .. icons.ui.Tree .. " "
						vim_item.kind_hl_group = "CmpItemKindCopilot"
						vim_item.menu = "[TreeSitter]"
					end

					if entry.source.name == "rg" then
						vim_item.kind = " " .. icons.kind.Key .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"
						vim_item.menu = "[Rg]"
					end

					if entry.source.name == "path" then
						vim_item.kind = " " .. icons.kind.Key .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"
						vim_item.menu = "[Path]"
					end

					if entry.source.name == "codeium" then
						vim_item.kind = " " .. icons.kind.Codeium .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"
						vim_item.menu = "[Codeium]"
					end

					if entry.source.name == "calc" then
						vim_item.kind = " " .. icons.kind.Calc .. " "
						vim_item.kind_hl_group = "CmpItemKindValue"
						vim_item.menu = "[Calc]"
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
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {

				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = 0,
					side_padding = 0,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif jumpable(1) then
						luasnip.jump(1)
					elseif has_words_before() then
						-- cmp.complete()
						fallback()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local confirm_opts = {} -- avoid mutating the original opts below
						local is_insert_mode = function()
							return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
						end
						if is_insert_mode() then -- prevent overwriting brackets
							confirm_opts.behavior = ConfirmBehavior.Insert
						end
						local entry = cmp.get_selected_entry()
						local is_copilot = entry and entry.source.name == "copilot"
						if is_copilot then
							confirm_opts.behavior = ConfirmBehavior.Replace
							confirm_opts.select = true
						end
						if cmp.confirm(confirm_opts) then
							return -- success, exit early
						end
					end
					fallback() -- if not exited early, always fallback
				end),
			}),
			sources = cmp.config.sources({

				{
					name = "copilot",
					-- keyword_length = 0,
					max_item_count = 10,
					trigger_characters = {
						{
							".",
							":",
							"(",
							"'",
							'"',
							"[",
							",",
							"#",
							"*",
							"@",
							"|",
							"=",
							"-",
							"{",
							"/",
							"\\",
							"+",
							"?",
							" ",
							-- "\t",
							-- "\n",
						},
					},
				},
				{
					name = "nvim_lsp",
					priority = 500,
					entry_filter = function(entry, ctx)
						local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
						if kind == "Snippet" and ctx.prev_context.filetype == "java" then
							return false
						end
						return true
					end,
				},
				{ name = "luasnip" }, -- For vsnip users.
				{ name = "path" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "rg", keyword_length = 3 },
				{ name = "calc" },
				{ name = "emoji" },
				{ name = "treesitter", priority = 1 },
				{ name = "codeium" },
			}),
		})
	end,
}
