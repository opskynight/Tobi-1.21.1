scoreboard players set @s spiral_state 1
scoreboard players set @s spiral_scale 0
scoreboard players set @s spiral_rotation 0

# Summon Marker (Zero lag) instead of Armor Stand
execute at @s anchored eyes run summon marker ^ ^ ^0.5 {Tags:["kamui_spinner"]}

playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.5 1.5