# Keep scale at maximum
scoreboard players set @s spiral_scale 100

# SUPER FAST rotation - 36° per tick
# Shows only every 3rd frame = much cleaner
scoreboard players add @s spiral_rotation 36
execute if score @s spiral_rotation matches 360.. run scoreboard players remove @s spiral_rotation 360