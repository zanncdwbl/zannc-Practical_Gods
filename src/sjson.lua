---@meta _
---@diagnostic disable: lowercase-global
zanncdwbl_BoonAdditions.TraitTextFile = rom.path.combine(rom.paths.Content, "Game/Text/en/TraitText.en.sjson")
zanncdwbl_BoonAdditions.GUIAnimationsFile = rom.path.combine(rom.paths.Content, "Game/Animations/GUIAnimations.sjson")
zanncdwbl_BoonAdditions.FxFile = rom.path.combine(rom.paths.Content, "Game/Animations/Fx.sjson")

zanncdwbl_BoonAdditions.Order = {"Id", "InheritFrom", "DisplayName", "Description"}
zanncdwbl_BoonAdditions.IconOrder = {"Name", "InheritFrom", "FilePath"}

-- Artemis Icon File Orders
zanncdwbl_BoonAdditions.FxMainOrder = {"Name", "InheritFrom", "NumFrames", "FilePath", "OffsetZ", "Scale",
                                       "ColorFromOwner", "AngleFromOwner"}
zanncdwbl_BoonAdditions.FxChildOrder = {"Name", "InheritFrom", "ChildAnimation"}
zanncdwbl_BoonAdditions.FxBoonDropOrder = {"Name", "InheritFrom", "ChildAnimation", "CreateAnimations", "Color"}

-- Insert for Icons
sjson.hook(zanncdwbl_BoonAdditions.GUIAnimationsFile, function(data)
    -- Hermes Boons
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_SpeedDamageBoon)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_MoveSpeedBoon)
    -- table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_RushRallyBoon) -- Not adding yet.
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Hermes_BonusDashBoon)

    -- Artemis Boons
    table.insert(data.Animations, zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisWeaponBoon)

    -- Artemis Icon Spin
    table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonInfoSymbolArtemisIcon)
end)

-- Insert for BoonText
sjson.hook(zanncdwbl_BoonAdditions.TraitTextFile, function(data)
    -- Hermes Boons
    table.insert(data.Texts, zanncdwbl_BoonAdditions.SpeedDamageBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.SpeedDamageBoon_Text)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.MoveSpeedBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.MoveSpeedBoon_Text)
    -- table.insert(data.Texts, zanncdwbl_BoonAdditions.RushRallyBoon) -- Not adding yet.
    -- table.insert(data.Texts, zanncdwbl_BoonAdditions.RushRallyBoon_Text) -- Not adding yet.
    table.insert(data.Texts, zanncdwbl_BoonAdditions.BonusDashBoon)
    table.insert(data.Texts, zanncdwbl_BoonAdditions.BonusDashBoon_Text)

    -- Artemis Boons

end)

-- Insert for Fx, Just mainly Artemis
sjson.hook(zanncdwbl_BoonAdditions.FxFile, function(data)
    -- Everything is just for Artemis Icon and Drops
    table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonDropArtemisPreview)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonDropArtemisUpgradedPreview)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonDropArtemis)
    table.insert(data.Animations, zanncdwbl_BoonAdditions.BoonDropA_Artemis)
end)
