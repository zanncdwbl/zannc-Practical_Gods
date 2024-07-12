-- GUIAnimations.sjson
zanncdwbl_Practical_Gods.BoonInfoSymbolArtemisIcon = sjson.to_object({
    Name = "BoonInfoSymbolArtemisIcon",
    InheritFrom = "BoonInfoSymbolBase",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin0015")
}, zanncdwbl_Practical_Gods.IconOrder)

-- Fx.sjson
zanncdwbl_Practical_Gods.BoonDropArtemis = sjson.to_object({
    Name = "BoonDropArtemis",
    InheritFrom = "BoonDropGold",
    ChildAnimation = "BoonDropA-Artemis"
}, zanncdwbl_Practical_Gods.FxChildOrder)

zanncdwbl_Practical_Gods.BoonDropA_Artemis = sjson.to_object({
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
}, zanncdwbl_Practical_Gods.FxBoonDropOrder)

zanncdwbl_Practical_Gods.BoonDropB_Artemis = sjson.to_object({
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
}, zanncdwbl_Practical_Gods.FxBoonDropOrder)

zanncdwbl_Practical_Gods.BoonDropC_Artemis = sjson.to_object({
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
}, zanncdwbl_Practical_Gods.FxBoonDropOrder)

zanncdwbl_Practical_Gods.BoonDropArtemisIcon = sjson.to_object({
    Name = "BoonDropArtemisIcon",
    InheritFrom = "BoonDropIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin"),
    OffsetZ = -45.0,
    Scale = 0.80
}, zanncdwbl_Practical_Gods.FxBoonDrop)

zanncdwbl_Practical_Gods.BoonDropArtemisPreview = sjson.to_object({
    Name = "BoonDropArtemisPreview",
    InheritFrom = "BoonDropRoomRewardIconPreviewBase",
    NumFrames = 1,
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin00151"),
    OffsetZ = 0,
    Scale = 0.8,
    ColorFromOwner = "Maintain",
    AngleFromOwner = "Ignore"
}, zanncdwbl_Practical_Gods.FxMainOrder)

zanncdwbl_Practical_Gods.BoonDropArtemisUpgradedPreview = sjson.to_object({
    Name = "BoonDropArtemisUpgradedPreview",
    InheritFrom = "BoonDropArtemisPreview",
    ChildAnimation = "BoonUpgradedPreviewSparkles"
}, zanncdwbl_Practical_Gods.FxChildOrder)

-- TraitText for store
zanncdwbl_Practical_Gods.ArtemisUpgrade_Store = sjson.to_object({
    Id = "ArtemisUpgrade_Store",
    InheritFrom = nil,
    DisplayName = "Boon of Artemis",
    Description = "Receive a {$Keywords.GodBoon} of {#BoldFormat}Artemis{#Prev}."
}, zanncdwbl_Practical_Gods.Order)

-- MacroText for displeased
zanncdwbl_Practical_Gods.Player_GodDispleased_ArtemisUpgrade = sjson.to_object({
    Id = "Player_GodDispleased_ArtemisUpgrade",
    DisplayName = "Artemis Grew Displeased!"
}, zanncdwbl_Practical_Gods.MacroOrder)

zanncdwbl_Practical_Gods.SuperSacrifice_CombatText_ArtemisUpgrade = sjson.to_object({
    Id = "SuperSacrifice_CombatText_ArtemisUpgrade",
    DisplayName = "{#CombatTextHighlightFormat}Boons of Artemis {#Prev}{#UpgradeFormat}+{$TempTextData.Amount}{#Prev}{!Icons.PomLevel}!"
}, zanncdwbl_Practical_Gods.MacroOrder)
