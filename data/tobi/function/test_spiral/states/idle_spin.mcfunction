# Keep marker at eye center
execute at @s anchored eyes run tp @e[type=marker,tag=kamui_spinner,limit=1] ^ ^ ^0.5

# Rotate
scoreboard players add @s spiral_rotation 12
execute if score @s spiral_rotation matches 360.. run scoreboard players set @s spiral_rotation 0

# Render
function tobi:test_spiral/render_spiral