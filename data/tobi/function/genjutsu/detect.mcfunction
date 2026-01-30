# RESTORE AI when player stops using genjutsu or switches slots
execute as @a unless score @s tobi_slot matches 5 at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..15,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Also restore AI when player switches to sneaking mode (BUT KEEP IT OFF IN TORTURE MODE)
# Removed this line - we want AI removed in torture mode

# Clear effects when NOT holding slot 5
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:slowness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:weakness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:blindness

# Clear damage scores when not on slot 5
execute as @a unless score @s tobi_slot matches 5 at @s as @e[distance=..15,scores={tobi_genjutsu_dmg=1..}] run scoreboard players set @s tobi_genjutsu_dmg 0