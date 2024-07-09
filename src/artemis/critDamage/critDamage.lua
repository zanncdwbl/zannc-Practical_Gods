-- File is to create the Artemis Clean Kill Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisCriticalBoon = {
    InheritFrom = {"BaseTrait", "AirBoon"},
    Elements = {"Air"}, -- Need to add this even if you inherit
    Name = "ArtemisCriticalBoon",
    BoonInfoTitle = "ArtemisCriticalBoon",
    Icon = "Boon_Artemis_ArtemisCriticalBoon",
    TraitOrderingValueCache = 50,
    BlockStacking = false,
    RarityLevels = {
        Common = {
            Multiplier = 1.0
        },
        Rare = {
            Multiplier = 1.5
        },
        Epic = {
            Multiplier = 2.0
        },
        Heroic = {
            Multiplier = 2.5
        }
    },

    AddOutgoingDamageModifiers = {
        CritDamageBonus = {
            BaseValue = 1.15,
            SourceIsMultiplier = true,
            -- Scaling thing with pom
            AbsoluteStackValues = {
                [1] = 1.20,
                [2] = 1.15,
                [3] = 1.10
            },
            ChangeType = "Multiply"
        },
        ReportValues = {
            ReportedCriticalDamageBonus = "CritDamageBonus"
        }
    },

    StatLines = {"CriticalDamageBonusStatDisplay1"},

    ExtractValues = {{
        Key = "ReportedCriticalDamageBonus",
        ExtractAs = "TooltipDamage",
        Format = "PercentDelta"
    }}
}

-- Icon Data
zanncdwbl_BoonAdditions.Boon_Artemis_ArtemisCriticalBoon = sjson.to_object({
    Name = "Boon_Artemis_ArtemisCriticalBoon",
    InheritFrom = "BoonIcon",
    FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Clean_Kill")
}, zanncdwbl_BoonAdditions.IconOrder)

-- Boons Description/Display
zanncdwbl_BoonAdditions.ArtemisCriticalBoon = sjson.to_object({
    Id = "ArtemisCriticalBoon",
    InheritFrom = "BaseBoonMultiline",
    DisplayName = "Clean Kill",
    Description = "Your {$Keywords.Crit} effects deal even more damage."
}, zanncdwbl_BoonAdditions.Order)

zanncdwbl_BoonAdditions.ArtemisCriticalBoon_Text = sjson.to_object({
    Id = "CriticalDamageBonusStatDisplay1",
    InheritFrom = "BaseStatLine",
    DisplayName = "{!Icons.Bullet}{#PropertyFormat}Critical Damage:",
    Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}"
}, zanncdwbl_BoonAdditions.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisCriticalBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisCriticalBoon"] = true

-- Multiply crit damage by x boon amount
modutil.mod.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)
    local attacker = triggerArgs.AttackerTable

    if triggerArgs.IsCrit then
        for i, modifierData in pairs(attacker.OutgoingDamageModifiers) do
            if modifierData.CritDamageBonus then
                triggerArgs.DamageAmount = triggerArgs.DamageAmount * modifierData.CritDamageBonus
            end
        end
    end
    base(victim, triggerArgs)
end)
