# ============================================
# UPDATE COAS NAME TO "RETURN TO ORIGINAL SPOT"
# ============================================
# Called when player enters kamui:void

# Clear old COAS
clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b,dimensional_mode:1}]

# Give new COAS with "Return" name
give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Return to Original Spot","color":"light_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"RETURN MODE:","color":"light_purple","italic":false}','{"text":"→ SNEAK 5s: Return to departure point","color":"aqua","italic":false}','{"text":"→ Teleports back to saved location","color":"aqua","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1

# Mark as updated
tag @s add coas_name_updated

# Feedback
tellraw @s {"text":"[Kamui] Now in void dimension. COAS updated to Return mode.","color":"light_purple"}