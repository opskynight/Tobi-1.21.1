# ============================================
# UPDATE COAS NAME TO "KAMUI DIMENSION"
# ============================================
# Called when player exits kamui:void

# Clear old COAS
clear @s carrot_on_a_stick[custom_data~{tobi_dimensional:1b,dimensional_mode:1}]

# Give new COAS with "Dimension" name
give @s carrot_on_a_stick[unbreakable={},custom_name='{"text":"Kamui Dimension","color":"dark_purple","bold":true,"italic":false}',lore=['{"text":"Tobi\'s dimensional abilities","color":"gray","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"SWAP TO OFFHAND: Change Mode","color":"gold","italic":false}','{"text":"→ Travel → Dimension → Genjutsu","color":"yellow","italic":false}','{"text":"","color":"gray","italic":false}','{"text":"DIMENSION MODE:","color":"dark_purple","italic":false}','{"text":"→ SNEAK 5s: Warp to Kamui void","color":"light_purple","italic":false}','{"text":"→ Stores your current location","color":"light_purple","italic":false}','{"text":"→ In void: Name changes to \'Return\'","color":"light_purple","italic":false}'],custom_model_data=3,custom_data={tobi_dimensional:1b,dimensional_mode:1}] 1

# Remove update tag
tag @s remove coas_name_updated

# Feedback
tellraw @s {"text":"[Kamui] Returned from void. COAS updated to Dimension mode.","color":"dark_purple"}