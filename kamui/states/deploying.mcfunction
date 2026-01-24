# Deploying animation logic (0.0 -> 0.8)

scoreboard players add @s kamui.timer 1

# Advance frame every 2 ticks (adjust for speed)
execute if score @s kamui.timer matches 2.. run scoreboard players add @s kamui.frame 1
execute if score @s kamui.timer matches 2.. run scoreboard players set @s kamui.timer 0

# Cap at frame 8 and switch to deployed state
execute if score @s kamui.frame matches 9.. run scoreboard players set @s kamui.frame 8
execute if score @s kamui.frame matches 8 run scoreboard players set @s kamui.state 2