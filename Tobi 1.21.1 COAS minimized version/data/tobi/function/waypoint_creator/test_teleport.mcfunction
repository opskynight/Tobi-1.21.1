# ============================================
# MANUAL TELEPORT TEST
# ============================================
# Forces teleport attempt - use this to debug

tellraw @s {"text":"========================================","color":"gold"}
tellraw @s {"text":"MANUAL TELEPORT TEST","color":"gold","bold":true}
tellraw @s {"text":"========================================","color":"gold"}

# Check what's in your hand
execute if items entity @s weapon.mainhand minecraft:compass run tellraw @s {"text":"✓ Holding compass in mainhand","color":"green"}
execute if items entity @s weapon.offhand minecraft:compass run tellraw @s {"text":"✓ Holding compass in offhand","color":"green"}

execute if items entity @s weapon.mainhand minecraft:compass[custom_data~{waypoint_token:1b}] run tellraw @s {"text":"✓ Mainhand compass has waypoint_token","color":"green"}
execute if items entity @s weapon.offhand minecraft:compass[custom_data~{waypoint_token:1b}] run tellraw @s {"text":"✓ Offhand compass has waypoint_token","color":"green"}

# Check scores
tellraw @s [{"text":"tobi_used_compass: ","color":"yellow"},{"score":{"name":"@s","objective":"tobi_used_compass"},"color":"gold"}]
tellraw @s [{"text":"tobi_used_coas: ","color":"yellow"},{"score":{"name":"@s","objective":"tobi_used_coas"},"color":"gold"}]

# Try to read the data
execute if items entity @s weapon.mainhand minecraft:compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp test_data set from entity @s SelectedItem.components."minecraft:custom_data"
execute if items entity @s weapon.offhand minecraft:compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp test_data set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"

execute if data storage tobi:temp test_data run tellraw @s [{"text":"✓ Read data: ","color":"green"},{"nbt":"test_data","storage":"tobi:temp"}]
execute unless data storage tobi:temp test_data run tellraw @s {"text":"✗ Could not read data","color":"red"}

tellraw @s {"text":"========================================","color":"gold"}

# Actually try the teleport
function tobi:waypoint_creator/teleport_from_compass