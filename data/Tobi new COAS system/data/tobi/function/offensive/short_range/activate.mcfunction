# ============================================
# SHORT RANGE - ACTIVATE KIDNAP
# ============================================
# Teleport all tagged entities to Kamui dimension

# Particle and sound at each entity's location BEFORE teleporting
execute as @e[tag=short_range_target] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @e[tag=short_range_target] at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1

# Teleport all tagged entities to Kamui dimension at coordinates 0 45 0
execute as @e[tag=short_range_target] in kamui:void run tp @s 0 45 0

# RESTORE AI after teleportation (entities can move in the void dimension)
execute as @e[tag=short_range_target] run data merge entity @s {NoAI:0b}

# Tag them as kidnapped for tracking and persistence
tag @e[tag=short_range_target] add tobi_kidnapped
execute as @e[tag=tobi_kidnapped] run data merge entity @s {PersistenceRequired:1b}

# Clear glowing effect
effect clear @e[tag=short_range_target] minecraft:glowing

# Remove temporary tags (but keep tobi_kidnapped)
tag @e[tag=short_range_target] remove short_range_target

# Success message and effects
tellraw @s {"text":"[Kamui] Entities absorbed into the void dimension!","color":"dark_red","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:explosion ~ ~1 ~ 1 1 1 0 10 force

# Start cooldown
scoreboard players set @s tobi_short_range_cooldown 1

# Reset charge
scoreboard players set @s tobi_short_range_charge 0
