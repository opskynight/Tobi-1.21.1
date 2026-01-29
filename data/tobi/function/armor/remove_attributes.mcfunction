# ============================================
# REMOVE ATTRIBUTES WHEN TOBI ARMOR IS REMOVED
# ============================================
# This runs ONCE when the player removes the armor

# Remove all Tobi attribute modifiers
attribute @s minecraft:max_health modifier remove tobi:health
attribute @s minecraft:attack_damage modifier remove tobi:strength
attribute @s minecraft:movement_speed modifier remove tobi:speed
attribute @s minecraft:jump_strength modifier remove tobi:jump
attribute @s minecraft:fall_damage_multiplier modifier remove tobi:no_fall
attribute @s minecraft:step_height modifier remove tobi:step
attribute @s minecraft:burning_time modifier remove tobi:fire

# Remove tag
tag @s remove tobi_attributes_applied

# Feedback message
tellraw @s {"text":"[Tobi] Armor attributes removed.","color":"red"}