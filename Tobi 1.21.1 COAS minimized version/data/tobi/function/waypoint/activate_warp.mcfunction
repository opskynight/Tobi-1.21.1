# ============================================
# KAMUI WAYPOINT - ACTIVATE WARP (FIXED)
# ============================================
# Store current position in NBT and teleport to kamui:void

# ============================================
# CRITICAL FIX: Get dimension directly from entity NBT
# ============================================
# This is THE CORRECT WAY - don't use "execute in dimension" checks!
data modify storage tobi:temp dimension set from entity @s Dimension

# ============================================
# Store coordinates - Method 1 (Direct)
# ============================================
data modify storage tobi:temp x set from entity @s Pos[0]
data modify storage tobi:temp y set from entity @s Pos[1]
data modify storage tobi:temp z set from entity @s Pos[2]

# ============================================
# Alternative Method 2 (if Method 1 fails)
# ============================================
# Uncomment these if the direct method doesn't work:
# data modify storage tobi:temp pos set from entity @s Pos
# data modify storage tobi:temp x set from storage tobi:temp pos[0]
# data modify storage tobi:temp y set from storage tobi:temp pos[1]
# data modify storage tobi:temp z set from storage tobi:temp pos[2]

# ============================================
# DEBUG OUTPUT (keep for now)
# ============================================
tellraw @s [{"text":"[DEBUG 1] Raw Dimension NBT: ","color":"gold"},{"nbt":"Dimension","entity":"@s"}]
tellraw @s [{"text":"[DEBUG 2] Stored dimension: ","color":"gold"},{"nbt":"temp.dimension","storage":"tobi:"}]
tellraw @s [{"text":"[DEBUG 3] Raw Pos: ","color":"gold"},{"nbt":"Pos","entity":"@s"}]
tellraw @s [{"text":"[DEBUG 4] Stored coords: X=","color":"gold"},{"nbt":"temp.x","storage":"tobi:"},{"text":" Y="},{"nbt":"temp.y","storage":"tobi:"},{"text":" Z="},{"nbt":"temp.z","storage":"tobi:"}]

# ============================================
# Store in waypoint locations array
# ============================================
# Get player's UUID
data modify storage tobi:temp uuid set from entity @s UUID

# Initialize storage if it doesn't exist
execute unless data storage tobi:waypoint locations run data modify storage tobi:waypoint locations set value []

# Remove old entry for this player (if exists)
# Note: In 1.21.1, you might need to clear all and re-add, or use a more complex removal system
data remove storage tobi:waypoint locations[{uuid:[I;0,0,0,0]}]

# Create new entry
data modify storage tobi:waypoint locations append value {}
data modify storage tobi:waypoint locations[-1].uuid set from storage tobi:temp uuid
data modify storage tobi:waypoint locations[-1].dimension set from storage tobi:temp dimension
data modify storage tobi:waypoint locations[-1].x set from storage tobi:temp x
data modify storage tobi:waypoint locations[-1].y set from storage tobi:temp y
data modify storage tobi:waypoint locations[-1].z set from storage tobi:temp z

# Final debug - show what's in permanent storage
tellraw @s [{"text":"[DEBUG 5] Final waypoint data: ","color":"green"},{"nbt":"waypoint.locations[-1]","storage":"tobi:"}]

# ============================================
# Teleport to kamui:void at 0 45 0
# ============================================
execute in kamui:void run tp @s 0 45 0

# Reset charge
scoreboard players set @s tobi_charge 0

# Success message
tellraw @s {"text":"[Kamui Waypoint] Warped to pocket dimension!","color":"dark_purple","bold":true}
tellraw @s [{"text":"→ Return point saved: ","color":"light_purple"},{"nbt":"temp.dimension","storage":"tobi:"},{"text":" ("},{"nbt":"temp.x","storage":"tobi:"},{"text":", "},{"nbt":"temp.y","storage":"tobi:"},{"text":", "},{"nbt":"temp.z","storage":"tobi:"},{"text":")"}]

playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force

# Update COAS to show "Return"
function tobi:waypoint/update_coas_return with storage tobi:temp
