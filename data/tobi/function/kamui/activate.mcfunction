# Start withdraw animation (portal closes)
function tobi:kamui/trigger_withdraw

# Set active timer to 1 IMMEDIATELY (skip the delay for now)
scoreboard players set @s tobi_kamui_active 1

# Switch to spectator right away
gamemode spectator @s

# Reset charge timer
scoreboard players set @s tobi_kamui_charge 0

# Reset phasing
scoreboard players set @s tobi_phase 0
scoreboard players set @s tobi_underground 0

# Message
tellraw @s {"text":"[Kamui] Activated - 15 seconds of time and space travelling.","color":"dark_purple","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5