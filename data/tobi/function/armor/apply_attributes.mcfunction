# ============================================
# APPLY ATTRIBUTES WHEN TOBI ARMOR IS EQUIPPED
# ============================================

# Health Boost IV (+20 HP / +10 hearts)
attribute @s minecraft:generic.max_health modifier add tobi:health 20 add_value

# Strength IV (+8 attack damage)
attribute @s minecraft:generic.attack_damage modifier add tobi:strength 8 add_value

# Speed I (+20% movement speed)
attribute @s minecraft:generic.movement_speed modifier add tobi:speed 0.2 add_multiplied_base

# Jump Boost IV (+100% jump strength)
attribute @s minecraft:generic.jump_strength modifier add tobi:jump 1.0 add_multiplied_base

# Mark player as having attributes applied
tag @s add tobi_attributes_applied

# Feedback message
tellraw @s {"text":"[Tobi] Armor attributes applied!","color":"gold"}