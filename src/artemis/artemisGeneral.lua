-- Creating new table in artemis data to allow for weapon upgrades, and making them a priority
-- NPCData_Artemis, TraitData
-- game.EnemyData.NPC_Artemis_Field_01.WeaponUpgrades = {"ArtemisWeaponBoon", "ArtemisSpecialBoon", "ArtemisSprintBoon"}
-- table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisWeaponBoon")
-- table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisWeaponBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisWeaponBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisSpecialBoon")
-- table.insert(game.EnemyData.NPC_Artemis_Field_01.PriorityUpgrades, "ArtemisSprintBoon")
game.LootData.ArtemisUpgrade = {
    InheritFrom = {"BaseLoot", "BaseSoundPackage"},
    -- OffersElementalTrait = {"Air", "Water"},
    UsePromptOffsetX = 80,
    UsePromptOffsetY = 48,
    CanReceiveGift = true,
    AlwaysShowDefaultUseText = true,
    GodLoot = true,
    Weight = 10,
    SurfaceShopText = "AphroditeUpgrade_Store", -- Add
    SurfaceShopIcon = "BoonInfoSymbolAphroditeIcon", -- Add
    BoonInfoIcon = "BoonInfoSymbolAphroditeIcon", -- Add
    MenuTitle = "UpgradeChoiceMenu_Title_AphroditeUpgrade", -- Add
    EchoLastRewardId = "EchoLastRewardBoon_AphroditeUpgrade", -- Add
    LootRejectedText = "Player_GodDispleased_AphroditeUpgrade", -- Add
    Icon = "BoonSymbolAphrodite", -- Add
    DoorIcon = "BoonDropAphroditePreview", -- Add
    DoorUpgradedIcon = "BoonDropAphroditeUpgradedPreview", -- Add

    SuperSacrificeCombatText = "SuperSacrifice_CombatText_AphroditeUpgrade", -- Add

    Color = {210, 255, 100, 255}, -- Random Colour
    LightingColor = {210, 255, 97, 255},
    LootColor = {110, 255, 0, 255},
    SubtitleColor = Color.AphroditeVoice,
    SpawnSound = "/SFX/ArtemisBoonArrow",
    PortraitEnterSound = "/EmptyCue",
    UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",

    SpeakerName = "Artemis",
    Speaker = "NPC_Artemis_01",
    Portrait = "Portrait_Artemis_Default_01",
    WrathPortrait = "Portrait_Artemis_Wrath_01",
    OverlayAnim = "ArtemisOverlay",
    Gender = "Female",
    FlavorTextIds = {}, -- do we add?

    FirstSpawnVoiceLines = {},

    OnSpawnVoiceLines = {},

    PriorityUpgrades = {"ArtemisWeaponBoon", "ArtemisSpecialBoon", "ArtemisSprintBoon"},
    WeaponUpgrades = {"ArtemisWeaponBoon", "ArtemisSpecialBoon", "ArtemisSprintBoon"},
    Traits = {"ArtemisWeaponBoon"},

    Consumables = {}

    -- UpgradeMenuOpenVoiceLines = {
    --     [1] = GlobalVoiceLines.HeraclesBoonReactionVoiceLines,
    --     [2] = GlobalVoiceLines.FoundRareBoonVoiceLines
    -- }
}
