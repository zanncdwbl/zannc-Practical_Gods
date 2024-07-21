-- Critical StatLine
zanncdwbl_Practical_Gods.CritChanceStatLine = sjson.to_object({
	Id = "CritChanceStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Critical Chance:",
	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay2}",
}, zanncdwbl_Practical_Gods.Order)

-- local function updateArtemisDescription(data, updateAttack, updateSpecial)
-- 	print("Updating Artemis Description")
-- 	for _, v in ipairs(data.Texts) do
-- 		if updateAttack and v.Id == "ArtemisWeaponBoon" then
-- 			if updateAttack then
-- 				print("Applying scaling description to weapon boon")
-- 				v.Description = "Your {$Keywords.Attack} is stronger, with a chance to deal {$Keywords.Crit} damage."
-- 			else
-- 				print("Applying standard description to weapon boon")
-- 				v.Description = "Your {$Keywords.Attack} is stronger, with a {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
-- 			end
-- 		end

-- 		if updateSpecial and v.Id == "ArtemisSpecialBoon" then
-- 			if updateSpecial then
-- 				print("Applying scaling description to special boon")
-- 				v.Description = "Your {$Keywords.Special} is stronger, with a chance to deal {$Keywords.Crit} damage."
-- 			else
-- 				print("Applying standard description to special boon")
-- 				v.Description = "Your {$Keywords.Special} is stronger, with a {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
-- 			end
-- 		end
-- 	end
-- end

local mods = rom.mods
local Generalist = mods["zannc-Generalist"]

function ConfigureArtemisBoon(scaleAttack, scaleSpecial)
	-- Weapon Boon
	if scaleAttack then
		-- game.TraitData.ArtemisWeaponBoon.StatLines = { "CritChanceStatDisplay1", "AttackDamageStatDisplay1" } -- Commenting this out till sjson can reset on room without reloading all mods, this is default now
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.NoScaling = false

		-- Check for Generalist Scaling cause loadorder
		if Generalist then
			if Generalist.config.RemoveDiminishingReturns then
				game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = nil
				game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
			else
				-- You kinda have to do this manually to find a sweet spot
				game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = 0.07
				game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = { Value = -0.7, DiminishingReturnsMultiplier = 0.7 }
			end
		end
	else
		-- game.TraitData.ArtemisWeaponBoon.StatLines = { "AttackDamageStatDisplay1" } -- Commenting this out till sjson can reset on room without reloading all mods
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.NoScaling = true
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = nil
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
	end

	-- Special Boon
	if scaleSpecial then
		-- game.TraitData.ArtemisSpecialBoon.StatLines = { "CritChanceStatDisplay1", "SpecialDamageStatDisplay1" } -- Commenting this out till sjson can reset on room without reloading all mods, this is default now
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.NoScaling = false

		-- Check for Generalist Scaling cause loadorder
		if Generalist then
			if Generalist.config.RemoveDiminishingReturns then
				game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = nil
				game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
			else
				-- You kinda have to do this manually to find a sweet spot
				game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = 0.05
				game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = { Value = -0.55, DiminishingReturnsMultiplier = 0.55 }
			end
		end
	else
		-- game.TraitData.ArtemisWeaponBoon.StatLines = { "SpecialDamageStatDisplay1" } -- Commenting this out till sjson can reset on room without reloading all mods
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.NoScaling = true
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.MinMultiplier = nil
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
	end

	-- sjson.hook(zanncdwbl_Practical_Gods.TraitTextFile, function(data)
	--     print("Calling sjson hook")
	--     updateArtemisDescription(data, scaleAttack, scaleSpecial)
	-- end)
end

ModUtil.LoadOnce(function()
	ConfigureArtemisBoon(config.ArtemisAttackCritScale, config.ArtemisSpecialCritScale)
end)

-- game.OnAnyLoad({
-- 	function()
--         rom.data.reload_game_data(
--             sjson.hook(zanncdwbl_Practical_Gods.TraitTextFile, function(data)
--                 print("Calling sjson hook")
--                 updateArtemisDescription(data, config.ArtemisAttackCritScale, config.ArtemisSpecialCritScale)
--             end)
--         )
-- 	end,
-- })
