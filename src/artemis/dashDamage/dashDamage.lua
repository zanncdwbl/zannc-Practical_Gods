-- File is to create the Artemis Hunter Dash Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisDashBoon = {
	InheritFrom = { "BaseTrait", "EarthBoon" },
	Elements = { "Earth" }, -- Need to add this even if you inherit
	Name = "ArtemisDashBoon",
	BoonInfoTitle = "ArtemisDashBoon",
	-- Icon = "Boon_Artemis_ArtemisDashBoon",
	TraitOrderingValueCache = 50,
	BlockStacking = false,
	RarityLevels = {
		Common = {
			Multiplier = 1.0,
		},
		Rare = {
			Multiplier = 1.2,
		},
		Epic = {
			Multiplier = 1.4,
		},
		Heroic = {
			Multiplier = 1.6,
		},
	},

	AddOutgoingDamageModifiers = {
		ValidWeaponMultiplier = {
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier = {
				Value = -0.8,
			},
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
		},
	},

	-- StatLines = {"ArmourDamageStatDisplay1"},

	-- ExtractValues = {{
	--     Key = "CriticalHealthBufferMultiplier",
	--     ExtractAs = "TooltipDamageBonus",
	--     Format = "PercentDelta"
	-- }}
}

-- Icon Data
-- zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisDashBoon = sjson.to_object({
--     Name = "Boon_Artemis_ArtemisDashBoon",
--     InheritFrom = "BoonIcon",
--     FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Hide_Breaker")
-- }, zanncdwbl_Practical_Gods.IconOrder)

-- -- Boons Description/Display
-- zanncdwbl_Practical_Gods.ArtemisDashBoon = sjson.to_object({
--     Id = "ArtemisDashBoon",
--     InheritFrom = "BaseBoonMultiline",
--     DisplayName = "Hide Breaker",
--     Description = "Your {$Keywords.Crit} effects deal even more damage to {$Keywords.Armor}."
-- }, zanncdwbl_Practical_Gods.Order)

-- zanncdwbl_Practical_Gods.ArtemisDashBoon_Text = sjson.to_object({
--     Id = "ArmourDamageStatDisplay1",
--     InheritFrom = "BaseStatLine",
--     DisplayName = "{!Icons.Bullet}{#PropertyFormat}Bonus vs Armour:",
--     Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}"
-- }, zanncdwbl_Practical_Gods.Order)

-- -- Adding Boons to Default Artemis
-- table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisDashBoon")

-- -- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- -- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
-- game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisDashBoon"] = true

-- ArtemisRushTrait =
-- {
-- 	InheritFrom = { "ShopTier1Trait" },
-- 	RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
-- 	God = "Artemis",
-- 	Icon = "Boon_Artemis_03",
-- 	Slot = "Rush",
-- 	RarityLevels =
-- 	{
-- 		Common =
-- 		{
-- 			Multiplier = 1.00,
-- 		},
-- 		Rare =
-- 		{
-- 			Multiplier = 1.20,
-- 		},
-- 		Epic =
-- 		{
-- 			Multiplier = 1.40,
-- 		},
-- 		Heroic =
-- 		{
-- 			Multiplier = 1.60,
-- 		}
-- 	},
-- 	AddOutgoingDamageModifiers =
-- 	{
-- 		ValidWeaponMultiplier = {
-- 			BaseValue = 1.5,
-- 			SourceIsMultiplier = true,
-- 			IdenticalMultiplier =
-- 			{
-- 				Value = -0.8,
-- 			},
-- 		},
-- 		ValidWeapons = WeaponSets.HeroDashWeapons,
-- 		ExcludeLinked = true,
-- 		ExtractValues =
-- 		{
-- 			{
-- 				Key = "ValidWeaponMultiplier",
-- 				ExtractAs = "TooltipDamageBonus",
-- 				Format = "PercentDelta",
-- 			},
-- 		}
-- 	},
-- 	PropertyChanges =
-- 	{
-- 		{
-- 			WeaponNames = WeaponSets.HeroRushWeapons,
-- 			WeaponProperty = "FireFx",
-- 			ChangeValue = "BlinkTrailVerticalB-Artemis",
-- 			ChangeType = "Absolute",
-- 		},
-- 		{
-- 			WeaponNames = WeaponSets.HeroRushWeapons,
-- 			WeaponProperty = "FireGraphic",
-- 			ChangeValue = "ZagreusDashNoCollide_Artemis",
-- 			ChangeType = "Absolute",
-- 		},
-- 	},
-- },
