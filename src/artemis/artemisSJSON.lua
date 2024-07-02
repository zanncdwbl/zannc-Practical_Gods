-- GUIAnimations.sjson
zanncdwbl_BoonAdditions.BoonInfoSymbolArtemisIcon = sjson.to_object({
    Name = "BoonInfoSymbolArtemisIcon",
    InheritFrom = "BoonInfoSymbolBase",
    FilePath = rom.path.combine(_PLUGIN.guid, "Items\\Loot\\Boon\\ArtemisIconSpin\\ArtemisIconSpin0015")
}, zanncdwbl_BoonAdditions.IconOrder)

zanncdwbl_BoonAdditions.BoonSymbolGlow_Artemis = sjson.to_object({
    Name = "BoonSymbolGlow_Artemis",
    InheritFrom = "BoonSymbolGlow",
    Color = {
        Red = 1.000,
        Green = 0.329,
        Blue = 0.173
    }
}, zanncdwbl_BoonAdditions.GUIFlameGlow)

zanncdwbl_BoonAdditions.BoonSymbolFlare_Artemis = sjson.to_object({
    Name = "BoonSymbolFlare_Artemis",
    InheritFrom = "BoonSymbolFlare",
    Color = {
        Red = 1.000,
        Green = 0.235,
        Blue = 0.000
    }
}, zanncdwbl_BoonAdditions.GUIFlameGlow)

zanncdwbl_BoonAdditions.BoonSymbolArtemis = sjson.to_object({
    Name = "BoonSymbolArtemis",
    InheritFrom = "BoonBackingA",
    ChildAnimation = "BoonBackingB_Artemis",
    Scale = 0.5,
    CreateAnimations = {{
        Name = "BoonSymbolGlow_Artemis"
    }, {
        Name = "BoonSymbolFlare_Artemis"
    }},
    Color = {
        Red = 1.000,
        Green = 0.800,
        Blue = 0.000
    }
}, zanncdwbl_BoonAdditions.GUISymbol)

zanncdwbl_BoonAdditions.BoonBackingB_Artemis = sjson.to_object({
    Name = "BoonBackingB_Artemis",
    InheritFrom = "BoonBackingB",
    ChildAnimation = "BoonBackingC_Artemis",
    Scale = 0.5,
    Color = {
        Red = 1.000,
        Green = 0.953,
        Blue = 0.631
    }
}, zanncdwbl_BoonAdditions.GUIBackingB)

-- zanncdwbl_BoonAdditions.BoonBackingC_Artemis = sjson.to_object({
--     Name = "BoonBackingC_Artemis",
--     InheritFrom = "BoonBackingC",
--     ChildAnimation = "BoonSymbolArtemisIcon",
--     Color = {
--         Red = 1.000,
--         Green = 0.392,
--         Blue = 0.749
--     }
-- }, zanncdwbl_BoonAdditions.GUIBackingC)

-- zanncdwbl_BoonAdditions.BoonSymbolArtemisIcon = sjson.to_object({
--     Name = "BoonSymbolArtemisIcon",
--     InheritFrom = "BoonSymbolBase",
--     EndFrame = 1,
--     StartFrame = 1,
--     FilePath = "GUI\\Screens\\BoonSelectSymbols\\Artemis2"
-- }, zanncdwbl_BoonAdditions.GUIIcon)

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
        Red = 0.78,
        Green = 1.0,
        Blue = 0.48
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
        Green = 0.98,
        Blue = 0.51
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
        Red = 0.62,
        Green = 1.0,
        Blue = 0.48
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
    Scale = 0,
    ColorFromOwner = "Maintain",
    AngleFromOwner = "Ignore"
}, zanncdwbl_BoonAdditions.FxMainOrder)

zanncdwbl_BoonAdditions.BoonDropArtemisUpgradedPreview = sjson.to_object({
    Name = "BoonDropArtemisUpgradedPreview",
    InheritFrom = "BoonDropArtemisPreview",
    ChildAnimation = "BoonUpgradedPreviewSparkles"
}, zanncdwbl_BoonAdditions.FxChildOrder)
