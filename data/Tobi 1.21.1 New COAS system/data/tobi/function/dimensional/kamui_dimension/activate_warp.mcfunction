# ============================================
# KAMUI DIMENSION - ACTIVATE WARP (TO VOID) - FIXED
# ============================================
# Store current position and teleport to kamui:void

# Store current dimension - FIXED METHOD
# Check which dimension player is currently in
execute if dimension minecraft:overworld run scoreboard players set @s tobi_return_dim 0
execute if dimension minecraft:the_nether run scoreboard players set @s tobi_return_dim -1
execute if dimension minecraft:the_end run scoreboard players set @s tobi_return_dim 1
execute if dimension kamui:void run scoreboard players set @s tobi_return_dim 2

# Store current coordinates (scaled by 100 for precision)
execute store result score @s tobi_return_x run data get entity @s Pos[0] 100
execute store result score @s tobi_return_y run data get entity @s Pos[1] 100
execute store result score @s tobi_return_z run data get entity @s Pos[2] 100

# Debug message to confirm what was saved
tellraw @s [{"text":"[DEBUG] Saved: Dim=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_dim"},"color":"gold"},{"text":" X=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_x"},"color":"gold"},{"text":" Y=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_y"},"color":"gold"},{"text":" Z=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_z"},"color":"gold"}]

# Teleport to kamui:void at 0 45 0
execute in kamui:void run tp @s 0 45 0

# Reset charge
scoreboard players set @s tobi_dimension_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Dimension] Warped to the void!","color":"dark_purple","bold":true}
tellraw @s {"text":"→ Your return coordinates have been saved.","color":"light_purple"}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force
