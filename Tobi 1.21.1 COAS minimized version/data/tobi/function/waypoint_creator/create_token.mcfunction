# ============================================
# CREATE WAYPOINT TOKEN (COMPASS)
# ============================================
# Spawns a compass with stored location data

# Store current position and dimension
execute store result storage tobi:temp token_x run data get entity @s Pos[0] 1
execute store result storage tobi:temp token_y run data get entity @s Pos[1] 1
execute store result storage tobi:temp token_z run data get entity @s Pos[2] 1
data modify storage tobi:temp token_dim set from entity @s Dimension

# Create the compass with macro function
function tobi:waypoint_creator/give_compass_token with storage tobi:temp

# Sound and particle effects
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 1.5
particle minecraft:enchant ~ ~1 ~ 0.3 0.5 0.3 1 20 force

# Feedback message
tellraw @s {"text":"[Waypoint Creator] Token created!","color":"gold","bold":true}
tellraw @s [{"text":"Location: ","color":"yellow"},{"nbt":"token_dim","storage":"tobi:","color":"aqua"},{"text":" ("},{"nbt":"token_x","storage":"tobi:"},{"text":", "},{"nbt":"token_y","storage":"tobi:"},{"text":", "},{"nbt":"token_z","storage":"tobi:"},{"text":")"}]
