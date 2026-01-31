# ============================================
# SHORT RANGE ACTIVATE
# ============================================
# Freeze entities within 3 blocks (all directions)
# Apply NoAI and blindness

# Tag entities in range (3 block radius sphere)
execute at @s run tag @e[type=!player,type=!item,type=!experience_orb,type=!armor_stand,distance=..3,tag=!short_range_frozen] add short_range_frozen

# Apply NoAI to freeze them
execute as @e[tag=short_range_frozen,nbt={NoAI:0b}] run data merge entity @s {NoAI:1b}

# Apply blindness effect (5 seconds)
execute at @s run effect give @e[tag=short_range_frozen,distance=..3] minecraft:blindness 5 0 true

# Apply weakness effect
execute at @s run effect give @e[tag=short_range_frozen,distance=..3] minecraft:weakness 5 255 true

# Visual feedback - purple particles around frozen entities
execute as @e[tag=short_range_frozen] at @s run particle minecraft:dust{color:[0.5,0.0,0.8],scale:1.5} ~ ~1 ~ 0.3 0.5 0.3 0 3 force
execute as @e[tag=short_range_frozen] at @s run particle minecraft:portal ~ ~0.5 ~ 0.2 0.3 0.2 0.1 2 force

# Sound feedback (quiet continuous hum)
execute at @s run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 1.8
