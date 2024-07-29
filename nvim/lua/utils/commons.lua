local M = {}

M.plugin = function(name)
	local status, plugin = pcall(require, "plugins." .. name)
	if not status then
		print("Something went wrong:", plugin)
	else
		return plugin
	end
end
M.colorscheme = function(name)
	local status, colorscheme = pcall(require, "colorschemes." .. name)
	if not status then
		print("Something went wrong with colorscheme:", colorscheme)
	else
		return colorscheme
	end
end
M.mapping = function(name)
	local status, mapping = pcall(require, "mappings." .. name)
	if not status then
		print("Something went wrong with mapping:", mapping)
	else
		return mapping
	end
end
M.pure = function(path, lazy)
	return { path, lazy = lazy or false }
end

M.custom = function(name)
	local status, custom = pcall(require, "plugins.customs." .. name)
	if not status then
		print("Something went wrong with custom:", custom)
	else
		return custom
	end
end

M.config = function(name)
	local status, config = pcall(require, "config." .. name)
	if not status then
		print("Something went wrong with file config:", config)
	else
		return config
	end
end

M.join_paths = function(...)
	local result = table.concat({ ... }, "/")
	return result
end

return M
