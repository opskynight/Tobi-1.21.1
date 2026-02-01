# ============================================
# KAMUI DIMENSION - ACTIVATE WARP (TO VOID)
# ============================================
# Store current position and teleport to kamui:void

# Store current dimension
execute in minecraft:overworld if entity @s[distance=0..] run scoreboard players set @s tobi_return_dim 0
execute in minecraft:the_nether if entity @s[distance=0..] run scoreboard players set @s tobi_return_dim -1
execute in minecraft:the_end if entity @s[distance=0..] run scoreboard players set @s tobi_return_dim 1

# Store current coordinates (scaled by 100 for precision)
execute store result score @s tobi_return_x run data get entity @s Pos[0] 100
execute store result score @s tobi_return_y run data get entity @s Pos[1] 100
execute store result score @s tobi_return_z run data get entity @s Pos[2] 100

# Teleport to kamui:void at 0 45 0
execute in kamui:void run tp @s 0 45 0

# Reset charge
scoreboard players set @s tobi_dimension_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Dimension] Warped to the void!","color":"dark_purple","bold":true}
tellraw @s {"text":"→ Your return coordinates have been saved.","color":"light_purple"}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force