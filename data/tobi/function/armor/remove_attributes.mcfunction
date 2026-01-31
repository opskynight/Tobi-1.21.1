# ============================================
# REMOVE ATTRIBUTES WHEN TOBI ARMOR IS REMOVED
# ============================================

# Reset all attributes to vanilla defaults
attribute @s minecraft:generic.max_health base set 20
attribute @s minecraft:generic.attack_damage base set 1
attribute @s minecraft:generic.movement_speed base set 0.1
attribute @s minecraft:generic.jump_strength base set 0.42
attribute @s minecraft:generic.fall_damage_multiplier base set 1
attribute @s minecraft:generic.step_height base set 0.6
attribute @s minecraft:generic.burning_time base set 1

# Remove the tracking tag
tag @s remove tobi_attributes_applied

# Feedback message
tellraw @s {"text":"[Tobi] Armor attributes removed. (Back to 20 HP)","color":"red"}
