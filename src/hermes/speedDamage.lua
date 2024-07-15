-- File is to create the Hermes Rush Delivery Boon
-- LootData_Hermes, TraitData_Hermes
--
-- Creating the boon functions itself
game.TraitData.SpeedDamageBoon = {
	InheritFrom = { "BaseTrait", "FireBoon" },
	Elements = { "Fire" }, -- Need to add this even if you inherit
	Name = "SpeedDamageBoon",
	Icon = "Boon_Hermes_SpeedDamageBoon",
	TraitOrderingValueCache = -1,
	BlockStacking = true, -- Not needed, but incase a mod comes along and fucks around

	RarityLevels = {
		Common = {
			Multiplier = 1.0,
		},
		Rare = {
			Multiplier = 1.5,
		},
		Epic = {
			Multiplier = 2.0,
		},
		Heroic = {
			Multiplier = 2.5,
		},
	},

	StatLines = { "SpeedDamageStatDisplay1" },

	AddOutgoingDamageModifiers = {
		SpeedDamageMultiplier = {
			BaseValue = 0.5,
			SourceIsMultiplier = true,
		},
		ReportValues = {
			ReportedSpeedDamageMultiplier = "SpeedDamageMultiplier",
		},
	},

	ExtractValues = { {
		Key = "ReportedSpeedDamageMultiplier",
		ExtractAs = "TooltipBonus",
		Format = "PercentDelta",
	} },
}

-- Icon Data
zanncdwbl_Practical_Gods.Boon_Hermes_SpeedDamageBoon = sjson.to_object({
	Name = "Boon_Hermes_SpeedDamageBoon",
	InheritFrom = "BoonIcon",
	FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Rush_Delivery"),
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.SpeedDamageBoon = sjson.to_object({
	Id = "SpeedDamageBoon",
	InheritFrom = "BaseBoonMultiline",
	DisplayName = "Rush Delivery",
	Description = "You deal bonus damage based on any bonus move speed.",
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.SpeedDamageBoon_Text = sjson.to_object({
	Id = "SpeedDamageStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Bonus Damage From Bonus Speed:",
	Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipBonus:F}",
}, zanncdwbl_Practical_Gods.Order)

-- Insert into hermes trait table
table.insert(game.LootData.HermesUpgrade.Traits, "SpeedDamageBoon")
game.LootData.HermesUpgrade.TraitIndex["SpeedDamageBoon"] = true
-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.HermesUpgrade["SpeedDamageBoon"] = true

-- Just so the boon isn't useless, have some movespeed upgrade lol, directly in TraitData.lua
local SpeedDamageBoonRequirements = {
	-- cannot use this, cause it will cry about the keepsake, so I'll leave it for now, probaably need to do something with HiddenTrait, which is commented out.
	-- OneOf = {"MoveSpeedBoon", "FastClearDodgeBonusKeepsake"}
	OneOf = { "MoveSpeedBoon" },
}
-- This adds the requirement
game.TraitRequirements["SpeedDamageBoon"] = SpeedDamageBoonRequirements
game.ScreenData.BoonInfo.TraitRequirementsDictionary["SpeedDamageBoon"] = SpeedDamageBoonRequirements
