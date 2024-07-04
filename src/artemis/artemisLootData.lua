-- Creating new table in artemis data to allow for weapon upgrades, and making them a priority
-- NPCData_Artemis, TraitData
-- game.EnemyData.NPC_Artemis_Field_01.WeaponUpgrades = {"ArtemisWeaponBoon", "ArtemisSpecialBoon", "ArtemisSprintBoon"}
-- table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisWeaponBoon")
-- table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisWeaponBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisWeaponBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisSpecialBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisSprintBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.Traits, "ArtemisWeaponBoon") -- Works
--
-- game.LootData.ArtemisUpgrade = {
--     Name = "ArtemisUpgrade",
--     InheritFrom = {"BaseLoot", "BaseSoundPackage"},
--     -- OffersElementalTrait = {"Air", "Water"},
--     UsePromptOffsetX = 80,
--     UsePromptOffsetY = 48,
--     CanReceiveGift = true,
--     AlwaysShowDefaultUseText = true,
--     GodLoot = true,
--     Weight = 10,
--
--
--     SurfaceShopText = "AphroditeUpgrade_Store", -- Add
--     SurfaceShopIcon = "BoonInfoSymbolArtemisIcon",
--     BoonInfoIcon = "BoonInfoSymbolArtemisIcon",
--     MenuTitle = "UpgradeChoiceMenu_Title_AphroditeUpgrade", -- Add
--     EchoLastRewardId = "EchoLastRewardBoon_AphroditeUpgrade", -- Add
--     LootRejectedText = "Player_GodDispleased_AphroditeUpgrade", -- Add
--     Icon = "BoonSymbolAphrodite", -- Add
--     DoorIcon = "BoonDropAphroditePreview", -- Add
--     DoorUpgradedIcon = "BoonDropAphroditeUpgradedPreview", -- Add
--     SuperSacrificeCombatText = "SuperSacrifice_CombatText_AphroditeUpgrade", -- Add
--
--     LightingColor = {210, 255, 97, 255},
--     LootColor = {110, 255, 0, 255},
--     SubtitleColor = Color.AphroditeVoice,
--     SpawnSound = "/SFX/ArtemisBoonArrow",
--     PortraitEnterSound = "/EmptyCue",
--     UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
--     SpeakerName = "Artemis",
--     Speaker = "NPC_Artemis_01",
--     Portrait = "Portrait_Artemis_Default_01",
--     WrathPortrait = "Portrait_Artemis_Wrath_01",
--     OverlayAnim = "ArtemisOverlay",
--     Gender = "Female",
--     FlavorTextIds = {}, -- do we add?
--     FirstSpawnVoiceLines = {},
--     OnSpawnVoiceLines = {},
--     PriorityUpgrades = {"ArtemisWeaponBoon"},
--     WeaponUpgrades = {"ArtemisWeaponBoon"},
--     Traits = {"ArtemisWeaponBoon"},
--     TraitIndex = {
--         ArtemisWeaponBoon = true
--     },
--     Consumables = {}
--     -- UpgradeMenuOpenVoiceLines = {
--     --     GlobalVoiceLines.HeraclesBoonReactionVoiceLines,
--     --     GlobalVoiceLines.FoundRareBoonVoiceLines
--     -- }
-- }
game.LootData.ArtemisUpgrade = {
    OffersElementalTrait = {"Air", "Water"},
    InheritFrom = {"BaseLoot", "BaseSoundPackage"},

    SuperSacrificeCombatText = "SuperSacrifice_CombatText_AphroditeUpgrade",
    AlwaysShowDefaultUseText = true,
    Consumables = {},
    LastRewardEligible = true,
    SurfaceShopText = "AphroditeUpgrade_Store",
    UsePromptOffsetY = 48,

    BanUnpickedBoonsEligible = true,
    ManualRecordUse = true,
    CanReceiveGift = true,
    SelectionSound = "/SFX/Menu Sounds/GeneralWhooshMENU",
    UseTextTalkAndSpecial = "UseLootAndSpecial",

    AnimOffsetZ = 80,
    TextLinesIgnoreQuests = true,
    UseText = "UseLoot",
    NameplateSpeakerNameColor = {24, 24, 24, 255},
    UseTextTalkGiftAndSpecial = "UseLootGiftAndSpecial",
    NarrativeContextArtFlippable = false,
    NarrativeContextArt = "DialogueBackground_Olympus",
    NarrativeTextColor = {32, 32, 30, 255},
    NameplateDescriptionColor = {145, 45, 90, 255},
    BoxExitAnimation = "DialogueSpeechBubbleLightOut",
    LootRejectedText = "Player_GodDispleased_AphroditeUpgrade",
    UsePromptOffsetX = 80,
    BlockedLootInteractionText = "UseLootLocked",
    -- Might need these? check later
    -- UseTextTalkAndGift = "UseLootAndGift",
    -- BoonInfoTitleText = "Codex_BoonInfo_Artemis",

    -- Done Stuff 
    Name = "ArtemisUpgrade",
    Gender = "Female",
    OnUsedFunctionName = "UseLoot",
    Weight = 10,
    GodLoot = true,
    DestroyOnPickup = true,

    GameStateRequirements = {{
        -- HasAny = {"PoseidonUpgrade", "DemeterUpgrade"},
        -- Path = {"GameState", "UseRecord"}
    }},

    SubtitleColor = Color.AphroditeVoice,
    Color = {210, 255, 100, 255}, -- Random Colour
    LightingColor = {210, 255, 97, 255},
    LootColor = {110, 255, 0, 255},

    SpeakerName = "Artemis",
    Portrait = "Portrait_Artemis_Default_01",
    Speaker = "NPC_Artemis_01",
    OverlayAnim = "ArtemisOverlay",

    Icon = "BoonSymbolArtemis",
    BoonInfoIcon = "BoonInfoSymbolArtemisIcon",
    SurfaceShopIcon = "BoonInfoSymbolArtemisIcon",
    MenuTitle = "UpgradeChoiceMenu_Artemis", -- in ScreenText.en line 199 for some reason
    ConfirmSound = "/SFX/Menu Sounds/GodBoonChoiceConfirm",

    WrathPortrait = "Portrait_Artemis_Wrath_01",

    SpawnSound = "/SFX/ArtemisBoonArrow",
    UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
    PortraitEnterSound = "/EmptyCue",
    BoxAnimation = "DialogueSpeechBubble",
    FlavorTextIds = {"ArtemisUpgrade_FlavorText01", "ArtemisUpgrade_FlavorText02", "ArtemisUpgrade_FlavorText03"},

    DoorIcon = "BoonDropArtemisPreview",
    DoorUpgradedIcon = "BoonDropArtemisUpgradedPreview",
    EchoLastRewardId = "EchoLastRewardBoon_Artemis", -- This might need to have Upgrade at the end

    PriorityUpgrades = {"ArtemisWeaponBoon"},
    WeaponUpgrades = {"ArtemisWeaponBoon"},
    Traits = {"SupportingFireBoon", "CritBonusBoon", "DashOmegaBuffBoon", "HighHealthCritBoon", "InsideCastCritBoon",
              "OmegaCastVolleyBoon", "TimedCritVulnerabilityBoon"},
    TraitIndex = {
        ArtemisWeaponBoon = true,
        SupportingFireBoon = true,
        CritBonusBoon = true,
        DashOmegaBuffBoon = true,
        HighHealthCritBoon = true,
        InsideCastCritBoon = true,
        OmegaCastVolleyBoon = true,
        TimedCritVulnerabilityBoon = true
    }
}

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisWeaponBoon")

-- Adding Traits to TraitData Table, and adding her as core
table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisWeaponBoon")
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisWeaponBoon")
game.LinkedTraitData.ArtemisCoreTraits = {"ArtemisWeaponBoon"}

-- CodexData.lua
-- ArtemisUpgrade =
-- {
-- 	-- NoRequirements = true,
-- 	Entries =
-- 	{
-- 		{
-- 			UnlockGameStateRequirements =
-- 			{
-- 				{
-- 					Path = { "GameState", "UseRecord", "ArtemisUpgrade" },
-- 					Comparison = ">=",
-- 					Value = 2,
-- 				},
-- 			},
-- 			Text = "CodexData_Artemis_01",
-- 		},
-- 	},
-- 	Image = "Codex_Portrait_Artemis",
-- 	BoonInfoEnemyName = "NPC_Artemis_Field_01",
-- },
