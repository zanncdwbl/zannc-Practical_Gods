-- Creating Artemis in LootData, allows for natural spawns etc
game.LootData.ArtemisUpgrade = {
    SelectionSound = "/SFX/Menu Sounds/GeneralWhooshMENU",
    UseTextTalkAndSpecial = "UseLootAndSpecial",

    TextLinesIgnoreQuests = true,
    UseText = "UseLoot",
    NameplateSpeakerNameColor = {24, 24, 24, 255},
    UseTextTalkGiftAndSpecial = "UseLootGiftAndSpecial",
    NarrativeContextArtFlippable = false,
    NarrativeContextArt = "DialogueBackground_Olympus",
    NarrativeTextColor = {32, 32, 30, 255},
    NameplateDescriptionColor = {145, 45, 90, 255},
    BoxExitAnimation = "DialogueSpeechBubbleLightOut",
    BlockedLootInteractionText = "UseLootLocked",

    ColorGrade = "ZeusLightning",
    LootRejectionAnimation = "BoonDissipateA_Zeus",

    -- Might need these? check later
    -- UseTextTalkAndGift = "UseLootAndGift",
    -- BoonInfoTitleText = "Codex_BoonInfo_Artemis",

    -- Done Stuff 
    Name = "ArtemisUpgrade",
    OffersElementalTrait = {"Air", "Water"},
    InheritFrom = {"BaseLoot", "BaseSoundPackage"},

    Gender = "Female",
    OnUsedFunctionName = "UseLoot",
    Weight = 10,
    GodLoot = true,
    DestroyOnPickup = true,

    GameStateRequirements = {{
        -- HasAny = {"PoseidonUpgrade", "DemeterUpgrade"},
        -- Path = {"GameState", "UseRecord"}
    }},
    Consumables = {},

    SubtitleColor = Color.AphroditeVoice,
    Color = {210, 255, 100, 255}, -- Random Colour
    LightingColor = {210, 255, 97, 255},
    LootColor = {110, 255, 0, 255},

    SpeakerName = "Artemis",
    SurfaceShopText = "ArtemisUpgrade_Store",
    Portrait = "Portrait_Artemis_Default_01",
    Speaker = "NPC_Artemis_01",
    OverlayAnim = "ArtemisOverlay",
    UsePromptOffsetX = 80,
    UsePromptOffsetY = 48,
    AnimOffsetZ = 80,

    -- These might not be needed, or exist anywhere
    AlwaysShowDefaultUseText = true,
    LastRewardEligible = true,
    BanUnpickedBoonsEligible = true,
    ManualRecordUse = true,
    CanReceiveGift = true,

    Icon = "BoonSymbolArtemis",
    BoonInfoIcon = "BoonInfoSymbolArtemisIcon",
    SurfaceShopIcon = "BoonInfoSymbolArtemisIcon",
    MenuTitle = "UpgradeChoiceMenu_Artemis", -- in ScreenText.en line 199 for some reason
    ConfirmSound = "/SFX/Menu Sounds/GodBoonChoiceConfirm",
    LootRejectedText = "Player_GodDispleased_ArtemisUpgrade",
    SuperSacrificeCombatText = "SuperSacrifice_CombatText_ArtemisUpgrade",
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

    -- Dunno if I need this here, since i'm adding it later anyway
    TraitIndex = {
        SupportingFireBoon = true,
        CritBonusBoon = true,
        DashOmegaBuffBoon = true,
        HighHealthCritBoon = true,
        InsideCastCritBoon = true,
        OmegaCastVolleyBoon = true,
        TimedCritVulnerabilityBoon = true,
        -- New Boons
        ArtemisWeaponBoon = true
    }
}

-- adding LootData Artemis to Codex, uses same as other artemis just without the enemy name
game.CodexData.OlympianGods.Entries.ArtemisUpgrade = {
    Entries = {{
        UnlockGameStateRequirements = {{
            Path = {"GameState", "UseRecord", "ArtemisUpgrade"},
            Comparison = ">=",
            Value = 2
        }},
        Text = "CodexData_Artemis_01"
    }},
    Image = "Codex_Portrait_Artemis"
}

-- Core Traits, aka Weapon Attack, Special, Cast etc
game.LinkedTraitData.ArtemisCoreTraits = {}

-- Need to add to boon info manually since this table is populated way before I do any inserts, plus it doesn't exist even if I have traitindex up in loot
game.ScreenData.BoonInfo.TraitDictionary.ArtemisUpgrade = {
    SupportingFireBoon = true,
    CritBonusBoon = true,
    DashOmegaBuffBoon = true,
    HighHealthCritBoon = true,
    InsideCastCritBoon = true,
    OmegaCastVolleyBoon = true,
    TimedCritVulnerabilityBoon = true,
    -- New Boons
    ArtemisWeaponBoon = true
}

-- This is to add Artemis to RunProgress in LootData so she can spawn as a boon room
local requirementName = {"MaxHealthDrop", "MaxManaDrop", "RoomMoneyDrop", "StackUpgrade", "Devotion"}

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
