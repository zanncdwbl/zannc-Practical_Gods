---@meta _
---@diagnostic disable: lowercase-global
local package = rom.path.combine(_PLUGIN.plugins_data_mod_folder_path, _PLUGIN.guid)
modutil.mod.Path.Wrap("SetupMap", function(base)
	LoadPackages({
		Name = package,
	})
	base()
end)

modutil.mod.Path.Wrap("HeraSprintLink", function(base, functionArgs)
	if functionArgs.Hijack then
		-- not sure why i have to stuff these in here??
		-- functionArgs.StartAngle = 180
		-- functionArgs.Scatter = 20
		-- functionArgs.ProjectileCap = 3

		local triggerArgs = { ImpactAngle = 0 } -- uh how do we determine this
		if game.CheckCooldown("SupportFire", 0.1667) then
			local enemyId = game.GetClosest({
				Id = game.CurrentRun.Hero.ObjectId,
				DestinationName = "EnemyTeam",
				IgnoreInvulnerable = true,
				IgnoreHomingIneligible = true,
				Distance = functionArgs.Radius,
			})
			-- game.CreateAnimation({
			-- 	Name = functionArgs.Vfx,
			-- 	DestinationId = game.CurrentRun.Hero.ObjectId,
			-- })
			if enemyId and game.ActiveEnemies[enemyId] and not game.ActiveEnemies[enemyId].IsDead then
				local victim = game.ActiveEnemies[enemyId]
				game.CheckSupportingFire(victim, functionArgs, triggerArgs)
			end
		end
	else
		base(functionArgs)
	end
end)
