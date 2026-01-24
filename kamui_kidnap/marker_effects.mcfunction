# Apply glowing to entities within 2.5 blocks of marker
execute as @e[type=armor_stand,tag=kamui_marker] at @s run effect give @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] minecraft:glowing 1 0 true

# Tag entities for kidnapping
execute as @e[type=armor_stand,tag=kamui_marker] at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] add kamui_target

# Remove tag and glowing from entities no longer in range
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..2.5] run tag @s remove kamui_target
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..2.5] run effect clear @s minecraft:glowing

# Particle effect at marker location (purple portal)
execute as @e[type=armor_stand,tag=kamui_marker] at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force

# Glowing outline particle
execute as @e[type=armor_stand,tag=kamui_marker] at @s run particle minecraft:witch ~ ~0.5 ~ 1.5 1.5 1.5 0 5 force