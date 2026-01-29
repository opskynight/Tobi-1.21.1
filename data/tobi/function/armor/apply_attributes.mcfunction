# ============================================
# APPLY ATTRIBUTES WHEN TOBI ARMOR IS EQUIPPED
# ============================================
# This runs ONCE when the player first equips full armor

# Health Boost IV (+20 HP / +10 hearts)
attribute @s minecraft:max_health modifier add tobi:health 20 add_value

# Strength IV (+8 attack damage)
attribute @s minecraft:attack_damage modifier add tobi:strength 8 add_value

# Speed I (+20% movement speed)
attribute @s minecraft:movement_speed modifier add tobi:speed 0.2 add_multiplied_base

# Jump Boost IV (+100% jump strength)
attribute @s minecraft:jump_strength modifier add tobi:jump 1.0 add_multiplied_base

# No Fall Damage (set multiplier to 0 = immune to fall damage)
attribute @s minecraft:fall_damage_multiplier modifier add tobi:no_fall -1.0 add_multiplied_total

# Auto Step (can walk up 2 block tall steps)
attribute @s minecraft:step_height modifier add tobi:step 1.5 add_value

# Fire Immunity (burning time set to 0 = instant fire extinguish)
attribute @s minecraft:burning_time modifier add tobi:fire -1.0 add_multiplied_total

# Mark player as having attributes applied
tag @s add tobi_attributes_applied

# Feedback message
tellraw @s {"text":"[Tobi] Armor attributes applied!","color":"gold"}