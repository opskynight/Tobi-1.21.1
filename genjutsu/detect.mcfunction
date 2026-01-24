# RESTORE AI when player stops using genjutsu or switches slots
execute as @a unless score @s tobi_slot matches 5 at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..15,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Also restore AI when player switches to sneaking mode (torture doesn't freeze)
execute as @a[scores={tobi_slot=5},predicate=tobi:is_sneaking] at @s as @e[type=!player,type=!item,type=!experience_orb,distance=..15,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Clear effects when NOT holding slot 5
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:slowness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:weakness
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:wither
execute as @a unless score @s tobi_slot matches 5 at @s run effect clear @e[distance=..10] minecraft:blindness

# Clear wither when not sneaking
execute as @a[scores={tobi_slot=5}] unless predicate tobi:is_sneaking at @s run effect clear @e[distance=..10] minecraft:wither

# Clear slowness/weakness/blindness when sneaking (torture mode doesn't paralyze)
execute as @a[scores={tobi_slot=5},predicate=tobi:is_sneaking] at @s run effect clear @e[distance=..10] minecraft:slowness
execute as @a[scores={tobi_slot=5},predicate=tobi:is_sneaking] at @s run effect clear @e[distance=..10] minecraft:weakness
execute as @a[scores={tobi_slot=5},predicate=tobi:is_sneaking] at @s run effect clear @e[distance=..10] minecraft:blindness