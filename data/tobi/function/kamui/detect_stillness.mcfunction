# 1. Store current position in 'temp'
execute as @a[scores={tobi_kamui_active=1},gamemode=spectator] store result score @s tobi_temp_x run data get entity @s Pos[0] 100
execute as @a[scores={tobi_kamui_active=1},gamemode=spectator] store result score @s tobi_temp_y run data get entity @s Pos[1] 100
execute as @a[scores={tobi_kamui_active=1},gamemode=spectator] store result score @s tobi_temp_z run data get entity @s Pos[2] 100

# 2. Compare temp to last tick's stored position. If they don't match, reset stillness.
execute as @a[scores={tobi_kamui_active=1}] unless score @s tobi_temp_x = @s tobi_kamui_pos_x run scoreboard players set @s tobi_kamui_stillness 0
execute as @a[scores={tobi_kamui_active=1}] unless score @s tobi_temp_y = @s tobi_kamui_pos_y run scoreboard players set @s tobi_kamui_stillness 0
execute as @a[scores={tobi_kamui_active=1}] unless score @s tobi_temp_z = @s tobi_kamui_pos_z run scoreboard players set @s tobi_kamui_stillness 0

# 3. If position MATCHES (standing still), increment stillness counter
execute as @a[scores={tobi_kamui_active=1}] if score @s tobi_temp_x = @s tobi_kamui_pos_x if score @s tobi_temp_y = @s tobi_kamui_pos_y if score @s tobi_temp_z = @s tobi_kamui_pos_z run scoreboard players add @s tobi_kamui_stillness 1

# 4. Update the 'stored' position for next tick
execute as @a[scores={tobi_kamui_active=1}] run scoreboard players operation @s tobi_kamui_pos_x = @s tobi_temp_x
execute as @a[scores={tobi_kamui_active=1}] run scoreboard players operation @s tobi_kamui_pos_y = @s tobi_temp_y
execute as @a[scores={tobi_kamui_active=1}] run scoreboard players operation @s tobi_kamui_pos_z = @s tobi_temp_z

# 5. Action bar showing stillness status (UPDATED for 60 ticks = 3 seconds)
execute as @a[scores={tobi_kamui_active=1,tobi_kamui_stillness=0}] run title @s actionbar {"text":"◉ KAMUI DIMENSION - Keep Moving ◉","color":"dark_purple","bold":true}
execute as @a[scores={tobi_kamui_active=1,tobi_kamui_stillness=1..49}] run title @s actionbar [{"text":"◉ KAMUI - Standing Still (","color":"yellow","bold":true},{"score":{"name":"@s","objective":"tobi_kamui_stillness"},"color":"gold"},{"text":"/60) ◉","color":"yellow","bold":true}]
execute as @a[scores={tobi_kamui_active=1,tobi_kamui_stillness=50..59}] run title @s actionbar {"text":"⚠ RETURNING SOON ⚠","color":"red","bold":true}

# 6. On 60th tick of stillness (3 seconds still), return
execute as @a[scores={tobi_kamui_stillness=60..}] run function tobi:kamui/return