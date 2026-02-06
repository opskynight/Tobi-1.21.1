# ============================================
# TELEPORT FROM COMPASS TOKEN
# ============================================

# Clear any old data first
data remove storage tobi:temp compass_data

# Try mainhand
execute if items entity @s weapon.mainhand minecraft:compass[custom_data~{waypoint_token:1b}] run tellraw @s {"text":"[DEBUG] Found compass in mainhand","color":"green"}
execute if items entity @s weapon.mainhand minecraft:compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp compass_data set from entity @s SelectedItem.components."minecraft:custom_data"

# Try offhand if mainhand failed
execute unless data storage tobi:temp compass_data if items entity @s weapon.offhand minecraft:compass[custom_data~{waypoint_token:1b}] run tellraw @s {"text":"[DEBUG] Found compass in offhand","color":"green"}
execute unless data storage tobi:temp compass_data if items entity @s weapon.offhand minecraft:compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp compass_data set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"

# Show what we got
execute if data storage tobi:temp compass_data run tellraw @s [{"text":"[DEBUG] Compass data: ","color":"aqua"},{"nbt":"compass_data","storage":"tobi:temp"}]
execute unless data storage tobi:temp compass_data run tellraw @s {"text":"[ERROR] Could not read compass data!","color":"red"}
execute unless data storage tobi:temp compass_data run return 0

# Portal sound BEFORE teleport
playsound minecraft:block.portal.travel player @s ~ ~ ~ 1 1
particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 1 50 force

# Do the teleport
function tobi:waypoint_creator/do_teleport with storage tobi:temp compass_data

# Remove compass (single-use)
clear @s minecraft:compass[custom_data~{waypoint_token:1b}] 1

# Clear storage
data remove storage tobi:temp compass_data