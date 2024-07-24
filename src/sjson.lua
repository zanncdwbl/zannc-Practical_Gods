---@meta _
---@diagnostic disable: lowercase-global
zanncdwbl_Practical_Gods.TraitTextFile = rom.path.combine(rom.paths.Content, "Game/Text/en/TraitText.en.sjson")
zanncdwbl_Practical_Gods.GUIAnimationsFile = rom.path.combine(rom.paths.Content, "Game/Animations/GUIAnimations.sjson")
zanncdwbl_Practical_Gods.MacroTextFile = rom.path.combine(rom.paths.Content, "Game/Text/en/MacroText.sjson")
zanncdwbl_Practical_Gods.FxFile = rom.path.combine(rom.paths.Content, "Game/Animations/Fx.sjson")
zanncdwbl_Practical_Gods.ProjectileDataFile = rom.path.combine(rom.paths.Content, "Game/Projectiles/PlayerProjectiles.sjson")

zanncdwbl_Practical_Gods.Order = { "Id", "InheritFrom", "DisplayName", "Description" }
zanncdwbl_Practical_Gods.IconOrder = { "Name", "InheritFrom", "FilePath" }
zanncdwbl_Practical_Gods.MacroOrder = { "Id", "DisplayName" }

-- Artemis Icon File Orders
zanncdwbl_Practical_Gods.FxMainOrder = { "Name", "InheritFrom", "NumFrames", "FilePath", "OffsetZ", "Scale", "ColorFromOwner", "AngleFromOwner" }
zanncdwbl_Practical_Gods.FxChildOrder = { "Name", "InheritFrom", "ChildAnimation" }
zanncdwbl_Practical_Gods.FxBoonDropOrder = { "Name", "InheritFrom", "ChildAnimation", "CreateAnimations", "Color" }
zanncdwbl_Practical_Gods.FxBoonDrop = { "Name", "InheritFrom", "FilePath", "OffsetZ", "Scale" }

-- Artemis Dash Order
-- I would put stylua ignore to collapse this but we both have different styling ext.
zanncdwbl_Practical_Gods.ProjectileSupportFireOrder = {
	"Name",
	"InheritFrom",
	"Type",
	"HomingAllegiance",
	"AdjustRateAcceleration",
	"MaxAdjustRate",
	"Speed",
	"Acceleration",
	"Range",
	"Damage",
	"CheckObstacleImpact",
	"CheckUnitImpact",
	"UnlimitedUnitPenetration",
	"DetonateAtVictimLocation",
	"UseVulnerability",
	"IgnoreCoverageAngles",
	"Thing",
}

-- Insert for Icons
sjson.hook(zanncdwbl_Practical_Gods.GUIAnimationsFile, function(data)
	-- Hermes Boons
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Hermes_SpeedDamageBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Hermes_MoveSpeedBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Hermes_RushRallyBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Hermes_BonusDashBoon)

	-- Artemis Boons
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisWeaponBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisSpecialBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisCriticalBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisArmourBoon)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisSprintBoon)

	-- Artemis Icon
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonInfoSymbolArtemisIcon)
end)

-- Insert for BoonText
sjson.hook(zanncdwbl_Practical_Gods.TraitTextFile, function(data)
	-- Hermes Boons
	table.insert(data.Texts, zanncdwbl_Practical_Gods.SpeedDamageBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.SpeedDamageBoon_Text)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.MoveSpeedBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.MoveSpeedBoon_Text)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.RushRallyBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.RushRallyBoon_Text)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.BonusDashBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.BonusDashBoon_Text)

	-- Artemis Boons
	table.insert(data.Texts, zanncdwbl_Practical_Gods.CritChanceStatLine) -- CritChance Stat Line

	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisWeaponBoon)
	-- table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisWeaponBoonScaling) -- Crit Scaling
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisSpecialBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisCriticalBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisCriticalBoon_Text)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisArmourBoon)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisArmourBoon_Text)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisSprintBoon)
	-- table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisSprintBoon_Text)

	-- Artemis Store Text
	table.insert(data.Texts, zanncdwbl_Practical_Gods.ArtemisUpgrade_Store)
end)

function printTable(t, indent)
	indent = indent or 0
	local indentation = string.rep("  ", indent)
	for key, value in pairs(t) do
		if type(value) == "table" then
			print(indentation .. key .. " = {")
			printTable(value, indent + 1)
			print(indentation .. "}")
		else
			print(indentation .. key .. " = " .. tostring(value))
		end
	end
end

-- Insert for Fx, Just mainly Artemis
sjson.hook(zanncdwbl_Practical_Gods.FxFile, function(data)
	-- Everything is just for Artemis Icon and Drops
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropArtemis)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropA_Artemis)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropB_Artemis)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropC_Artemis)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropArtemisIcon)

	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropArtemisPreview)
	table.insert(data.Animations, zanncdwbl_Practical_Gods.BoonDropArtemisUpgradedPreview)

	for _, v in ipairs(data.Animations) do
		if v.Name == "ArtemisRangedArrowhead1" then
			v.FilePath = rom.path.combine(_PLUGIN.guid, "Fx\\ArtemisRangedArrow\\ArtemisRangedArrowhead0001")
		end
	end

	-- Don't need this, from my quick testing, but maybe my save got unfucked
	-- for _, v in ipairs(data.Animations) do
	-- 	if v.Name == "ArtemisRangedArrowheadLegendary" then
	-- 		v.FilePath = rom.path.combine(_PLUGIN.guid, "Fx\\ArtemisRangedArrow\\ArtemisRangedArrowhead0001")
	-- 	end
	-- end
end)

-- Insert for MacroTextFile
sjson.hook(zanncdwbl_Practical_Gods.MacroTextFile, function(data)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.Player_GodDispleased_ArtemisUpgrade)
	table.insert(data.Texts, zanncdwbl_Practical_Gods.SuperSacrifice_CombatText_ArtemisUpgrade)
end)

-- Insert for Artemis Projectiles
sjson.hook(zanncdwbl_Practical_Gods.ProjectileDataFile, function(data)
	table.insert(data.Projectiles, zanncdwbl_Practical_Gods.ArtemisSupportingFireSprint)
end)
