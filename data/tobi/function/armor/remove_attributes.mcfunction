# ============================================
# REMOVE ATTRIBUTES WHEN TOBI ARMOR IS REMOVED
# ============================================

# Remove all Tobi attribute modifiers
attribute @s minecraft:generic.max_health modifier remove tobi:health
attribute @s minecraft:generic.attack_damage modifier remove tobi:strength
attribute @s minecraft:generic.movement_speed modifier remove tobi:speed
attribute @s minecraft:generic.jump_strength modifier remove tobi:jump

# Remove the tracking tag
tag @s remove tobi_attributes_applied

# Feedback message
tellraw @s {"text":"[Tobi] Armor attributes removed.","color":"red"}