# ============================================
# GENJUTSU MARKER EFFECTS
# ============================================
# Apply glowing to entities within 2.5 blocks of marker (5x5 area)

# Apply glowing to entities within 2.5 blocks of marker
execute as @e[type=armor_stand,tag=genjutsu_marker] at @s run effect give @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] minecraft:glowing 2 0 true

# Tag entities for genjutsu
execute as @e[type=armor_stand,tag=genjutsu_marker] at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] add genjutsu_target

# Remove tag and glowing from entities no longer in range of marker
execute as @e[tag=genjutsu_target] at @s unless entity @e[type=armor_stand,tag=genjutsu_marker,distance=..5] run tag @s remove genjutsu_target
execute as @e[tag=genjutsu_target] at @s unless entity @e[type=armor_stand,tag=genjutsu_marker,distance=..5] run effect clear @s minecraft:glowing

# Particle effect at marker location (red eye effect)
execute as @e[type=armor_stand,tag=genjutsu_marker] at @s run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.5} ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force

# Glowing outline particle (5x5 area indicator)
execute as @e[type=armor_stand,tag=genjutsu_marker] at @s run particle minecraft:witch ~ ~0.5 ~ 2.5 2.5 2.5 0 5 force
