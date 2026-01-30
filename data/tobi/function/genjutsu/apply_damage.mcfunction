# Apply calculated damage (1/3 of max health)
# Score is stored as (damage × 100) to preserve decimals

# Get current health
execute store result score @s tobi_genjutsu_temp run data get entity @s Health 100

# Subtract damage (current health - 1/3 max health)
scoreboard players operation @s tobi_genjutsu_temp -= @s tobi_genjutsu_dmg

# Make sure it doesn't go below 0
execute if score @s tobi_genjutsu_temp matches ..0 run scoreboard players set @s tobi_genjutsu_temp 1

# Apply new health value
execute store result entity @s Health float 0.01 run scoreboard players get @s tobi_genjutsu_temp

# Reset scores
scoreboard players set @s tobi_genjutsu_dmg 0
scoreboard players set @s tobi_genjutsu_temp 0