-- GUIAnimations.sjson
zanncdwbl_BoonAdditions.BoonInfoSymbolArtemisIcon = sjson.to_object({
    Name = "BoonInfoSymbolArtemisIcon",
    InheritFrom = "BoonInfoSymbolBase",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin0015")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Fx.sjson
zanncdwbl_BoonAdditions.BoonDropArtemis = sjson.to_object({
    Name = "BoonDropArtemis",
    InheritFrom = "BoonDropGold",
    ChildAnimation = "BoonDropA-Artemis"
}, zanncdwbl_BoonAdditions.FxChildOrder)

zanncdwbl_BoonAdditions.BoonDropA_Artemis = sjson.to_object({
    Name = "BoonDropA-Artemis",
    InheritFrom = "BoonDropA",
    ChildAnimation = "BoonDropB-Artemis",
    CreateAnimations = {{
        Name = "BoonDropBackGlow"
    }, {
        Name = "BoonDropFrontFlare"
    }},
    Color = {
        Red = 0.42,
        Green = 0.62,
        Blue = 0.21
    }
}, zanncdwbl_BoonAdditions.FxBoonDropOrder)

zanncdwbl_BoonAdditions.BoonDropB_Artemis = sjson.to_object({
    Name = "BoonDropB-Artemis",
    InheritFrom = "BoonDropB",
    ChildAnimation = "BoonDropC-Artemis",
    CreateAnimations = {{
        Name = "BoonDropBackGlow"
    }, {
        Name = "BoonDropFrontFlare"
    }},
    Color = {
        Red = 0.35,
        Green = 0.51,
        Blue = 0.12
    }
}, zanncdwbl_BoonAdditions.FxBoonDropOrder)

zanncdwbl_BoonAdditions.BoonDropC_Artemis = sjson.to_object({
    Name = "BoonDropC-Artemis",
    InheritFrom = "BoonDropC",
    ChildAnimation = "BoonDropArtemisIcon",
    CreateAnimations = {{
        Name = "BoonDropBackGlow"
    }, {
        Name = "BoonDropFrontFlare"
    }},
    Color = {
        Red = 0.23,
        Green = 0.57,
        Blue = 0.31
    }
}, zanncdwbl_BoonAdditions.FxBoonDropOrder)

zanncdwbl_BoonAdditions.BoonDropArtemisIcon = sjson.to_object({
    Name = "BoonDropArtemisIcon",
    InheritFrom = "BoonDropIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin"),
    OffsetZ = -45.0,
    Scale = 0.80
}, zanncdwbl_BoonAdditions.FxBoonDrop)

zanncdwbl_BoonAdditions.BoonDropArtemisPreview = sjson.to_object({
    Name = "BoonDropArtemisPreview",
    InheritFrom = "BoonDropRoomRewardIconPreviewBase",
    NumFrames = 1,
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin0015"),
    OffsetZ = 0,
    Scale = 1.0,
    ColorFromOwner = "Maintain",
    AngleFromOwner = "Ignore"
}, zanncdwbl_BoonAdditions.FxMainOrder)

zanncdwbl_BoonAdditions.BoonDropArtemisUpgradedPreview = sjson.to_object({
    Name = "BoonDropArtemisUpgradedPreview",
    InheritFrom = "BoonDropArtemisPreview",
    ChildAnimation = "BoonUpgradedPreviewSparkles"
}, zanncdwbl_BoonAdditions.FxChildOrder)

-- TraitText for store
zanncdwbl_BoonAdditions.ArtemisUpgrade_Store = sjson.to_object({
    Id = "ArtemisUpgrade_Store",
    InheritFrom = nil,
    DisplayName = "Boon of Artemis",
    Description = "Receive a {$Keywords.GodBoon} of {#BoldFormat}Artemis{#Prev}."
}, zanncdwbl_BoonAdditions.Order)

-- MacroText for displeased
zanncdwbl_BoonAdditions.Player_GodDispleased_ArtemisUpgrade = sjson.to_object({
    Id = "Player_GodDispleased_ArtemisUpgrade",
    DisplayName = "Artemis Grew Displeased!"
}, zanncdwbl_BoonAdditions.MacroOrder)

zanncdwbl_BoonAdditions.SuperSacrifice_CombatText_ArtemisUpgrade = sjson.to_object({
    Id = "SuperSacrifice_CombatText_ArtemisUpgrade",
    DisplayName = "{#CombatTextHighlightFormat}Boons of Artemis {#Prev}{#UpgradeFormat}+{$TempTextData.Amount}{#Prev}{!Icons.PomLevel}!"
}, zanncdwbl_BoonAdditions.MacroOrder)
