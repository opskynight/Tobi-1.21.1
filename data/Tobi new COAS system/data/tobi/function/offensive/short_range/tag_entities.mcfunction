# ============================================
# SHORT RANGE - TAG ENTITIES (DEBUG VERSION)
# ============================================
# Tag all entities within 3 blocks of player (mode 0, has armor, not on cooldown)

# DEBUG: Count entities before tagging
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1,tobi_short_range_cooldown=0}] at @s store result score @s tobi_temp_x run execute if entity @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..3]
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1,tobi_short_range_cooldown=0,tobi_temp_x=1..}] run tellraw @s [{"text":"[DEBUG] Found ","color":"green"},{"score":{"name":"@s","objective":"tobi_temp_x"}},{"text":" entities in 3 block radius"}]

# Tag entities in 3 block radius
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1,tobi_short_range_cooldown=0}] at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..3] add short_range_target

# Apply glowing effect to tagged entities
execute as @e[tag=short_range_target] run effect give @s minecraft:glowing 2 0

# DEBUG: Confirm tagging
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0}] at @s if entity @e[tag=short_range_target,distance=..5] run tellraw @s {"text":"[DEBUG] Entities successfully tagged with glowing","color":"green"}

# Remove tag and glowing from entities too far away
execute as @e[tag=short_range_target] at @s unless entity @a[scores={tobi_offensive_mode=0},distance=..5] run tag @s remove short_range_target
execute as @e[tag=short_range_target] at @s unless entity @a[scores={tobi_offensive_mode=0},distance=..5] run effect clear @s minecraft:glowing

# Particle effect around tagged entities
execute as @e[tag=short_range_target] at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 5 force
