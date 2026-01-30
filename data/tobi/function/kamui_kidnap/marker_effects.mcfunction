# Apply glowing to entities within 2.5 blocks of marker
execute as @e[type=armor_stand,tag=kamui_marker] at @s run effect give @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] minecraft:glowing 1 0 true

# Tag entities for kidnapping
execute as @e[type=armor_stand,tag=kamui_marker] at @s run tag @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..2.5] add kamui_target

# Apply blindness and slowness while player is SNEAKING on slot 3 (continuously refreshed)
execute as @e[tag=kamui_target] at @s if entity @a[scores={tobi_slot=3,tobi_has_armor=1},predicate=tobi:is_sneaking,distance=..25] run effect give @s minecraft:blindness 1 255 true
execute as @e[tag=kamui_target] at @s if entity @a[scores={tobi_slot=3,tobi_has_armor=1},predicate=tobi:is_sneaking,distance=..25] run effect give @s minecraft:slowness 1 255 true

# Remove tag and glowing from entities no longer in range
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..2.5] run tag @s remove kamui_target
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..2.5] run effect clear @s minecraft:glowing

# Particle effect at marker location (purple portal)
execute as @e[type=armor_stand,tag=kamui_marker] at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force

# Glowing outline particle
execute as @e[type=armor_stand,tag=kamui_marker] at @s run particle minecraft:witch ~ ~0.5 ~ 1.5 1.5 1.5 0 5 force
