return {
	{ "yaml", "yaml.docker-compose", "yaml.gitlab" },
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
}
