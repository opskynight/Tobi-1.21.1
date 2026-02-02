# ============================================
# FIX COAS IN VOID
# ============================================
# Called when player is in void but has wrong COAS variant

tellraw @s {"text":"[DEBUG] Fixing COAS - giving Return variant","color":"gold"}

# Clear wrong variant
clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b,dimensional_mode:1}]

# Give correct Return variant
give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Return to Original Spot","color":"light_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"RETURN MODE:","color":"light_purple","italic":false}','{"text":"→ SNEAK 5s: Return to departure point","color":"aqua","italic":false}','{"text":"→ Teleports back to saved location","color":"aqua","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1

tellraw @s {"text":"[Kamui] COAS corrected to Return mode.","color":"light_purple"}
