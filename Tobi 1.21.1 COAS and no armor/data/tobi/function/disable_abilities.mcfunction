# ============================================
# DISABLE TOBI ABILITIES
# ============================================
# Called by toggle_abilities.mcfunction

# Remove all attributes
function tobi:armor/remove_attributes

# Clear effects
effect clear @s minecraft:night_vision
effect clear @s minecraft:saturation

# Remove enabled tag
tag @s remove tobi_abilities_enabled

# Remove effects tag
tag @s remove tobi_effects_applied

# Success message
tellraw @s {"text":"[Tobi] Abilities DISABLED!","color":"red","bold":true}
tellraw @s {"text":"→ All buffs removed, COAS abilities locked","color":"gray"}
tellraw @s {"text":"→ Run /function tobi:toggle_abilities again to re-enable","color":"green"}

# Sound effect
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 0.5