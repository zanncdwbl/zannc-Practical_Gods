-- File is to create the Hermes Greatest Reflex Boon
-- LootData_Hermes, TraitData_Hermes
--
-- Game already has a BonusDashBoon coded in, so i don't have to create the boon itself
-- Changing Icon here instead
game.TraitData.BonusDashBoon.Icon = "Boon_Hermes_BonusDashBoon"

-- Icon Data -- Game uses Boon 1
zanncdwbl_Practical_Gods.Boon_Hermes_BonusDashBoon = sjson.to_object({
    Name = "Boon_Hermes_BonusDashBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Greatest_Reflex")
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.BonusDashBoon = sjson.to_object({
    Id = "BonusDashBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Greatest Reflex",
    Description = "You can {$Keywords.Dash} more times in a row."
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.BonusDashBoon_Text = sjson.to_object({
    Id = "BonusDashStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Bonus {$Keywords.Dash} Charges:",
    Description = "{#UpgradeFormat}+{$TooltipData.ExtractData.TooltipSprintBonus}"
}, zanncdwbl_Practical_Gods.Order)

-- Insert into hermes trait table
table.insert(game.LootData.HermesUpgrade.Traits, "BonusDashBoon")
-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.HermesUpgrade["BonusDashBoon"] = true
