-- File is to create the Artemis Hunter Dash Boon
-- TraitData_Artemis, ProjectileData
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
		Perfect = {
			Multiplier = 3.5,
		},
	},

	OnWeaponFiredFunctions = {
		ValidWeapons = { "WeaponSprint", "WeaponBlink" },
		-- we need to do this string building or the save gets bricked as soon as you leave the room
		FunctionName = "rom.mods." .. _PLUGIN.guid .. ".not.ArtemisSprintFire",
		FunctionArgs = {
			ProjectileName = "ArtemisSupportingFireSprint",
			Cooldown = 0.3,
			Scatter = 180,
			Radius = 500,
			CostPerStrike = 2,
			DamageMultiplier = { BaseValue = 1 },
			ReportValues = {
				ReportedMultiplier = "DamageMultiplier",
				ReportedCost = "CostPerStrike",
				ReportedCooldown = "Cooldown",
			},
		},
	},

	StatLines = { "DashDamageStatDisplay1" },

	ExtractValues = {
		{
			Key = "ReportedMultiplier",
			ExtractAs = "Damage",
			Format = "MultiplyByBase",
			BaseType = "Projectile",
			BaseName = "ArtemisSupportingFireSprint",
			BaseProperty = "Damage",
		},
		{
			SkipAutoExtract = true,
			Key = "ReportedCost",
			ExtractAs = "ManaCost",
		},
		{
			ExtractAs = "Cooldown",
			Key = "ReportedCooldown",
			SkipAutoExtract = true,
			DecimalPlaces = 2,
		},
	},
}

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
	-- Initially to get rid of anything not sprint or dash, aka torches
	if weaponData.Name ~= "WeaponSprint" and weaponData.Name ~= "WeaponBlink" then
		return
	end

	if weaponData.Name == "WeaponBlink" then
		local OutgoingCritCooldown = 5
		local critvalue = 0.1
		local modifierAdded = false

		for i, v in ipairs(game.CurrentRun.Hero.OutgoingCritModifiers) do
			print("v.Name:" .. v.Name)
			if v.Name == "ArtemisSprintCrit" then
				if not modifierAdded then
					table.remove(game.CurrentRun.Hero.OutgoingCritModifiers, i)
					AddOutgoingCritModifier(game.CurrentRun.Hero, { Name = "ArtemisSprintCrit", ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons, Chance = critvalue })
					modifierAdded = true
					break
				end
			end
		end

		if not modifierAdded then
			AddOutgoingCritModifier(game.CurrentRun.Hero, { Name = "ArtemisSprintCrit", ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons, Chance = critvalue })
			modifierAdded = true
		end

		-- Wait 5 seconds, then remove if it exists
		wait(OutgoingCritCooldown, RoomThreadName)

		for i, v in ipairs(game.CurrentRun.Hero.OutgoingCritModifiers) do
			print("v.Name 2:" .. v.Name)

			if v.Name == "ArtemisSprintCrit" then
				table.remove(game.CurrentRun.Hero.OutgoingCritModifiers, i)
			end
			modifierAdded = false
		end
	end

	-- Then we do the arrows on sprint
	if weaponData.Name == "WeaponSprint" then
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
		if not (enemyId and game.ActiveEnemies[enemyId] and not game.ActiveEnemies[enemyId].IsDead) then
			return
		end

		local victim = game.ActiveEnemies[enemyId]

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
	Description = "Your {$Keywords.Sprint} fires seeking arrows, each using {#ManaFormat}{$TooltipData.ExtractData.ManaCost}{#Prev}{!Icons.Mana}."
		.. " Gain a {#UpgradeFormat}10% {#Prev} chance to deal {$Keywords.Crit} damage on your {$Keywords.Attack} and {$Keywords.Special}.",
}, zanncdwbl_Practical_Gods.Order)

zanncdwbl_Practical_Gods.ArtemisSprintBoon_Text = sjson.to_object({
	Id = "DashDamageStatDisplay1",
	InheritFrom = "BaseStatLine",
	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Arrow Damage:",
	Description = "{#UpgradeFormat}{$TooltipData.StatDisplay1}  {#ItalicFormat}(every {$TooltipData.ExtractData.Cooldown} Sec.)",
}, zanncdwbl_Practical_Gods.Order)

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
