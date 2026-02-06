# ============================================
# GENJUTSU - EFFECTS
# ============================================
# Control mode (freeze) and Torture mode (damage)

# CONTROL MODE (Not Sneaking) - Freeze all nearby entities
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:slowness 1 255 true
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:weakness 1 255 true
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..10] minecraft:blindness 1 255 true

# Remove AI to completely freeze entities
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] run data merge entity @s {NoAI:1b}

# TORTURE MODE (Sneaking) - Deal 33% max HP damage
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s run function tobi:dimensional/genjutsu/apply_damage_to_all

# CONTROL MODE PARTICLES: Light red particles
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:dust{color:[1.0,0.2,0.2],scale:0.8} ~ ~1 ~ 0.3 0.5 0.3 0 2 force

# TORTURE MODE PARTICLES: Dark red particles
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..10] at @s run particle minecraft:dust{color:[0.8,0.0,0.0],scale:1.0} ~ ~1 ~ 0.4 0.6 0.4 0 3 force

# Player visual feedback particles
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking at @s run particle minecraft:dust{color:[1.0,0.3,0.3],scale:1.2} ~ ~2 ~ 0.3 0.1 0.3 0 5 force
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1},predicate=tobi:is_sneaking] at @s run particle minecraft:dust{color:[0.9,0.0,0.0],scale:1.5} ~ ~2 ~ 0.3 0.1 0.3 0 5 force