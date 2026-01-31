# ============================================
# SHORT RANGE DEBUG - Run this to see what's wrong
# ============================================
# Usage: /function tobi:offensive/short_range/debug

tellraw @s ["",{"text":"=== SHORT RANGE DEBUG ===","color":"gold","bold":true}]

# Check item
execute if items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s ["",{"text":"✓ Holding COAS in mainhand","color":"green"}]
execute unless items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s ["",{"text":"✗ NOT holding COAS in mainhand","color":"red"}]

execute if items entity @s weapon.offhand carrot_on_a_stick run tellraw @s ["",{"text":"✓ Holding COAS in offhand","color":"green"}]

# Check NBT data
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s ["",{"text":"✓ COAS has tobi_offensive tag","color":"green"}]
execute unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] if items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s ["",{"text":"✗ COAS missing tobi_offensive tag","color":"red"}]

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{offensive_mode:0}] run tellraw @s ["",{"text":"✓ COAS has offensive_mode:0","color":"green"}]
execute unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{offensive_mode:0}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s ["",{"text":"✗ COAS missing offensive_mode:0","color":"red"}]

# Check scores
tellraw @s ["",{"text":"Scores:","color":"yellow"}]
tellraw @s ["",{"text":"  tobi_offensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive"},"color":"aqua"}]
tellraw @s ["",{"text":"  tobi_offensive_mode: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"aqua"}]
tellraw @s ["",{"text":"  tobi_has_armor: ","color":"white"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"aqua"}]
tellraw @s ["",{"text":"  tobi_short_range_cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_cooldown"},"color":"aqua"}]
tellraw @s ["",{"text":"  tobi_short_range_charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_charge"},"color":"aqua"}]

# Check nearby entities
execute store result score @s tobi_temp_x run execute if entity @e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..3]
tellraw @s ["",{"text":"  Mobs within 3 blocks: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"}]

execute store result score @s tobi_temp_x run execute if entity @e[tag=short_range_target,distance=..5]
tellraw @s ["",{"text":"  Tagged entities nearby: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"}]

# Check sneaking
execute if predicate tobi:is_sneaking run tellraw @s ["",{"text":"✓ Currently sneaking","color":"green"}]
execute unless predicate tobi:is_sneaking run tellraw @s ["",{"text":"✗ NOT sneaking","color":"red"}]

tellraw @s ["",{"text":"===================","color":"gold"}]
