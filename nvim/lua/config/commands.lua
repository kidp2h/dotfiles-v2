local addCommand = require("utils.api").addCommand
local custom = require("utils.commons").custom
addCommand("CloseOthers", function()
	custom("close-others").acceptInput()
end, {})

addCommand("Far", function()
	custom("far").findInput()
end, {})
