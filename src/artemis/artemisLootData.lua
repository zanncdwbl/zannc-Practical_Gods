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

		if valueToRamp.NoScaling == true then
			return ProcessValue(value, valueToRamp)
		end
	end
	return base(valueToRamp, args)
end)

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

	-- GiftTextLineSets = {
	-- 	ArtemisGift01 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		UnfilledIcon = "EmptyHeartWithGiftIcon",
	-- 		FilledIcon = "FilledHeartWithGiftIcon",
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "HestiaUpgrade" },
	-- 			},
	-- 		},

	-- 		{
	-- 			Cue = "/VO/Melinoe_1194",
	-- 			UsePlayerSource = true,
	-- 			PreLineAnim = "MelTalkExplaining01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			PostLineFunctionName = "BoonInteractPresentation",
	-- 			PostLineFunctionArgs = { SkipAnim = true },
	-- 			PostLineRemoveContextArt = true,
	-- 			Text = "It's been a pleasure to have worked more closely with you, Sister Artemis. This is hardly worth the gift of impeccable precision, though I wanted you to have it.",
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Artemis_0163",
	-- 			PortraitExitWait = 1.0,
	-- 			NarrativeContextArt = "DialogueBackground_Olympus",
	-- 			Text = "Doing the old traditions now, are we? Well sure, then I accept your offering, Sister Melinoë. And I've an offering for {#Emph}you{#Prev}, in kind!",
	-- 		},
	-- 	},
	-- 	ArtemisGift02 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		UnfilledIcon = "EmptyHeartWithGiftIcon",
	-- 		FilledIcon = "FilledHeartWithGiftIcon",
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "HestiaUpgrade" },
	-- 			},
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Artemis_0164",
	-- 			UsePlayerSource = true,
	-- 			PostLineFunctionName = "BoonInteractPresentation",
	-- 			PostLineFunctionArgs = { SkipAnim = true },
	-- 			PostLineRemoveContextArt = true,
	-- 			NarrativeContextArt = "DialogueBackground_Olympus",
	-- 			Text = "You do know we have {#Emph}barrels {#Prev}of this stuff up on Olympus, right? Used to, at least. Damn near forgotten what it tastes like, come to think...",
	-- 		},

	-- 		{
	-- 			Cue = "/VO/Melinoe_1195",
	-- 			PreLineAnim = "MelTalkExplaining01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			PortraitExitWait = 1.0,
	-- 			Text = "May the good memories come flooding back! Whenever you have the time for it, of course.",
	-- 		},
	-- 	},

	-- 	ArtemisGift03 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		UnfilledIcon = "EmptyHeartWithGiftIcon",
	-- 		FilledIcon = "FilledHeartWithGiftIcon",
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "HestiaUpgrade" },
	-- 			},
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Artemis_0189",
	-- 			UsePlayerSource = true,
	-- 			PostLineFunctionName = "BoonInteractPresentation",
	-- 			PostLineFunctionArgs = { SkipAnim = true },
	-- 			PostLineRemoveContextArt = true,
	-- 			NarrativeContextArt = "DialogueBackground_Olympus",
	-- 			Text = "What's all this extra generosity from you lately? It's putting me on edge. Don't you go acting like this is goodbye...!",
	-- 		},

	-- 		{
	-- 			Cue = "/VO/Melinoe_2341",
	-- 			PreLineAnim = "MelTalkExplaining01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			PortraitExitWait = 1.0,
	-- 			Text = "It's merely that the arrow-riddled remnants of my foes give me occasion to reflect! I tell myself never to take my dear friends for granted.",
	-- 		},
	-- 	},

	-- 	ArtemisGift04 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		UnfilledIcon = "EmptyHeartWithGiftIcon",
	-- 		FilledIcon = "FilledHeartWithGiftIcon",
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "HestiaUpgrade" },
	-- 			},
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Artemis_0190",
	-- 			UsePlayerSource = true,
	-- 			PostLineFunctionName = "BoonInteractPresentation",
	-- 			PostLineFunctionArgs = { SkipAnim = true },
	-- 			PostLineRemoveContextArt = true,
	-- 			NarrativeContextArt = "DialogueBackground_Olympus",
	-- 			Text = "I can't exactly drink this on the hunt, you know! But I can squirrel it away for safekeeping. Maybe once all this is settled, we can share a bottle and get properly caught up.",
	-- 		},

	-- 		{
	-- 			Cue = "/VO/Melinoe_2342",
	-- 			PreLineAnim = "MelTalkExplaining01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			PortraitExitWait = 1.0,
	-- 			Text = "Or, failing that, we could always keep on teaming against vengeful spirits and the like! Although it's nice to keep the possibility in mind.",
	-- 		},
	-- 	},

	-- 	ArtemisGift05 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "NPC_Artemis_Field_01" },
	-- 			},
	-- 		},
	-- 		{ Cue = "/VO/Artemis_0191", Text = "Hey, thank you! Sure enough, Olympus started running a little low on this stuff. I'll be sure to lord it over the others, long as you don't mind me exploiting your good graces." },
	-- 		{
	-- 			Cue = "/VO/Melinoe_3502",
	-- 			UsePlayerSource = true,
	-- 			Portrait = "Portrait_Mel_Pleased_01",
	-- 			PreLineAnim = "MelTalkExplaining01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			Text = "I don't recall anything about exploiting one another's good graces in the bylaws of the Silver Sisters, so you should be fine! May you enjoy it either way.",
	-- 		},
	-- 	},

	-- 	ArtemisGift06 = {
	-- 		PlayOnce = true,
	-- 		OnGiftTrack = true,
	-- 		Cost = {
	-- 			GiftPoints = 1,
	-- 		},
	-- 		PreEventFunctionName = "AngleNPCToHero",
	-- 		GameStateRequirements = {
	-- 			{
	-- 				PathTrue = { "GameState", "UseRecord", "NPC_Artemis_Field_01" },
	-- 			},
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Artemis_0192",
	-- 			PreLineWait = 0.35,
	-- 			Text = "...Hard making friends with goddesses, but I have what {#Emph}I {#Prev}need. We can be on our own without feeling alone, you know? I hope you know. That's how it is for me.",
	-- 		},
	-- 		{
	-- 			Cue = "/VO/Melinoe_3503",
	-- 			UsePlayerSource = true,
	-- 			PreLineAnim = "MelTalkBrooding01",
	-- 			PreLineAnimTarget = "Hero",
	-- 			PostLineAnim = "MelinoeIdleWeaponless",
	-- 			PostLineAnimTarget = "Hero",
	-- 			Text = "I do know, and feel much the same. When we're not watching one another's backs, we have Selene and Headmistress watching over us. Still, it's always good to see you face-to-face.",
	-- 		},
	-- 		{ Cue = "/VO/Artemis_0193", Text = "You, too. Most of my family I can do without most of the time. You're an exception! We may not be sisters by blood, but... you'll always be Sister Melinoë to me." },
	-- 		EndVoiceLines = {
	-- 			{
	-- 				PreLineWait = 0.4,
	-- 				UsePlayerSource = true,
	-- 				{ Cue = "/VO/Melinoe_3504", Text = "Likewise, Sister Artemis." },
	-- 			},
	-- 		},
	-- 	},

	-- 	-- placeholder
	-- 	ArtemisGiftTemp = {
	-- 		PlayOnce = true,
	-- 		UseableOffSource = true,
	-- 		OnGiftTrack = true,
	-- 		UnfilledIcon = "UnavailableHeartIcon",
	-- 		HintId = "Codex_UnavailableHint",
	-- 		Cost = {
	-- 			MysteryResource = 1,
	-- 		},
	-- 	},
	-- },
	-- GiftGivenVoiceLines = {
	-- 	BreakIfPlayed = true,
	-- 	PreLineWait = 1.0,
	-- 	PlayFromTarget = true,

	-- 	{ Cue = "/VO/Melinoe_1732", Text = "Truly? You're the best." },
	-- },
	SwapUpgradePickedVoiceLines = {},
	RarityUpgradeVoiceLines = {},
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
