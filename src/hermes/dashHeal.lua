-- File is to create the Hermes Quick Recovery Boon -- Not adding yet.
-- LootData_Hermes, TraitData_Hermes, HeroData, RunLogic, MetaUpgradeData, RoomLogic
--
-- Adding Rally Table to Melinoe/Hero
game.HeroData.RallyHealth = {
	RallyActive = false,
	RallyHealOnDash = false,

	-- copy paste from h1
	HitsDrainRallyHealthMultiplier = 0.5, -- Whether getting hit changes the amount of rally health already stored. 0 = completely zero it out, 1 = keep all rally health.
	ConversionPercent = 1.0, -- Percent of taken damage that can be rallied back from
	RallyDecayHold = 0.04, -- Seconds rally health does not decay after a hit
	RallyDecayRateSeconds = 1.3, -- How long after a hit rally health lasts
	Store = 0, -- Data variable
	State = "Idle", -- Data variable
}

-- Creating the boon functions itself
game.TraitData.RushRallyBoon = {
	InheritFrom = { "BaseTrait", "AirBoon" },
	Elements = { "Air" }, -- Need to add this even if you inherit
	Name = "RushRallyBoon",
	Icon = "Boon_Hermes_RushRallyBoon",
	TraitOrderingValueCache = -1,
	BlockStacking = true, -- Not needed, but incase a mod comes along and fucks around

	RarityLevels = {
		Common = {
			Multiplier = 0.3,
		},
		Rare = {
			Multiplier = 0.4,
		},
		Epic = {
			Multiplier = 0.5,
		},
		Heroic = {
			Multiplier = 0.6,
		},
	},

	PropertyChanges = {
		{
			LuaTable = "RallyHealth",
			LuaProperty = "RallyActive",
			ChangeValue = true,
			ChangeType = "Absolute",
		},
		{
			LuaTable = "RallyHealth",
			LuaProperty = "RallyHealOnDash",
			ChangeValue = true,
			ChangeType = "Absolute",
		},
		{
			LuaTable = "RallyHealth",
			LuaProperty = "HitsDrainRallyHealthMultiplier",
			ChangeValue = 0,
			ChangeType = "Absolute",
		},
		{
			LuaTable = "RallyHealth",
			LuaProperty = "ConversionPercent",
			BaseValue = 1.0,
			-- SourceIsMultiplier = true,
			ChangeType = "Absolute",
			ReportValues = {
				ReportedHeal = "ChangeValue",
			},
		},
		{
			LuaTable = "RallyHealth",
			LuaProperty = "RallyDecayRateSeconds",
			ChangeValue = 0.3,
			ChangeType = "Absolute",
		},
	},

	StatLines = { "HealingDamageStatDisplay1" },

	ExtractValues = {
		{
			Key = "ReportedHeal",
			ExtractAs = "TooltipHeal",
			Format = "Percent",
		},
	},
}

-- Icon Data
zanncdwbl_Practical_Gods.Boon_Hermes_RushRallyBoon = sjson.to_object({
	Name = "Boon_Hermes_RushRallyBoon",
	InheritFrom = "BoonIcon",
	FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Quick_Recovery"),
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.RushRallyBoon = sjson.to_object({
	Id = "RushRallyBoon",
	InheritFrom = "BaseBoonMultiline",
	DisplayName = "Quick Recovery",
	Description = "After taking damage, quickly {$Keywords.Dash} to recover some {!Icons.Health} you just lost.",
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.RushRallyBoon_Text = sjson.to_object({
	Id = "HealingDamageStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Life Recovered:",
	Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipHeal:F} {#Prev}{#ItalicFormat}of damage taken",
}, zanncdwbl_Practical_Gods.Order)

table.insert(game.LootData.HermesUpgrade.Traits, "RushRallyBoon")
-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.HermesUpgrade["RushRallyBoon"] = true

-- The bullshit starts here
-- Does this work?
modutil.mod.Path.Wrap("DoPatches", function(base, args)
	if game.CurrentRun ~= nil then
		if game.CurrentRun.Hero ~= nil then
			if game.CurrentRun.Hero.RallyHealth == nil then
				game.CurrentRun.Hero.RallyHealth = ShallowCopyTable(game.HeroData.RallyHealth)
			else
				if game.CurrentRun.Hero.RallyHealth.RallyDecayRateSeconds == nil then
					game.CurrentRun.Hero.RallyHealth.RallyDecayRateSeconds = game.HeroData.RallyHealth.RallyDecayRateSeconds
				end
				if game.CurrentRun.Hero.RallyHealth.RallyDecayHold == nil then
					game.CurrentRun.Hero.RallyHealth.RallyDecayHold = game.HeroData.RallyHealth.RallyDecayHold
				end
				if game.CurrentRun.Hero.RallyHealth.State == nil then
					game.CurrentRun.Hero.RallyHealth.State = game.HeroData.RallyHealth.State
				end
				if game.CurrentRun.Hero.RallyHealth.MaxRallyHealthPerHit == nil then
					game.CurrentRun.Hero.RallyHealth.MaxRallyHealthPerHit = game.HeroData.RallyHealth.MaxRallyHealthPerHit
				end
			end
		end
	end
	base(args)
end)

modutil.mod.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
	local sourceEffectData = nil
	if triggerArgs.EffectName then
		sourceEffectData = EffectData[triggerArgs.EffectName]
	end

	if triggerArgs.DamageAmount ~= nil and triggerArgs.DamageAmount > 0 and not triggerArgs.Silent then
		local adjustedDamageAmount = triggerArgs.DamageAmount

		if game.CurrentRun.Hero.RallyHealth.RallyActive and (sourceEffectData == nil or not sourceEffectData.NoRallyStore) and not triggerArgs.PureDamage then
			if game.CurrentRun.Hero.RallyHealth.HitsDrainRallyHealthMultiplier then
				game.CurrentRun.Hero.RallyHealth.Store = game.CurrentRun.Hero.RallyHealth.Store * game.CurrentRun.Hero.RallyHealth.HitsDrainRallyHealthMultiplier
			end
			game.CurrentRun.Hero.RallyHealth.Store = game.CurrentRun.Hero.RallyHealth.Store + adjustedDamageAmount * game.CurrentRun.Hero.RallyHealth.ConversionPercent
			thread(UpdateRallyHealthUI)
			thread(DrainRallyHealth)
		end
	end

	base(victim, triggerArgs)
end)

function DrainRallyHealth()
	if game.CurrentRun.Hero.RallyHealth.RallyDecayRateSeconds <= 0 then
		game.CurrentRun.Hero.RallyHealth.Store = 0
		return
	end

	local initialEnterState = game.CurrentRun.Hero.RallyHealth.State
	game.CurrentRun.Hero.RallyHealth.State = "Wait"

	if initialEnterState ~= nil and initialEnterState ~= "Idle" then
		return
	end

	local tickRate = 0.03
	local drainRate = 0

	while game.CurrentRun.Hero.RallyHealth.Store >= 0 do
		if game.CurrentRun.Hero.RallyHealth.State == nil or game.CurrentRun.Hero.RallyHealth.State == "Wait" then
			wait(game.CurrentRun.Hero.RallyHealth.RallyDecayHold)
			game.CurrentRun.Hero.RallyHealth.State = "Draining"
			drainRate = tickRate * game.CurrentRun.Hero.RallyHealth.Store / game.CurrentRun.Hero.RallyHealth.RallyDecayRateSeconds
		elseif game.CurrentRun.Hero.RallyHealth.State == "Draining" then
			game.CurrentRun.Hero.RallyHealth.Store = game.CurrentRun.Hero.RallyHealth.Store - drainRate
			thread(UpdateRallyHealthUI)
		end
		wait(tickRate, RoomThreadName)
	end

	RemoveRallyHealth()
end

function RemoveRallyHealth()
	game.CurrentRun.Hero.RallyHealth.Store = 0
	game.CurrentRun.Hero.RallyHealth.State = "Idle"
end

function UpdateRallyHealthUI()
	local unit = game.CurrentRun.Hero
	local rallyHealth = game.CurrentRun.Hero.RallyHealth.Store
	local currentHealth = unit.Health
	local maxHealth = unit.MaxHealth
	if game.CurrentRun.Hero.RallyHealth.Cache ~= nil then
		currentHealth = game.CurrentRun.Hero.RallyHealth.Cache.CurrentHealth
		maxHealth = game.CurrentRun.Hero.RallyHealth.Cache.MaxHealth
	end

	SetAnimationFrameTarget({
		Name = "HealthBarFillWhite",
		Fraction = 1 - (currentHealth + rallyHealth) / maxHealth,
		DestinationId = ScreenAnchors.HealthRally,
	})
end

-- Does this work?
modutil.mod.Path.Wrap("DashManeuver", function(base, duration)
	if CurrentRun.Hero.RallyHealth.RallyActive and CurrentRun.Hero.RallyHealth.RallyHealOnDash and not CurrentRun.Hero.IsDead then
		if CurrentRun.Hero.RallyHealth.Store > 0 then
			rallyHeal = round(CurrentRun.Hero.RallyHealth.Store)
			CurrentRun.Hero.RallyHealth.Store = CurrentRun.Hero.RallyHealth.Store - rallyHeal
			Heal(CurrentRun.Hero, {
				HealAmount = rallyHeal,
				SourceName = "RallyHeal",
				Silent = false,
			})
			RallyHealPresentation()
			thread(UpdateHealthUI)
		end
	end

	base(duration)
end)

-- already in game, its the wings
function RallyHealPresentation()
	CreateAnimation({
		Name = "HermesRallyHeal",
		DestinationId = CurrentRun.Hero.ObjectId,
	})
end

-- literally what is the point of this, I have this code but it links to nothing, I don't see what function it serves in h1
-- game.MetaUpgradeData.RallyMetaUpgrade = {
--     InheritFrom = {"BaseMetaUpgrade"},
--     Skip = true,
--     RequiredAccumulatedMetaPoints = 200,
--     ResourceName = "LockKeys",
--     UnlockCost = 6,
--     CostTable = {40, 60, 100, 200},
--     ShortTotal = "RallyMetaUpgrade_ShortTotal",
--     ChangeValue = 1.15,
--     FormatAsPercent = true
-- }

-- modutil.mod.Path.Wrap("CreateNewHero", function(base, prevRun, args)
--     local newHero = DeepCopyTable(HeroData)

--     newHero.RallyHealth.ConversionPercent = newHero.RallyHealth.ConversionPercent + (GetNumMetaUpgrades("RallyMetaUpgrade") * (MetaUpgradeData.RallyMetaUpgrade.ChangeValue - 1))
--     base(prevRun, args)
-- end)
