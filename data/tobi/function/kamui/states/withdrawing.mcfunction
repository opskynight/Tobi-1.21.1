# Withdrawing animation logic (0.8 -> 0.0)

scoreboard players add @s kamui.timer 1

# Go backwards every 2 ticks
execute if score @s kamui.timer matches 2.. run scoreboard players remove @s kamui.frame 1
execute if score @s kamui.timer matches 2.. run scoreboard players set @s kamui.timer 0

# Return to idle when done
execute if score @s kamui.frame matches ..-1 run scoreboard players set @s kamui.frame 0
execute if score @s kamui.frame matches ..0 run scoreboard players set @s kamui.state 0