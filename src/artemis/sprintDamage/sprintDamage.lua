-- File is to create the Artemis Hunter Dash Boon
-- TraitData_Artemis
--
-- Creating the boon functions itself
game.TraitData.ArtemisSprintBoon = {
	InheritFrom = { "BaseTrait", "EarthBoon" },
	Elements = { "Earth" }, -- Need to add this even if you inherit
	Name = "ArtemisSprintBoon",
	BoonInfoTitle = "ArtemisSprintBoon",
	Icon = "Boon_Artemis_ArtemisSprintBoon",
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

	OnWeaponFiredFunctions = {
		ValidWeapons = { "WeaponSprint" },
		-- we need to do this string building or the save gets bricked as soon as you leave the room
		FunctionName = "rom.mods." .. _PLUGIN.guid .. ".not.ArtemisSprintFire",
		FunctionArgs = {
			ProjectileName = "ArtemisSupportingFireSprint",
			Cooldown = 0.3,
			-- StartAngle = 180,
			Scatter = 180,
			-- ProjectileCap = 3,
			Radius = 500,
			CostPerStrike = 2,
			DamageMultiplier = { BaseValue = 1 },
			ReportValues = { ReportedMultiplier = "DamageMultiplier" },
		},
	},

	StatLines = { "SupportFireDamageDisplay1" },

	ExtractValues = {
		{
			Key = "ReportedMultiplier",
			ExtractAs = "Damage",
			Format = "MultiplyByBase",
			BaseType = "Projectile",
			BaseName = "ArtemisSupportingFireSprint",
			BaseProperty = "Damage",
		},
	},
}

--[[ this isn't working yet. need to double check and make sure the structure is correct

we also need to add ArtemisSupportingFireSprint to PlayerProjectiles.sjson - i guess we could start with an exact copy of ArtemisSupportingFire (line 5057)

once the sjson is in, we can try replacing ProjectileName and BaseName in the trait
then i think this will make the damage show up with a unique name
]]
game.ProjectileData.ArtemisSupportingFireSprint = {
	InheritFrom = { "ArtemisColorProjectile" }, -- This doesn't actually inherit anything for some reason
	Name = "ArtemisSupportingFireSprint",

	DamageTextStartColor = Color.ArtemisDamageLight,
	DamageTextColor = Color.ArtemisDamage,
	Sounds = {
		ImpactSounds = {
			Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
			Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
			Bone = "/SFX/ArrowMetalBoneSmash",
			Brick = "/SFX/ArrowMetalStoneClang",
			Stone = "/SFX/ArrowMetalStoneClang",
			Organic = "/SFX/GunBulletOrganicImpact",
			StoneObstacle = "/SFX/ArrowWallHitClankSmall",
			BrickObstacle = "/SFX/ArrowWallHitClankSmall",
			MetalObstacle = "/SFX/ArrowWallHitClankSmall",
			BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
		},
	},
}

-- this janky stuff is because the function needs to be public, but we don't really want it to appear as a public function
local not_public = {}
public["not"] = not_public

function not_public.ArtemisSprintFire(weaponData, functionArgs, triggerArgs)
	local manaCost = 0
	if functionArgs.CostPerStrike and functionArgs.CostPerStrike > 0 then
		manaCost = GetManaCost(weaponData, true, { ManaCostOverride = functionArgs.CostPerStrike })
	end
	-- get closest enemy
	local enemyId = game.GetClosest({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationName = "EnemyTeam",
		IgnoreInvulnerable = true,
		IgnoreHomingIneligible = true,
		Distance = functionArgs.Radius,
	})

	-- if it's a valid enemy...
	if enemyId and game.ActiveEnemies[enemyId] and not game.ActiveEnemies[enemyId].IsDead then
		local victim = game.ActiveEnemies[enemyId] -- get the actual object for the given id

		if CheckCooldown("ArtemisSprintFire", functionArgs.Cooldown, true) then
			if game.CurrentRun.Hero.Mana >= manaCost then
				local angle = randomint(0, 360)
				if angle and functionArgs.Scatter then
					angle = angle + RandomFloat(-functionArgs.Scatter, functionArgs.Scatter)
				end

				CreateProjectileFromUnit({
					Name = functionArgs.ProjectileName,
					Id = CurrentRun.Hero.ObjectId,
					DestinationId = victim.ObjectId,
					Angle = angle,
					DamageMultiplier = functionArgs.DamageMultiplier,
					ProjectileCap = 3,
					Count = randomint(1, 3),
				})
				ManaDelta(-manaCost)
			end
		end
	end
end

-- Icon Data
zanncdwbl_Practical_Gods.Boon_Artemis_ArtemisSprintBoon = sjson.to_object({
	Name = "Boon_Artemis_ArtemisSprintBoon",
	InheritFrom = "BoonIcon",
	FilePath = rom.path.combine(_PLUGIN.guid, "GUI\\Screens\\BoonIcons\\Hunter_Dash"),
}, zanncdwbl_Practical_Gods.IconOrder)

-- Boons Description/Display
zanncdwbl_Practical_Gods.ArtemisSprintBoon = sjson.to_object({
	Id = "ArtemisSprintBoon",
	InheritFrom = "BaseBoonMultiline",
	DisplayName = "Hunter Dash",
	Description = "Your {$Keywords.Sprint} fires a seeking arrow, and you gain {#UpgradeFormat}10% {#Prev}Chance to deal {$Keywords.Crit} damage.",
}, zanncdwbl_Practical_Gods.Order)

-- zanncdwbl_Practical_Gods.ArtemisSprintBoon_Text = sjson.to_object({
-- 	Id = "DashDamageStatDisplay1",
-- 	InheritFrom = "BaseStatLine",
-- 	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Seeking Arrows Damage",
-- 	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}",
-- }, zanncdwbl_Practical_Gods.Order)

-- Adding her ProjectileData
zanncdwbl_Practical_Gods.ArtemisSupportingFireSprint = sjson.to_object({
	Name = "ArtemisSupportingFireSprint",
	InheritFrom = "1_BaseNonPhysicalProjectile",
	Type = "HOMING",
	HomingAllegiance = "ENEMIES",
	AdjustRateAcceleration = 900,
	MaxAdjustRate = 3600,
	Speed = 1200,
	Acceleration = 300,
	Range = 1000.0,
	Damage = 20, -- Damage Increased from 10
	CheckObstacleImpact = false,
	CheckUnitImpact = true,
	UnlimitedUnitPenetration = false,
	DetonateAtVictimLocation = true,
	UseVulnerability = true,
	IgnoreCoverageAngles = true,
	Thing = {
		Graphic = "ArtemisRangedArrowheadLegendary",
		OffsetZ = 112,
		AttachedAnim = "null",
		Grip = 999999,
		RotateGeometry = true,
		Points = {
			{
				X = 76,
				Y = 16,
			},
			{
				X = 76,
				Y = -16,
			},
			{
				X = -32,
				Y = -16,
			},
			{
				X = -32,
				Y = 16,
			},
		},
	},
}, zanncdwbl_Practical_Gods.ProjectileSupportFireOrder)

-- Adding Boons to Default Artemis
table.insert(game.UnitSetData.NPC_Artemis.NPC_Artemis_Field_01.Traits, 3, "ArtemisSprintBoon")

-- Insert TraitIndex into BoonInfo or else it won't show up in codex since BoonInfo gets populated before traits are added by mods
-- Just adds the boon to the codex - aka the (Hidden) "TraitIndex"
game.ScreenData.BoonInfo.TraitDictionary.NPC_Artemis_Field_01["ArtemisSprintBoon"] = true

-- Adding Traits to TraitData Table, and adding her as core, aka weapon, special, cast, etc
table.insert(game.LinkedTraitData.ArtemisCoreTraits, "ArtemisSprintBoon")

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

-- =========================================================
--  PowersLogic
-- =========================================================
-- Support Fire Logic
-- function CheckSupportingFire(victim, functionArgs, triggerArgs)
-- 	local cooldown = functionArgs.Cooldown or 0.1667
-- 	if CheckCooldown("SupportFire", window) then
-- 		local angle = functionArgs.StartAngle
-- 		if angle and functionArgs.Scatter then
-- 			angle = angle + RandomFloat(-functionArgs.Scatter, functionArgs.Scatter)
-- 		end

-- 		CreateProjectileFromUnit({
-- 			Name = functionArgs.ProjectileName,
-- 			Id = CurrentRun.Hero.ObjectId,
-- 			DestinationId = victim.ObjectId,
-- 			Angle = angle + triggerArgs.ImpactAngle,
-- 			DamageMultiplier = functionArgs.DamageMultiplier,
-- 			FizzleOldestProjectileCount = functionArgs.FizzleOldestProjectileCount,
-- 			ProjectileCap = functionArgs.ProjectileCap,
-- 		})
-- 	end
-- end

-- -- This is whats related to hera's sprint boon, just so you know what to look for
-- function HeraSprintSuction(functionArgs)
-- 	if CheckCooldown("HeraSprintSuction", functionArgs.Cooldown) then
-- 		local nearestEnemyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = functionArgs.Radius })
-- 		CreateAnimation({ Name = functionArgs.PullVfx, DestinationId = CurrentRun.Hero.ObjectId, ScaleRadius = functionArgs.Radius })
-- 		for i, id in pairs(nearestEnemyTargetIds) do
-- 			ApplyForce({
-- 				Id = id,
-- 				SelfApplied = true,
-- 				Speed = GetRequiredForceToEnemy(id, CurrentRun.Hero.ObjectId, -functionArgs.DeadZoneRadius, functionArgs.DistanceMultiplier),
-- 				Angle = GetAngleBetween({ Id = id, DestinationId = CurrentRun.Hero.ObjectId }),
-- 			})
-- 			ApplyDamageShare(ActiveEnemies[id], functionArgs)
-- 		end
-- 	end
-- end

-- function HeraSprintLink(functionArgs)
-- 	if not CurrentRun.Hero.SprintActive or not SessionMapState.SprintStartTime or (functionArgs.StartDelay and (_worldTimeUnmodified - SessionMapState.SprintStartTime) < functionArgs.StartDelay) then
-- 		return
-- 	end
-- 	if CheckCooldown("HeraSprintSuction", functionArgs.Cooldown) then
-- 		local enemyId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = functionArgs.Radius })
-- 		CreateAnimation({ Name = functionArgs.Vfx, DestinationId = CurrentRun.Hero.ObjectId })
-- 		if enemyId and ActiveEnemies[enemyId] and not ActiveEnemies[enemyId].IsDead then
-- 			local firstApplication = (ActiveEnemies[enemyId].ActiveEffects and not ActiveEnemies[enemyId].ActiveEffects[functionArgs.EffectName])
-- 			ApplyDamageShare(ActiveEnemies[enemyId], functionArgs)
-- 			if firstApplication and functionArgs.ProjectileName then
-- 				thread(DelayFireSprintLinkProjectile, enemyId, functionArgs)
-- 			end
-- 		end
-- 	end
-- end

-- function DelayFireSprintLinkProjectile(enemyId, functionArgs)
-- 	waitUnmodified(0.05)
-- 	if enemyId and ActiveEnemies[enemyId] and not ActiveEnemies[enemyId].IsDead then
-- 		CreateProjectileFromUnit({ Name = functionArgs.ProjectileName, Id = CurrentRun.Hero.ObjectId, DestinationId = enemyId, DamageMultiplier = functionArgs.DamageMultiplier })
-- 		if CheckCooldown("HeraCastPresentation", functionArgs.VfxCooldown) then
-- 			CreateAnimationsBetween({
-- 				Animation = "HeraRope",
-- 				DestinationId = enemyId,
-- 				Id = CurrentRun.Hero.ObjectId,
-- 				Stretch = true,
-- 				UseZLocation = false,
-- 			})
-- 		end
-- 	end
-- end