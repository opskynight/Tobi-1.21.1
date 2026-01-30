# Tag entity to prevent repeated damage
tag @s add genjutsu_damaged

# Freeze the entity
data merge entity @s {NoAI:1b}

# Apply effects
effect give @s minecraft:blindness 1 255 true
effect give @s minecraft:slowness 1 255 true
effect give @s minecraft:weakness 1 255 true

# Get CURRENT health and store it
execute store result score @s tobi_genjutsu_dmg run data get entity @s Health 100

# Calculate 1/3 of current health to remove
scoreboard players operation @s tobi_genjutsu_dmg /= #3 tobi_genjutsu_dmg

# Get current health again
execute store result score @s tobi_temp_health run data get entity @s Health 100

# Subtract the 1/3 damage
scoreboard players operation @s tobi_temp_health -= @s tobi_genjutsu_dmg

# Set new health (making sure it doesn't go below 1 HP = 100 in our scale)
execute if score @s tobi_temp_health matches ..99 run scoreboard players set @s tobi_temp_health 100

# Apply the new health value
execute store result entity @s Health float 0.01 run scoreboard players get @s tobi_temp_health

# Start cooldown timer
scoreboard players set @s tobi_genjutsu_timer 40

# Visual feedback
particle minecraft:dust{color:[1.0,0.0,0.0],scale:2.0} ~ ~1 ~ 0.5 1.0 0.5 0 15 force
playsound minecraft:entity.player.hurt player @a ~ ~ ~ 0.5 0.5