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
    FilePath = rom.path.combine(_PLUGIN.guid, "BoonIcons\\Clean_Kill")
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
    Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:F}"
}, zanncdwbl_BoonAdditions.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisCriticalBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisCriticalBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.WeaponTraits, "ArtemisCriticalBoon")
table.insert(game.LinkedTraitData.SpecialTraits, "ArtemisCriticalBoon")
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisCriticalBoon")

modutil.mod.Path.Wrap("Damage", function(base, victim, triggerArgs)
    if not triggerArgs.PureDamage then
        local attacker = triggerArgs.AttackerTable
        local sourceProjectileData = nil
        local sourceEffectData = nil
        local sourceWeaponData = GetWeaponData(attacker, triggerArgs.SourceWeapon)
        if triggerArgs.SourceProjectile ~= nil then
            sourceProjectileData = ProjectileData[triggerArgs.SourceProjectile]
        end
        if triggerArgs.EffectName ~= nil then
            sourceEffectData = EffectData[triggerArgs.EffectName]
        end
        local baseDamage = triggerArgs.DamageAmount + CalculateBaseDamageAdditions(attacker, victim, triggerArgs)
        local multipliers = CalculateDamageMultipliers(attacker, victim, sourceWeaponData, triggerArgs)
        local additive = CalculateDamageAdditions(attacker, victim, sourceWeaponData, triggerArgs)
        local critChance = CalculateCritChance(attacker, victim, sourceWeaponData, triggerArgs)
        triggerArgs.IsCrit = RandomChance(critChance)
        triggerArgs.DamageAmount = round(baseDamage * multipliers) + additive

        -- Base Code
        -- if triggerArgs.IsCrit then
        --     triggerArgs.DamageAmount = triggerArgs.DamageAmount * 3
        -- end

        if triggerArgs.IsCrit then
            local critMultiplier = 3
            for _, modifierData in pairs(attacker.OutgoingDamageModifiers) do
                if modifierData.CritDamageBonus then -- If the boon is active, then multiply 3 x whatever the mult is
                    critMultiplier = critMultiplier * modifierData.CritDamageBonus
                end
            end

            triggerArgs.DamageAmount = round(baseDamage * multipliers * critMultiplier) + additive
        end
    end
    base(victim, triggerArgs)
end)
