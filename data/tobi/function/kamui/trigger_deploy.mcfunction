# Start Kamui deploy animation
scoreboard players set @s kamui.state 1
scoreboard players set @s kamui.frame 0
scoreboard players set @s kamui.timer 0

# Spawn rotating armor stand
function tobi:kamui/spinner/spawn

# Debug message
tellraw @s {"text":"[DEBUG] Deploy animation triggered!","color":"green"}