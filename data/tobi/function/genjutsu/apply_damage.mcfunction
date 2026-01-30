# Apply 1/3 of max health as damage
# Tag entity to prevent repeated damage
tag @s add genjutsu_damaged

# Freeze the entity
data merge entity @s {NoAI:1b}

# Apply effects
effect give @s minecraft:blindness 1 255 true
effect give @s minecraft:slowness 1 255 true
effect give @s minecraft:weakness 1 255 true

# Store max health attribute and calculate 1/3
execute store result score @s tobi_genjutsu_dmg run attribute @s minecraft:max_health get 100

# Divide by 3 to get 1/3 of max health (still scaled by 100)
scoreboard players operation @s tobi_genjutsu_dmg /= #3 tobi_genjutsu_dmg

# Convert back to proper damage value (divide by 100)
execute store result storage tobi:genjutsu damage float 0.01 run scoreboard players get @s tobi_genjutsu_dmg

# Apply damage using macro
function tobi:genjutsu/deal_damage with storage tobi:genjutsu

# Start cooldown timer (40 ticks = 2 seconds before can be damaged again)
scoreboard players set @s tobi_genjutsu_timer 40

# Visual feedback for damaged entity
particle minecraft:dust{color:[1.0,0.0,0.0],scale:2.0} ~ ~1 ~ 0.5 1.0 0.5 0 15 force
playsound minecraft:entity.player.hurt player @a ~ ~ ~ 0.5 0.5
