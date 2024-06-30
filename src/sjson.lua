---@meta _
---@diagnostic disable: lowercase-global
zanncdwbl_BoonAdditions.TraitTextFile = rom.path.combine(rom.paths.Content, "Game/Text/en/TraitText.en.sjson")
zanncdwbl_BoonAdditions.GUIAnimationsFile = rom.path.combine(rom.paths.Content, "Game/Animations/GUIAnimations.sjson")

zanncdwbl_BoonAdditions.Order = {"Id", "InheritFrom", "DisplayName", "Description"}
zanncdwbl_BoonAdditions.IconOrder = {"Name", "InheritFrom", "FilePath"}

-- Insert for Icons
sjson.hook(zanncdwbl_BoonAdditions.GUIAnimationsFile, function(data)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_SpeedDamageBoon)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_MoveSpeedBoon)
    -- table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_RushRallyBoon) -- Not adding yet.
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_BonusDashBoon)
end)

-- Insert for BoonText
sjson.hook(zanncdwbl_BoonAdditions.TraitTextFile, function(data)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.SpeedDamageBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.SpeedDamageBoon_Text)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.MoveSpeedBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.MoveSpeedBoon_Text)
    -- table.insert(data.Texts, zanncdwbl_BoonAdditions.RushRallyBoon) -- Not adding yet.
    -- table.insert(data.Texts, zanncdwbl_BoonAdditions.RushRallyBoon_Text) -- Not adding yet.
    table.insert(data.Texts, zanncdwbl_BoonAdditions.BonusDashBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.BonusDashBoon_Text)
end)
