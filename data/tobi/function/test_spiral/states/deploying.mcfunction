# 1. Keep marker at eye center
execute at @s anchored eyes run tp @e[type=marker,tag=kamui_spinner,limit=1] ^ ^ ^0.5

# 2. Add rotation (Keeping your original speed)
scoreboard players add @s spiral_rotation 12
execute if score @s spiral_rotation matches 360.. run scoreboard players set @s spiral_rotation 0

# 3. Increase Scale
scoreboard players add @s spiral_scale 5

# 4. Render
function tobi:test_spiral/render_spiral

# 5. Switch to Idle
execute if score @s spiral_scale matches 100.. run scoreboard players set @s spiral_state 3