# ============================================
# SHORT RANGE - ACTIVATE KIDNAP - FIXED
# ============================================
# Teleport all tagged entities to Kamui dimension
# ENSURES AI IS RESTORED AFTER TELEPORTATION

# Count entities for feedback
execute store result score @s tobi_temp_x if entity @e[tag=short_range_target]

# Particle and sound at each entity's location BEFORE teleporting
execute as @e[tag=short_range_target] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @e[tag=short_range_target] at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1

# Tag them as kidnapped BEFORE teleporting (this is critical!)
tag @e[tag=short_range_target] add tobi_kidnapped
execute as @e[tag=short_range_target] run data merge entity @s {PersistenceRequired:1b}

# Teleport all tagged entities to Kamui dimension at coordinates 0 45 0
execute as @e[tag=short_range_target] in kamui:void run tp @s 0 45 0

# CRITICAL FIX: RESTORE AI after teleportation
# Run this in the void dimension to ensure it affects the right entities
execute in kamui:void as @e[tag=tobi_kidnapped] run data merge entity @s {NoAI:0b}

# Clear glowing effect in the void dimension
execute in kamui:void run effect clear @e[tag=short_range_target] minecraft:glowing

# Remove temporary tags (but keep tobi_kidnapped) - do this in void dimension
execute in kamui:void run tag @e[tag=short_range_target] remove short_range_target

# Success message and effects
execute if score @s tobi_temp_x matches 1.. run tellraw @s [{"text":"[Kamui] ","color":"dark_red","bold":true},{"text":"Absorbed ","color":"red"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"},{"text":" entities into the void!","color":"red"}]
execute unless score @s tobi_temp_x matches 1.. run tellraw @s {"text":"[Kamui] No entities in range!","color":"yellow"}

playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:explosion ~ ~1 ~ 1 1 1 0 10 force

# Start cooldown
scoreboard players set @s tobi_short_range_cooldown 1

# Reset charge
scoreboard players set @s tobi_short_range_charge 0
