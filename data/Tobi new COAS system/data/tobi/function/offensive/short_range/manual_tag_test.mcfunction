# ============================================
# MANUAL TAG TEST - Force tag nearby mobs
# ============================================
# Run this while standing near a zombie

# Tag all nearby mobs
execute at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..5] add short_range_target

# Tell player how many were tagged
execute store result score @s tobi_temp_x run execute if entity @e[tag=short_range_target]
tellraw @s [{"text":"Tagged ","color":"green"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"},{"text":" entities!","color":"green"}]

# Apply glowing
execute as @e[tag=short_range_target] run effect give @s minecraft:glowing 10 0 true
