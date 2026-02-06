# ============================================
# KAMUI DIMENSION - ACTIVATE RETURN (FIXED)
# ============================================
# Return to stored coordinates in the correct dimension

# Debug message showing what we're returning to
tellraw @s [{"text":"[DEBUG] Returning to: Dim=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_dim"},"color":"gold"},{"text":" Coords (scaled): X=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_x"},"color":"gold"},{"text":" Y=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_y"},"color":"gold"},{"text":" Z=","color":"gray"},{"score":{"name":"@s","objective":"tobi_return_z"},"color":"gold"}]

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

# If dimension ID is invalid or not set, teleport to overworld spawn as failsafe
execute unless score @s tobi_return_dim matches -1..2 run tellraw @s {"text":"[ERROR] Invalid return dimension! Teleporting to overworld spawn.","color":"red"}
execute unless score @s tobi_return_dim matches -1..2 in minecraft:overworld run tp @s ~ 100 ~

# Reset charge
scoreboard players set @s tobi_dimension_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Dimension] Returned to original location!","color":"green","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force

# IMMEDIATELY update COAS name back to "Dimension" after returning
clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b,dimensional_mode:1}]
give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Kamui Dimension","color":"dark_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"DIMENSION MODE:","color":"dark_purple","italic":false}','{"text":"→ SNEAK 5s: Warp to Kamui void","color":"light_purple","italic":false}','{"text":"→ Stores your current location","color":"light_purple","italic":false}','{"text":"→ In void: Name changes to \'Return\'","color":"light_purple","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1

# Remove void mode tag
tag @s remove in_void_mode

# Feedback
tellraw @s {"text":"[Kamui] COAS updated to Dimension mode.","color":"dark_purple"}
