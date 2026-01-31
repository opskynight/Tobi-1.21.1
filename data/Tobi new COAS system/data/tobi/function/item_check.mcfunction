# ============================================
# SIMPLE ITEM CHECK
# ============================================
# Run this to see if your COAS item is detected

execute if items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s {"text":"[1/4] ✓ Holding carrot_on_a_stick","color":"green"}
execute unless items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s {"text":"[1/4] ✗ NOT holding carrot_on_a_stick","color":"red"}

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s {"text":"[2/4] ✓ Has tobi_offensive:1b tag","color":"green"}
execute unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s {"text":"[2/4] ✗ Missing tobi_offensive:1b tag","color":"red"}

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{offensive_mode:0}] run tellraw @s {"text":"[3/4] ✓ Has offensive_mode:0","color":"green"}
execute unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{offensive_mode:0}] run tellraw @s {"text":"[3/4] ✗ Missing offensive_mode:0 (or wrong mode)","color":"red"}

execute if score @s tobi_offensive matches 1 run tellraw @s {"text":"[4/4] ✓ tobi_offensive score = 1","color":"green"}
execute unless score @s tobi_offensive matches 1 run tellraw @s {"text":"[4/4] ✗ tobi_offensive score NOT 1","color":"red"}

tellraw @s ["",{"text":"Current mode: ","color":"yellow"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"aqua"}]
