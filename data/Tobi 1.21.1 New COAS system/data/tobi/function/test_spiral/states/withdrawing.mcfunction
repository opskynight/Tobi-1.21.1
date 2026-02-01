# Decrease scale (spiral shrinks)
scoreboard players remove @s spiral_scale 7
execute if score @s spiral_scale matches ..0 run scoreboard players set @s spiral_scale 0

# Still fast during withdrawal (18° per tick)
scoreboard players add @s spiral_rotation 18
execute if score @s spiral_rotation matches 360.. run scoreboard players remove @s spiral_rotation 360

# Timer
scoreboard players add @s spiral_timer 1

# After 15 ticks, fully close and reset
execute if score @s spiral_timer matches 15.. run scoreboard players set @s spiral_state 0
execute if score @s spiral_timer matches 15.. run scoreboard players set @s spiral_timer 0
execute if score @s spiral_timer matches 15.. run tellraw @s {"text":"[Spiral] Closed.","color":"gray"}