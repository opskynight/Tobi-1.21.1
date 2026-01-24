# CONTROL MODE (Not Sneaking) - Freeze all nearby entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:slowness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:weakness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:blindness 1 255 true

# Remove AI to completely freeze entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] run data merge entity @s {NoAI:1b}

# TORTURE MODE (Sneaking) - 4x4 area directly in front
# Position 2 blocks forward, then check 4x4 area (dx dy dz)
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s anchored eyes positioned ^ ^ ^2 run effect give @e[type=!player,type=!item,type=!experience_orb,dx=4,dy=4,dz=4] minecraft:wither 1 4 true

# Particles for affected entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s anchored eyes positioned ^ ^ ^2 as @e[type=!player,type=!item,type=!experience_orb,dx=4,dy=4,dz=4] at @s run particle minecraft:dust{color:[1.0,0.0,0.0],scale:2.0} ~ ~1 ~ 0.6 1.0 0.6 0.1 20 force
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s anchored eyes positioned ^ ^ ^2 as @e[type=!player,type=!item,type=!experience_orb,dx=4,dy=4,dz=4] at @s run particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.02 5 force

# CONTROL MODE PARTICLES: Purple smoke around frozen entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:smoke ~ ~0.5 ~ 0.3 0.5 0.3 0.01 3 force
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:dust{color:[0.5,0.0,0.5],scale:1.0} ~ ~1.5 ~ 0.2 0.2 0.2 0 2 force

# Player visual feedback particles
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run particle minecraft:portal ~ ~2 ~ 0.5 0.2 0.5 0.1 10 force
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s anchored eyes run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.5} ^ ^0.2 ^1 0.3 0.3 0 0.05 15 force

# Action bar display
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking run title @s actionbar {"text":"◉ GENJUTSU: PARALYSIS ◉","color":"light_purple","bold":true}
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] run title @s actionbar {"text":"◉◉◉ MANGEKYOU SHARINGAN: TORTURE ◉◉◉","color":"dark_red","bold":true}