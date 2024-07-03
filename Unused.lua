-- GUiAnimations.sjson
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

zanncdwbl_BoonAdditions.BoonBackingC_Artemis = sjson.to_object({
    Name = "BoonBackingC_Artemis",
    InheritFrom = "BoonBackingC",
    ChildAnimation = "BoonSymbolArtemisIcon",
    Color = {
        Red = 1.000,
        Green = 0.392,
        Blue = 0.749
    }
}, zanncdwbl_BoonAdditions.GUIBackingC)

zanncdwbl_BoonAdditions.BoonSymbolArtemisIcon = sjson.to_object({
    Name = "BoonSymbolArtemisIcon",
    InheritFrom = "BoonSymbolBase",
    EndFrame = 1,
    StartFrame = 1,
    FilePath = "GUI\\Screens\\BoonSelectSymbols\\Artemis2"
}, zanncdwbl_BoonAdditions.GUIIcon)

-- GUI Hook
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolGlow_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolFlare_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolArtemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonBackingB_Artemis)
-- Game already has these 2
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonBackingC_Artemis)
table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonSymbolArtemisIcon)
