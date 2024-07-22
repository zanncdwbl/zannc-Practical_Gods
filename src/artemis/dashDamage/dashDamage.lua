-- File is to create the Artemis Hunter Dash Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisDashBoon = {
	InheritFrom = { "BaseTrait", "EarthBoon" },
	Elements = { "Earth" }, -- Need to add this even if you inherit
	Name = "ArtemisDashBoon",
	BoonInfoTitle = "ArtemisDashBoon",
	Icon = "Boon_Artemis_ArtemisDashBoon",
	Slot = "Rush",
	TraitOrderingValueCache = 50,
	BlockStacking = false,
	RarityLevels = {
		Common = {
			Multiplier = 1.0,
		},
		Rare = {
			Multiplier = 1.5,
		},
		Epic = {
			Multiplier = 2.0,
		},
		Heroic = {
			Multiplier = 2.5,
		},
	},

	PropertyChanges = {
		{
			WeaponName = "WeaponSprint",
			EffectName = "SprintFx",
			EffectProperty = "BackFx",
			-- ChangeValue = "HeraSprintFxSpawner",
		},
		{
			WeaponName = "WeaponSprint",
			EffectName = "SprintFx",
			EffectProperty = "FrontFx",
			-- ChangeValue = "MelSprintFxSpawner_Hera",
		},
	},

	OnSprintAction = {
		FunctionName = "HeraSprintLink",
		RunOnce = true,
		Args = {
			Radius = 200,
			Range = 600,
			StartDelay = 0.2,
			Cooldown = 0.2,
			Vfx = "HeraSprintPullFx",
			EffectName = "DamageShareEffect",
			NumJumps = 1,
			ProjectileName = "HeraSprintProjectile",
			VfxCooldown = 0.1, -- For the projectile link damage
			DamageMultiplier = {
				BaseValue = 1,
				MinMultiplier = 0.1,
				AbsoluteStackValues = {
					[1] = 0.50,
					[2] = 0.25,
				},
			},
			ReportValues = {
				ReportedJumps = "NumJumps",
				ReportedMultiplier = "DamageMultiplier",
			},
		},

		-- Need to somehow get it to give 10% crit chance for like x seconds when the sprint is finished, and it cant stack over itself
	},

	WeaponDataOverride = {
		WeaponSprint = {
			Sounds = {
				ChargeSounds = {
					{
						-- Name = "/SFX/Player Sounds/HeraSprintLoop",
						StoppedBy = { "ChargeCancel" },
					},
				},
			},
		},
	},

	StatLines = { "DashDamageStatDisplay1" },

	-- ExtractValues = {{
	--     Key = "CriticalHealthBufferMultiplier",
	--     ExtractAs = "TooltipDamageBonus",
	--     Format = "PercentDelta"
	-- }}
}

-- =========================================================
--  PowersLogic
-- =========================================================
-- Support Fire Logic
function CheckSupportingFire(victim, functionArgs, triggerArgs)
	local cooldown = functionArgs.Cooldown or 0.1667
	if CheckCooldown("SupportFire", window) then
		local angle = functionArgs.StartAngle
		if angle and functionArgs.Scatter then
			angle = angle + RandomFloat(-functionArgs.Scatter, functionArgs.Scatter)
		end

		CreateProjectileFromUnit({
			Name = functionArgs.ProjectileName,
			Id = CurrentRun.Hero.ObjectId,
			DestinationId = victim.ObjectId,
			Angle = angle + triggerArgs.ImpactAngle,
			DamageMultiplier = functionArgs.DamageMultiplier,
			FizzleOldestProjectileCount = functionArgs.FizzleOldestProjectileCount,
			ProjectileCap = functionArgs.ProjectileCap,
		})
	end
end

-- This is whats related to hera's sprint boon, just so you know what to look for
function HeraSprintSuction(functionArgs)
	if CheckCooldown("HeraSprintSuction", functionArgs.Cooldown) then
		local nearestEnemyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = functionArgs.Radius })
		CreateAnimation({ Name = functionArgs.PullVfx, DestinationId = CurrentRun.Hero.ObjectId, ScaleRadius = functionArgs.Radius })
		for i, id in pairs(nearestEnemyTargetIds) do
			ApplyForce({
				Id = id,
				SelfApplied = true,
				Speed = GetRequiredForceToEnemy(id, CurrentRun.Hero.ObjectId, -functionArgs.DeadZoneRadius, functionArgs.DistanceMultiplier),
				Angle = GetAngleBetween({ Id = id, DestinationId = CurrentRun.Hero.ObjectId }),
			})
			ApplyDamageShare(ActiveEnemies[id], functionArgs)
		end
	end
end

function HeraSprintLink(functionArgs)
	if not CurrentRun.Hero.SprintActive or not SessionMapState.SprintStartTime or (functionArgs.StartDelay and (_worldTimeUnmodified - SessionMapState.SprintStartTime) < functionArgs.StartDelay) then
		return
	end
	if CheckCooldown("HeraSprintSuction", functionArgs.Cooldown) then
		local enemyId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = functionArgs.Radius })
		CreateAnimation({ Name = functionArgs.Vfx, DestinationId = CurrentRun.Hero.ObjectId })
		if enemyId and ActiveEnemies[enemyId] and not ActiveEnemies[enemyId].IsDead then
			local firstApplication = (ActiveEnemies[enemyId].ActiveEffects and not ActiveEnemies[enemyId].ActiveEffects[functionArgs.EffectName])
			ApplyDamageShare(ActiveEnemies[enemyId], functionArgs)
			if firstApplication and functionArgs.ProjectileName then
				thread(DelayFireSprintLinkProjectile, enemyId, functionArgs)
			end
		end
	end
end

function DelayFireSprintLinkProjectile(enemyId, functionArgs)
	waitUnmodified(0.05)
	if enemyId and ActiveEnemies[enemyId] and not ActiveEnemies[enemyId].IsDead then
		CreateProjectileFromUnit({ Name = functionArgs.ProjectileName, Id = CurrentRun.Hero.ObjectId, DestinationId = enemyId, DamageMultiplier = functionArgs.DamageMultiplier })
		if CheckCooldown("HeraCastPresentation", functionArgs.VfxCooldown) then
			CreateAnimationsBetween({
				Animation = "HeraRope",
				DestinationId = enemyId,
				Id = CurrentRun.Hero.ObjectId,
				Stretch = true,
				UseZLocation = false,
			})
		end
	end
end

-- ========================================================= Remove this and ^ that when you dont need it anymore

-- Icon Data
zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisDashBoon = sjson.to_object({
	Name = "Boon_Artemis_ArtemisDashBoon",
	InheritFrom = "BoonIcon",
	FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Hunter_Dash"),
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.ArtemisDashBoon = sjson.to_object({
	Id = "ArtemisDashBoon",
	InheritFrom = "BaseBoonMultiline",
	DisplayName = "Hunter Dash",
	Description = "Your {$Keywords.Sprint} firesa seeking arrow, and you gain {#UpgradeFormat}10% {#Prev}Chance to deal {$Keywords.Crit} damage.",
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.ArtemisDashBoon_Text = sjson.to_object({
	Id = "DashDamageStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Homing Arrows Damage",
	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}",
}, zanncdwbl_Practical_Gods.Order)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, "ArtemisDashBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisDashBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisDashBoon")

-- =========================================================
-- Hades 1 Artemis boon
-- =========================================================

-- ArtemisRushTrait =
-- {
-- 	InheritFrom = { "ShopTier1Trait" },
-- 	RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
-- 	God = "Artemis",
-- 	Icon = "Boon_Artemis_03",
-- 	Slot = "Rush",
-- 	RarityLevels =
-- 	{
-- 		Common =
-- 		{
-- 			Multiplier = 1.00,
-- 		},
-- 		Rare =
-- 		{
-- 			Multiplier = 1.20,
-- 		},
-- 		Epic =
-- 		{
-- 			Multiplier = 1.40,
-- 		},
-- 		Heroic =
-- 		{
-- 			Multiplier = 1.60,
-- 		}
-- 	},
-- 	AddOutgoingDamageModifiers =
-- 	{
-- 		ValidWeaponMultiplier = {
-- 			BaseValue = 1.5,
-- 			SourceIsMultiplier = true,
-- 			IdenticalMultiplier =
-- 			{
-- 				Value = -0.8,
-- 			},
-- 		},
-- 		ValidWeapons = WeaponSets.HeroDashWeapons,
-- 		ExcludeLinked = true,
-- 		ExtractValues =
-- 		{
-- 			{
-- 				Key = "ValidWeaponMultiplier",
-- 				ExtractAs = "TooltipDamageBonus",
-- 				Format = "PercentDelta",
-- 			},
-- 		}
-- 	},
-- 	PropertyChanges =
-- 	{
-- 		{
-- 			WeaponNames = WeaponSets.HeroRushWeapons,
-- 			WeaponProperty = "FireFx",
-- 			ChangeValue = "BlinkTrailVerticalB-Artemis",
-- 			ChangeType = "Absolute",
-- 		},
-- 		{
-- 			WeaponNames = WeaponSets.HeroRushWeapons,
-- 			WeaponProperty = "FireGraphic",
-- 			ChangeValue = "ZagreusDashNoCollide_Artemis",
-- 			ChangeType = "Absolute",
-- 		},
-- 	},
-- },
