# CONTROL MODE (Not Sneaking) - Freeze all nearby entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:slowness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:weakness 1 255 true
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:blindness 1 255 true

# Remove AI to completely freeze entities
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] run data merge entity @s {NoAI:1b}

# TORTURE MODE (Sneaking) - SAME 10 BLOCK RANGE, deals 1/3 max HP damage
# Only damage entities that DON'T have the damage cooldown tag
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] unless entity @s[tag=genjutsu_damaged] run function tobi:genjutsu/apply_damage

# CONTROL MODE PARTICLES: Light red particles (reduced count)
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:dust{color:[1.0,0.2,0.2],scale:0.8} ~ ~1 ~ 0.3 0.5 0.3 0 2 force

# TORTURE MODE PARTICLES: Dark red particles (reduced count)
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.0} ~ ~1 ~ 0.4 0.6 0.4 0 3 force

# Player visual feedback particles (minimal)
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run particle minecraft:dust{color:[1.0,0.3,0.3],scale:1.2} ~ ~2 ~ 0.3 0.1 0.3 0 5 force
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s run particle minecraft:dust{color:[0.9,0.0,0.0],scale:1.5} ~ ~2 ~ 0.3 0.1 0.3 0 5 force

# Action bar display
execute as @a[scores={tobi_slot=5,tobi_has_armor=1}] unless predicate tobi:is_sneaking run title @s actionbar {"text":"◉ GENJUTSU: PARALYSIS ◉","color":"light_purple","bold":true}
execute as @a[scores={tobi_slot=5,tobi_has_armor=1},predicate=tobi:is_sneaking] run title @s actionbar {"text":"◉◉◉ MANGEKYOU SHARINGAN: TORTURE ◉◉◉","color":"dark_red","bold":true}
