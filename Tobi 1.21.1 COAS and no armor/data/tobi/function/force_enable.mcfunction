# ============================================
# FORCE ENABLE ABILITIES - MANUAL COMMAND
# ============================================
# Use this to manually enable abilities for testing
# Usage: /function tobi:force_enable

# Set the score directly
scoreboard players set @s tobi_has_armor 1

# Add the tag
tag @s add tobi_abilities_enabled

# Apply attributes
function tobi:armor/apply_attributes

# Apply effects
effect give @s minecraft:night_vision infinite 0 true
effect give @s minecraft:saturation infinite 0 true

# Success message
tellraw @s {"text":"[Tobi] FORCE ENABLED!","color":"gold","bold":true}
tellraw @s [{"text":"Score set to: ","color":"yellow"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"gold"}]
execute if entity @s[tag=tobi_abilities_enabled] run tellraw @s {"text":"Tag: PRESENT ✓","color":"green"}

playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 2
