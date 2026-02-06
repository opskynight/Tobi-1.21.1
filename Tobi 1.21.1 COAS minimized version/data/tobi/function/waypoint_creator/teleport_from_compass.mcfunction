# ============================================
# TELEPORT FROM COMPASS TOKEN
# ============================================
# Reads compass NBT and teleports player to stored location

# Read compass data from held item and store in temp
# Check mainhand first
execute if items entity @s weapon.mainhand compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp compass_data set from entity @s SelectedItem.components."minecraft:custom_data"

# Check offhand if mainhand didn't have it
execute unless data storage tobi:temp compass_data if items entity @s weapon.offhand compass[custom_data~{waypoint_token:1b}] run data modify storage tobi:temp compass_data set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data"

# Portal sound BEFORE teleport
playsound minecraft:block.portal.travel player @s ~ ~ ~ 1 1

# Particle effects BEFORE teleport
particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 1 50 force

# Teleport using macro function
function tobi:waypoint_creator/do_teleport with storage tobi:temp compass_data

# Portal sound AFTER teleport (at destination)
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1 1.2

# Particle effects AFTER teleport
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 1 50 force

# Success message
tellraw @s {"text":"[Waypoint] Teleported!","color":"light_purple","bold":true}

# Remove the compass (single-use token)
clear @s compass[custom_data~{waypoint_token:1b}] 1

# Clear temp storage
data remove storage tobi:temp compass_data
