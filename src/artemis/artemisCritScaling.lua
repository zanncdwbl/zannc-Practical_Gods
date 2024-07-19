-- Critical StatLine
zanncdwbl_Practical_Gods.CritChanceStatLine = sjson.to_object({
	Id = "CritChanceStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Critical Chance:",
	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay2}",
}, zanncdwbl_Practical_Gods.Order)

local function updateArtemisDescription(data, updateAttack, updateSpecial)
	print("Updating Artemis Description")
	for _, v in ipairs(data.Texts) do
		if updateAttack and v.Id == "ArtemisWeaponBoon" then
			if updateAttack then
				print("Applying scaling description to weapon boon")
				v.Description = "Your {$Keywords.Attack} is stronger, with a chance to deal {$Keywords.Crit} damage."
			else
				print("Applying standard description to weapon boon")
				v.Description = "Your {$Keywords.Attack} is stronger, with a {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
			end
		end

		if updateSpecial and v.Id == "ArtemisSpecialBoon" then
			if updateSpecial then
				print("Applying scaling description to special boon")
				v.Description = "Your {$Keywords.Special} is stronger, with a chance to deal {$Keywords.Crit} damage."
			else
				print("Applying standard description to special boon")
				v.Description = "Your {$Keywords.Special} is stronger, with a {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipCritChance:P} {#Prev} chance to deal {$Keywords.Crit} damage."
			end
		end
	end
end

function ConfigureArtemisBoon(scaleAttack, scaleSpecial)
	print("Configuring Artemis Boon")

	-- Weapon Boon configuration
	if scaleAttack then
		print("Scaling for weapon boon is enabled")
		game.TraitData.ArtemisWeaponBoon.StatLines = { "AttackDamageStatDisplay1", "CritChanceStatDisplay1" }
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.NoScaling = false

		-- Doesn't seem to work, is it my wrap or is it something else
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.MinValue = 0.02
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = { Value = -0.03 }
	else
		print("Scaling for weapon boon is disabled")
		--game.TraitData.ArtemisWeaponBoon.StatLines = { "AttackDamageStatDisplay1" } -- Commenting this out till sjson can reset on room
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.NoScaling = true
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.MinValue = nil
		game.TraitData.ArtemisWeaponBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
	end

	-- Special Boon configuration
	if scaleSpecial then
		print("Scaling for special boon is enabled")
		game.TraitData.ArtemisSpecialBoon.StatLines = { "SpecialDamageStatDisplay1", "CritChanceStatDisplay1" }
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.NoScaling = false

		-- Doesn't seem to work, is it my wrap or is it something else
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.MinValue = 0.03
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = { Value = -0.04 }
	else
		print("Scaling for special boon is disabled")
		--game.TraitData.ArtemisWeaponBoon.StatLines = { "SpecialDamageStatDisplay1" } -- Commenting this out till sjson can reset on room
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.NoScaling = true
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.MinValue = nil
		game.TraitData.ArtemisSpecialBoon.AddOutgoingCritModifiers.Chance.IdenticalMultiplier = nil
	end

	sjson.hook(zanncdwbl_Practical_Gods.TraitTextFile, function(data)
		print("Calling sjson hook")
		updateArtemisDescription(data, scaleAttack, scaleSpecial)
	end)
end

ConfigureArtemisBoon(config.ArtemisAttackCritScale, config.ArtemisSpecialCritScale)
