# Particle and sound at each entity's location BEFORE teleporting
execute as @e[tag=kamui_target] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @e[tag=kamui_target] at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 1

# Teleport all tagged entities to Kamui dimension (Y=400)
execute as @e[tag=kamui_target] at @s run tp @s ~ 400 ~

# Tag them as kidnapped for tracking and persistence
tag @e[tag=kamui_target] add tobi_kidnapped
execute as @e[tag=tobi_kidnapped] run data merge entity @s {PersistenceRequired:1b}

# Clear glowing effect
effect clear @e[tag=kamui_target] minecraft:glowing

# Remove kamui_target tag
tag @e[tag=kamui_target] remove kamui_target

# Remove marker
kill @e[type=armor_stand,tag=kamui_marker]

# Success message and effects
tellraw @s {"text":"[Kamui] Entities transported to the void dimension!","color":"dark_purple","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:explosion ~ ~1 ~ 1 1 1 0 10 force

# Start cooldown
scoreboard players set @s tobi_kamui_kidnap_cooldown 1

# Reset charge
scoreboard players set @s tobi_kamui_kidnap_charge 0