-- Disable scaling of crit without using AbsoluteStackValues due to my Generalist mod messing around with that
modutil.mod.Path.Wrap("GetProcessedValue", function(base, valueToRamp, args)
	if type(valueToRamp) ~= "table" then
		return valueToRamp
	end
	if valueToRamp.BaseMin ~= nil or valueToRamp.BaseValue ~= nil then
		local value = 0
		if valueToRamp.BaseValue ~= nil then
			value = valueToRamp.BaseValue
		else
			if args.ForceMin then
				value = valueToRamp.BaseMin
			elseif args.ForceMax then
				value = valueToRamp.BaseMax
			else
				value = RandomFloat(valueToRamp.BaseMin, valueToRamp.BaseMax)
			end
		end

		if valueToRamp.NoScaling then
			return ProcessValue(value, valueToRamp)
		end
	end
	return base(valueToRamp, args)
end)

zanncdwbl_Practical_Gods.CritChanceStatLine = sjson.to_object({
	Id = "CritChanceStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Crit Chance:",
	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay2}",
}, zanncdwbl_Practical_Gods.Order)

-- Creating Artemis in LootData, allows for natural spawns etc
game.LootData.ArtemisUpgrade = {
	-- Check all of these, unique or always static?

	NarrativeTextColor = { 32, 32, 30, 255 },
	NameplateDescriptionColor = { 145, 45, 90, 255 },
	NameplateSpeakerNameColor = { 24, 24, 24, 255 },

	-- Recheck Colours
	ColorGrade = "ZeusLightning", -- Same for others?
	LootRejectionAnimation = "BoonDissipateA_Zeus", -- Same for others?

	-- Done, but these might not be needed, or exist anywhere, so check these
	AlwaysShowDefaultUseText = true,
	LastRewardEligible = true,
	BanUnpickedBoonsEligible = true,
	ManualRecordUse = true,
	CanReceiveGift = true,
	TextLinesIgnoreQuests = true,

	-- Should be static
	BoxAnimation = "DialogueSpeechBubble",
	BoxExitAnimation = "DialogueSpeechBubbleLightOut",
	SelectionSound = "/SFX/Menu Sounds/GeneralWhooshMENU",
	BlockedLootInteractionText = "UseLootLocked",
	UseTextTalkAndGift = "UseLootAndGift",
	UseTextTalkAndSpecial = "UseLootAndSpecial",
	UseTextTalkGiftAndSpecial = "UseLootGiftAndSpecial",
	UseText = "UseLoot",

	NarrativeContextArtFlippable = false,
	NarrativeContextArt = "DialogueBackground_Olympus",

	-- Done Stuff
	Name = "ArtemisUpgrade",
	OffersElementalTrait = { "Air", "Water", "Earth" },
	InheritFrom = { "BaseLoot", "BaseSoundPackage" },
	Color = { 91, 255, 100, 255 },
	LightingColor = { 0.24, 0.71, 0.12, 1 },
	LootColor = { 58, 255, 42, 255 },

	Gender = "Female",
	OnUsedFunctionName = "UseLoot",
	Weight = 10,
	GodLoot = true,
	DestroyOnPickup = true,

	SubtitleColor = Color.AphroditeVoice,

	SpeakerName = "Artemis",
	SurfaceShopText = "ArtemisUpgrade_Store", -- Should be done, check in shop
	Portrait = "Portrait_Artemis_Default_01",
	Speaker = "NPC_Artemis_01",
	OverlayAnim = "ArtemisOverlay",
	UsePromptOffsetX = 80,
	UsePromptOffsetY = 48,
	AnimOffsetZ = 80,

	Icon = "BoonSymbolArtemis",
	BoonInfoIcon = "BoonInfoSymbolArtemisIcon",
	SurfaceShopIcon = "BoonInfoSymbolArtemisIcon",
	DoorIcon = "BoonDropArtemisPreview",
	DoorUpgradedIcon = "BoonDropArtemisUpgradedPreview",
	EchoLastRewardId = "EchoLastRewardBoon_ArtemisUpgrade", -- This might not need to have Upgrade at the end

	MenuTitle = "UpgradeChoiceMenu_Artemis", -- in ScreenText.en line 199 for some reason
	BoonInfoTitleText = "UpgradeChoiceMenu_Artemis", -- Display name in codex
	ConfirmSound = "/SFX/Menu Sounds/GodBoonChoiceConfirm",
	LootRejectedText = "Player_GodDispleased_ArtemisUpgrade",
	SuperSacrificeCombatText = "SuperSacrifice_CombatText_ArtemisUpgrade",
	WrathPortrait = "Portrait_Artemis_Wrath_01",

	SpawnSound = "/SFX/ArtemisBoonArrow",
	UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
	PortraitEnterSound = "/EmptyCue", -- PortraitEnterSound: /SFX/ApolloBoonHarpPoof
	FlavorTextIds = { "ArtemisUpgrade_FlavorText01", "ArtemisUpgrade_FlavorText02", "ArtemisUpgrade_FlavorText03" },

	PriorityUpgrades = { "ArtemisWeaponBoon", "ArtemisSpecialBoon" },
	WeaponUpgrades = { "ArtemisWeaponBoon", "ArtemisSpecialBoon" },
	Traits = { "SupportingFireBoon", "CritBonusBoon", "DashOmegaBuffBoon", "HighHealthCritBoon", "InsideCastCritBoon", "OmegaCastVolleyBoon", "TimedCritVulnerabilityBoon", "ArtemisCriticalBoon", "ArtemisArmourBoon" },

	TraitIndex = {},
	GameStateRequirements = {
		{
			-- HasAny = {"PoseidonUpgrade", "DemeterUpgrade"},
			-- Path = {"GameState", "UseRecord"}
		},
	},
	Consumables = {},

	InteractTextLineSets = {},
	FirstSpawnVoiceLines = {},
	-- On First Spawn
	OnSpawnVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PlayOnceFromTableThisRun = true,
		PreLineWait = 0.85,
		SuccessiveChanceToPlay = 0.25,
		GameStateRequirements = {
			NamedRequirements = { "OlympianOnSpawnVoiceLinesAllowed" },
		},

		{
			Cue = "/VO/Melinoe_1472",
			Text = "It's her.",
		},
		{
			Cue = "/VO/Melinoe_1477",
			Text = "She's back.",
		},
		{
			Cue = "/VO/ArtemisKeepsake_0214",
			Text = "Hey Sister.",
		},
	},

	UpgradeMenuOpenVoiceLines = game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.UpgradeMenuOpenVoiceLines,

	RejectionTextLines = {},
	MakeUpTextLines = {},
	DeathTauntVoiceLines = {},
	BoughtTextLines = {},
	GiftGivenVoiceLines = {},
	SwapUpgradePickedVoiceLines = {},
	RarityUpgradeVoiceLines = {},
	GiftTextLineSets = {},
	BlindBoxOpenedVoiceLines = {},
	RejectionVoiceLines = {},
}

-- Adding Icons to default artemis, cause why does she not already have it?
game.EnemyData.NPC_Artemis_Field_01.DoorIcon = "BoonDropArtemisPreview"

-- Dirty code, don't like it, couldn't find a better way
-- makes it so if you pick up an artemis boon, it will still count toward codex aka her field version
modutil.mod.Path.Wrap("CheckCodexUnlock", function(base, chapterName, entryName, args)
	local GodArtemis = game.GameState.UseRecord.ArtemisUpgrade or 0
	local NPCArtemis = game.GameState.UseRecord.NPC_Artemis_Field_01 or 0

	local MaxArtemis = math.max(GodArtemis, NPCArtemis)

	game.GameState.UseRecord.ArtemisUpgrade = MaxArtemis
	game.GameState.UseRecord.NPC_Artemis_Field_01 = MaxArtemis

	base(chapterName, entryName, args)
end)

-- Change Artemis Codex to not have requirements
game.CodexData.OlympianGods.Entries.NPC_Artemis_01 = {
	-- NoRequirements = true,
	Entries = { {
		UnlockGameStateRequirements = { {
			Path = { "GameState", "UseRecord", "NPC_Artemis_Field_01" },
			Comparison = ">=",
			Value = 2,
		} },
		Text = "CodexData_Artemis_01",
	} },
	Image = "Codex_Portrait_Artemis",
	BoonInfoEnemyName = "NPC_Artemis_Field_01",
}
-- Just creates a new entry based on original, just so it doesnt crash when you open from boon select
-- game.CodexData.OlympianGods.Entries.ArtemisUpgrade = game.CodexData.OlympianGods.Entries.NPC_Artemis_01

-- Super Magical Code by Jowday, this way you dont have to do the method above, and doesn't give weird codex unlock popup
modutil.mod.Path.Wrap("AttemptOpenUpgradeChoiceBoonInfo", function(base, screen, button)
	if screen.Source.Name == "ArtemisUpgrade" then
		local newScreen = {
			Source = {
				Name = "NPC_Artemis_Field_01",
			},
		}
		base(newScreen, button)
	else
		base(screen, button)
	end
end)

-- Core Traits, aka Weapon Attack, Special, Cast etc
game.LinkedTraitData.ArtemisCoreTraits = {}

-- Need to add to boon info manually since this table is populated way before I do any inserts, plus it doesn't exist even if I have traitindex up in loot
local ArtemisTraitDictionary = {
	SupportingFireBoon = true,
	CritBonusBoon = true,
	DashOmegaBuffBoon = true,
	HighHealthCritBoon = true,
	InsideCastCritBoon = true,
	OmegaCastVolleyBoon = true,
	TimedCritVulnerabilityBoon = true,
	-- New Boons
	ArtemisWeaponBoon = true,
	ArtemisSpecialBoon = true,
	ArtemisCriticalBoon = true,
	ArtemisArmourBoon = true,
}

game.ScreenData.BoonInfo.TraitDictionary.ArtemisUpgrade = ArtemisTraitDictionary
game.LootData.ArtemisUpgrade.TraitIndex = ArtemisTraitDictionary

-- Artemis Boon requirements, don't want to get crit dmg upgrades without crit damage, directly in TraitData.lua
local ArmourDamageBoonRequirements = {
	-- cannot use this, cause it will cry about the keepsake, so I'll leave it for now, probaably need to do something with HiddenTrait, which is commented out.
	-- OneOf = {"MoveSpeedBoon", "FastClearDodgeBonusKeepsake"}
	OneOf = { "ArtemisWeaponBoon", "ArtemisSpecialBoon", "CritBonusBoon" },
}
-- This adds the requirement
game.TraitRequirements["ArtemisCriticalBoon"] = ArmourDamageBoonRequirements
game.TraitRequirements["ArtemisArmourBoon"] = ArmourDamageBoonRequirements

game.ScreenData.BoonInfo.TraitRequirementsDictionary["ArtemisCriticalBoon"] = ArmourDamageBoonRequirements
game.ScreenData.BoonInfo.TraitRequirementsDictionary["ArtemisArmourBoon"] = ArmourDamageBoonRequirements

-- This is to add Artemis to RunProgress in LootData so she can spawn as a boon room
local requirementName = { "MaxHealthDrop", "MaxManaDrop", "RoomMoneyDrop", "StackUpgrade", "Devotion" }

-- functions to Check names of the values in runprogress and tartarus rewards, and if name has a "count of", add artemis to it
local function requiredName(name)
	for _, reqname in ipairs(requirementName) do
		if name == reqname then
			return true
		end
	end
	return false
end

for _, entry in ipairs(game.RewardStoreData.RunProgress) do
	if requiredName(entry.Name) then
		for _, requirement in ipairs(entry.GameStateRequirements) do
			if requirement.CountOf then
				table.insert(requirement.CountOf, "ArtemisUpgrade")
			end
		end
	end
end

for _, entry in ipairs(game.RewardStoreData.TartarusRewards) do
	if requiredName(entry.Name) then
		for _, requirement in ipairs(entry.GameStateRequirements) do
			if requirement.CountOf then
				table.insert(requirement.CountOf, "ArtemisUpgrade")
			end
		end
	end
end
