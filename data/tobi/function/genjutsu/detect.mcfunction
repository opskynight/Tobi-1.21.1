# RESTORE AI when player stops using genjutsu or switches slots
execute as @a unless score @s tobi_slot matches 5 at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..15,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Clear effects when NOT holding slot 5
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..15] minecraft:slowness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..15] minecraft:weakness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..15] minecraft:blindness

# Damage cooldown system - tick down timer
execute as @e[tag=genjutsu_damaged,scores={tobi_genjutsu_timer=1..}] run scoreboard players remove @s tobi_genjutsu_timer 1

# Remove tag when cooldown expires
execute as @e[tag=genjutsu_damaged,scores={tobi_genjutsu_timer=0}] run tag @s remove genjutsu_damaged

# Clean up entities that are far from any player with slot 5
execute as @e[tag=genjutsu_damaged] at @s unless entity @a[scores={tobi_slot=5},distance=..20] run tag @s remove genjutsu_damaged
execute as @e[tag=genjutsu_damaged] at @s unless entity @a[scores={tobi_slot=5},distance=..20] run scoreboard players set @s tobi_genjutsu_timer 0
