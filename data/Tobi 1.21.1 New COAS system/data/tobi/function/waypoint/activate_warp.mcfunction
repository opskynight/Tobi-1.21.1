# ============================================
# KAMUI WAYPOINT - ACTIVATE WARP (DIAGNOSTIC)
# ============================================
# Store current position in NBT and teleport to kamui:void

# STEP 1: Check player position directly
tellraw @s [{"text":"[DIAG 1] Your raw Pos: ","color":"gold"},{"nbt":"Pos","entity":"@s"}]

# STEP 2: Try to get X coordinate
execute store result score @s tobi_temp_x run data get entity @s Pos[0]
tellraw @s [{"text":"[DIAG 2] Pos[0] as score: ","color":"gold"},{"score":{"name":"@s","objective":"tobi_temp_x"}}]

# STEP 3: Store current dimension
execute in minecraft:overworld if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:overworld"
execute in minecraft:the_nether if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:the_nether"
execute in minecraft:the_end if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:the_end"
tellraw @s [{"text":"[DIAG 3] Dimension: ","color":"gold"},{"nbt":"temp.dimension","storage":"tobi:"}]

# STEP 4: Store coordinates using the CORRECT method
data modify storage tobi:temp x set from entity @s Pos[0]
data modify storage tobi:temp y set from entity @s Pos[1]
data modify storage tobi:temp z set from entity @s Pos[2]

# STEP 5: Verify storage
tellraw @s [{"text":"[DIAG 4] Stored in temp: ","color":"gold"},{"text":"X=","color":"white"},{"nbt":"temp.x","storage":"tobi:"},{"text":" Y=","color":"white"},{"nbt":"temp.y","storage":"tobi:"},{"text":" Z=","color":"white"},{"nbt":"temp.z","storage":"tobi:"}]

# Get player's UUID
data modify storage tobi:temp uuid set from entity @s UUID

# Initialize storage if it doesn't exist
execute unless data storage tobi:waypoint locations run data modify storage tobi:waypoint locations set value []

# Remove old entry (simplified - just clear it)
data remove storage tobi:waypoint locations[0]

# Create entry directly from tobi:temp data
data modify storage tobi:waypoint locations append value {}
data modify storage tobi:waypoint locations[-1].uuid set from storage tobi:temp uuid
data modify storage tobi:waypoint locations[-1].dimension set from storage tobi:temp dimension
data modify storage tobi:waypoint locations[-1].x set from storage tobi:temp x
data modify storage tobi:waypoint locations[-1].y set from storage tobi:temp y
data modify storage tobi:waypoint locations[-1].z set from storage tobi:temp z

# STEP 6: Verify final storage
tellraw @s [{"text":"[DIAG 5] Final stored data: ","color":"green"},{"nbt":"waypoint.locations[-1]","storage":"tobi:"}]

# Teleport to kamui:void at 0 45 0
execute in kamui:void run tp @s 0 45 0

# Reset charge
scoreboard players set @s tobi_waypoint_charge 0

# Success message
tellraw @s {"text":"[Kamui Waypoint] Warped to pocket dimension!","color":"dark_purple","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force

# Update COAS to show "Return"
function tobi:waypoint/update_coas_return with storage tobi:temp
