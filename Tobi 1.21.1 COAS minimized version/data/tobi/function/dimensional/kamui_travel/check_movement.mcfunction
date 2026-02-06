# ============================================
# KAMUI TRAVEL - CHECK MOVEMENT
# ============================================
# Detects if player has moved and resets/increments stillness counter

# Get current position (scaled by 100 for precision)
execute store result score @s tobi_temp_x run data get entity @s Pos[0] 100
execute store result score @s tobi_temp_y run data get entity @s Pos[1] 100
execute store result score @s tobi_temp_z run data get entity @s Pos[2] 100

# Check if position has changed
execute unless score @s tobi_temp_x = @s tobi_kamui_pos_x run tag @s add moved
execute unless score @s tobi_temp_y = @s tobi_kamui_pos_y run tag @s add moved
execute unless score @s tobi_temp_z = @s tobi_kamui_pos_z run tag @s add moved

# If moved, reset stillness counter and update stored position
execute if entity @s[tag=moved] run scoreboard players set @s tobi_kamui_stillness 0
execute if entity @s[tag=moved] run scoreboard players operation @s tobi_kamui_pos_x = @s tobi_temp_x
execute if entity @s[tag=moved] run scoreboard players operation @s tobi_kamui_pos_y = @s tobi_temp_y
execute if entity @s[tag=moved] run scoreboard players operation @s tobi_kamui_pos_z = @s tobi_temp_z
tag @s remove moved

# If not moved, increment stillness counter
execute unless entity @s[tag=moved] run scoreboard players add @s tobi_kamui_stillness 1

# Return to survival after 100 ticks (5 seconds) of stillness
execute if score @s tobi_kamui_stillness matches 100.. run function tobi:dimensional/kamui_travel/deactivate