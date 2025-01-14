-- File is to create the Artemis Deadly Strike Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisSpecialBoon = {
	InheritFrom = { "BaseTrait", "EarthBoon" },
	Elements = { "Earth" }, -- Need to add this even if you inherit
	Name = "ArtemisSpecialBoon",
	BoonInfoTitle = "ArtemisSpecialBoon",
	Icon = "Boon_Artemis_ArtemisSpecialBoon",
	Slot = "Secondary",
	TraitOrderingValueCache = 50,
	Cost = 30,
	BlockStacking = false,
	RarityLevels = {
		Common = {
			Multiplier = 1.00,
		},
		Rare = {
			Multiplier = 1.50,
		},
		Epic = {
			Multiplier = 2.00,
		},
		Heroic = {
			Multiplier = 2.50,
		},
	},
	AddOutgoingDamageModifiers = {
		ValidWeaponMultiplier = {
			BaseValue = 1.4,
			SourceIsMultiplier = true,
			-- Scaling thing with poms
			AbsoluteStackValues = {
				[1] = 1.20,
				[2] = 1.15,
				[3] = 1.10,
			},
		},
		ValidWeapons = WeaponSets.HeroSecondaryWeapons,

		ValidWeaponsLookup = {
			WeaponAxeSpecialSwing = true,
			WeaponStaffBall2 = true,
			WeaponSkullImpulse = true,
			WeaponStaffBall = true,
			WeaponDaggerThrow = true,
			WeaponAxeBlock2 = true,
			WeaponLobSpecial = true,
			WeaponTorchSpecial = true,
		},

		ReportValues = {
			ReportedValidWeaponMultiplier = "ValidWeaponMultiplier",
		},
	},

	AddOutgoingCritModifiers = {
		ValidWeapons = WeaponSets.HeroSecondaryWeapons,
		Chance = {
			BaseValue = 0.20,
			SourceIsMultiplier = false,
			IgnoreRarity = true,

			NoScaling = true, -- Custom Value, refer to Wrap in ArtemisLootData.lua
		},
		ReportValues = {
			ExtractCritChance = "Chance",
		},
	},

	StatLines = { "CritChanceStatDisplay1", "SpecialDamageStatDisplay1" },

	ExtractValues = {
		{
			Key = "ReportedValidWeaponMultiplier",
			ExtractAs = "TooltipDamageBonus",
			Format = "PercentDelta",
		},
		{
			Key = "ExtractCritChance",
			ExtractAs = "TooltipCritChance",
			Format = "Percent",
		},
	},

	-- Add property changes here
}

-- Icon Data
zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisSpecialBoon = sjson.to_object({
	Name = "Boon_Artemis_ArtemisSpecialBoon",
	InheritFrom = "BoonIcon",
	FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Deadly_Flourish"),
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.ArtemisSpecialBoon = sjson.to_object({
	Id = "ArtemisSpecialBoon",
	InheritFrom = "BaseBoonMultiline",
	DisplayName = "Deadly Flourish",
	Description = "Your {$Keywords.Special} is stronger, with a chance to deal {$Keywords.Crit} damage.",
}, zanncdwbl_Practical_Gods.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, 2, "ArtemisSpecialBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisSpecialBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisSpecialBoon")
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisSpecialBoon")
