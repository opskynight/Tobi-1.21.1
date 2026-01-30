# CONTROL MODE (Not Sneaking) - Freeze all nearby entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:slowness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:weakness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:blindness 1 255 true

# Remove AI to completely freeze entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] run data merge entity @s {NoAI:1b}

# TORTURE MODE (Sneaking) - 4x4 area directly in front
# Tag entities in torture zone first
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s anchored eyes positioned ^ ^ ^2 run tag @e[type=!player,type=!item,type=!experience_orb,dx=4,dy=4,dz=4] add genjutsu_torture

# Freeze them (remove AI)
execute as @e[tag=genjutsu_torture] run data merge entity @s {NoAI:1b}

# Apply blindness for effect
execute as @e[tag=genjutsu_torture] run effect give @s minecraft:blindness 1 255 true

# Damage calculation: Deal 1/3 of their max health
# Step 1: Store their max health (multiply by 100 for precision)
execute as @e[tag=genjutsu_torture] store result score @s tobi_genjutsu_dmg run attribute @s minecraft:max_health get 100

# Step 2: Divide by 3 (get 1/3 of max health, still scaled by 100)
execute as @e[tag=genjutsu_torture] run scoreboard players operation @s tobi_genjutsu_dmg /= #3 tobi_genjutsu_dmg

# Step 3: Apply damage using simpler method
execute as @e[tag=genjutsu_torture,scores={tobi_genjutsu_dmg=1..}] run function tobi:genjutsu/apply_damage

# Remove tag after processing
tag @e[tag=genjutsu_torture] remove genjutsu_torture

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