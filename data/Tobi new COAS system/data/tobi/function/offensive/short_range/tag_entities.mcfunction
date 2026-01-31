# ============================================
# SHORT RANGE - TAG ENTITIES
# ============================================
# Tag all entities within 3 blocks of player (mode 0, has armor, not on cooldown)

# Tag entities in 3 block radius
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1,tobi_short_range_cooldown=0}] at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..3] add short_range_target

# Apply glowing effect to tagged entities
execute as @e[tag=short_range_target] run effect give @s minecraft:glowing 2 0

# Remove tag and glowing from entities too far away
execute as @e[tag=short_range_target] at @s unless entity @a[scores={tobi_offensive_mode=0},distance=..5] run tag @s remove short_range_target
execute as @e[tag=short_range_target] at @s unless entity @a[scores={tobi_offensive_mode=0},distance=..5] run effect clear @s minecraft:glowing

# Particle effect around tagged entities
execute as @e[tag=short_range_target] at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 5 force
