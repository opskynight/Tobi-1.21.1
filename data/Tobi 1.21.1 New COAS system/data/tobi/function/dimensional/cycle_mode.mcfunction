# ============================================
# CYCLE DIMENSIONAL MODE
# ============================================
# Changes the COAS item to the next mode
# Travel (0) → Dimension (1) → Genjutsu (2) → Travel (0)

# Mark that we've processed this swap
scoreboard players set @s tobi_offhand_swap 1

# ============================================
# TRAVEL (0) → DIMENSION (1)
# ============================================
execute if score @s tobi_dimensional_mode matches 0 run clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b}]
execute if score @s tobi_dimensional_mode matches 0 run give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Kamui Dimension","color":"dark_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"DIMENSION MODE:","color":"dark_purple","italic":false}','{"text":"→ SNEAK 5s: Warp to Kamui void","color":"light_purple","italic":false}','{"text":"→ In void: Name changes to \'Return\'","color":"light_purple","italic":false}','{"text":"→ SNEAK 5s in void: Return home","color":"light_purple","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1
execute if score @s tobi_dimensional_mode matches 0 run tellraw @s {"text":"[Dimensional] Switched to DIMENSION mode","color":"dark_purple","bold":true}
execute if score @s tobi_dimensional_mode matches 0 run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 1 1.2

# ============================================
# DIMENSION (1) → GENJUTSU (2)
# ============================================
execute if score @s tobi_dimensional_mode matches 1 run clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b}]
execute if score @s tobi_dimensional_mode matches 1 run give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Genjutsu (Control)","color":"red","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"GENJUTSU MODE:","color":"red","italic":false}','{"text":"→ Control: Freeze enemies (10 blocks)","color":"dark_red","italic":false}','{"text":"→ SNEAK: Torture (33% max HP damage)","color":"dark_red","italic":false}','{"text":"→ Below 20% HP: Instant execution","color":"dark_red","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:2}] 1
execute if score @s tobi_dimensional_mode matches 1 run tellraw @s {"text":"[Dimensional] Switched to GENJUTSU mode","color":"red","bold":true}
execute if score @s tobi_dimensional_mode matches 1 run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 1 0.8

# ============================================
# GENJUTSU (2) → TRAVEL (0)
# ============================================
execute if score @s tobi_dimensional_mode matches 2 run clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b}]
execute if score @s tobi_dimensional_mode matches 2 run give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Kamui Travel (Spectator)","color":"aqua","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"TRAVEL MODE:","color":"aqua","italic":false}','{"text":"→ SNEAK 5s: Enter spectator mode","color":"dark_aqua","italic":false}','{"text":"→ Stand still 5s: Return to survival","color":"dark_aqua","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:0}] 1
execute if score @s tobi_dimensional_mode matches 2 run tellraw @s {"text":"[Dimensional] Switched to TRAVEL mode","color":"aqua","bold":true}
execute if score @s tobi_dimensional_mode matches 2 run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 1 1.5