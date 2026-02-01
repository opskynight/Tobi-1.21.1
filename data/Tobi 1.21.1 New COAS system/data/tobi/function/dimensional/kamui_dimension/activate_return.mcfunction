# ============================================
# KAMUI DIMENSION - ACTIVATE RETURN (FROM VOID) - FIXED
# ============================================
# Return to stored coordinates in the correct dimension

# Debug message showing what we're returning to
tellraw @s [{"text":"[DEBUG] Returning to: Dim=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_dim"},"color":"gold"},{"text"," Coords scaled by 100","color":"gray"}]

# Convert stored coordinates back to world coordinates (divide by 100)
execute store result storage tobi:temp x int 0.01 run scoreboard players get @s tobi_return_x
execute store result storage tobi:temp y int 0.01 run scoreboard players get @s tobi_return_y
execute store result storage tobi:temp z int 0.01 run scoreboard players get @s tobi_return_z

# Teleport to correct dimension based on stored value
execute if score @s tobi_return_dim matches 0 run tellraw @s {"text":"[DEBUG] Teleporting to Overworld","color":"green"}
execute if score @s tobi_return_dim matches 0 in minecraft:overworld run function tobi:dimensional/kamui_dimension/teleport_coords with storage tobi:temp

execute if score @s tobi_return_dim matches -1 run tellraw @s {"text":"[DEBUG] Teleporting to Nether","color":"red"}
execute if score @s tobi_return_dim matches -1 in minecraft:the_nether run function tobi:dimensional/kamui_dimension/teleport_coords with storage tobi:temp

execute if score @s tobi_return_dim matches 1 run tellraw @s {"text":"[DEBUG] Teleporting to End","color":"light_purple"}
execute if score @s tobi_return_dim matches 1 in minecraft:the_end run function tobi:dimensional/kamui_dimension/teleport_coords with storage tobi:temp

execute if score @s tobi_return_dim matches 2 run tellraw @s {"text":"[DEBUG] Teleporting to Kamui Void","color":"dark_purple"}
execute if score @s tobi_return_dim matches 2 in kamui:void run function tobi:dimensional/kamui_dimension/teleport_coords with storage tobi:temp

# Reset charge
scoreboard players set @s tobi_dimension_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Dimension] Returned to original location!","color":"green","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force
