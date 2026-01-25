# Return to survival
gamemode survival @s
scoreboard players set @s tobi_kamui_active 0
scoreboard players set @s tobi_kamui_stillness 0

# Messages and effects
tellraw @s {"text":"[Kamui] Returned to reality.","color":"green","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2
execute at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force