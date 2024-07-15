---@meta _
---@diagnostic disable: lowercase-global
local package = rom.path.combine(_PLUGIN.plugins_data_mod_folder_path, _PLUGIN.guid)
modutil.mod.Path.Wrap("SetupMap", function(base)
	LoadPackages({
		Name = package,
	})
	base()
end)
