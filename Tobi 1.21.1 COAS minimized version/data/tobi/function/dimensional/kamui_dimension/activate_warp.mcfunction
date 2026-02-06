# ============================================
# KAMUI DIMENSION - ACTIVATE WARP (TO VOID)
# ============================================
# Store current position and teleport to kamui:void

# Store current dimension
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

# IMMEDIATELY update COAS name to "Return" after teleporting
clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b,dimensional_mode:1}]
give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Return to Original Spot","color":"light_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"RETURN MODE:","color":"light_purple","italic":false}','{"text":"→ SNEAK 5s: Return to departure point","color":"aqua","italic":false}','{"text":"→ Teleports back to saved location","color":"aqua","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1

# Set the void mode tag
tag @s add in_void_mode

# Feedback
tellraw @s {"text":"[Kamui] COAS updated to Return mode.","color":"light_purple"}
