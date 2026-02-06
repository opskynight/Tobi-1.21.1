# ============================================
# ENABLE TOBI ABILITIES - FIXED
# ============================================
# Called by toggle_abilities.mcfunction

# Apply all attributes (permanent)
apply_attributes

# Apply infinite effects
effect give @s minecraft:night_vision infinite 0 true
effect give @s minecraft:saturation infinite 0 true

# Set enabled tag
tag @s add tobi_abilities_enabled

# Mark as having effects applied
tag @s add tobi_effects_applied

# CRITICAL FIX: Set the armor score to 1 (no armor required)
scoreboard players set @s tobi_enabled 1

# Success message
tellraw @s {"text":"[Tobi] Abilities ENABLED!","color":"gold","bold":true}
tellraw @s {"text":"→ All buffs active, all COAS abilities unlocked","color":"yellow"}
tellraw @s {"text":"→ Run /function tobi:toggle again to disable","color":"green"}

# Sound effect
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1
