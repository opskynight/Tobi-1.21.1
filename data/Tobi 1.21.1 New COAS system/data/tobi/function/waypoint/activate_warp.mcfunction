# ============================================
# KAMUI WAYPOINT - ACTIVATE WARP
# ============================================
# Store current position in NBT and teleport to kamui:void

# Get player's UUID as array
data modify storage tobi:temp uuid set from entity @s UUID

# Store current dimension
execute in minecraft:overworld if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:overworld"
execute in minecraft:the_nether if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:the_nether"
execute in minecraft:the_end if entity @s[distance=0..] run data modify storage tobi:temp dimension set value "minecraft:the_end"

# Store current coordinates (exact double precision)
execute store result storage tobi:temp x double 1 run data get entity @s Pos[0]
execute store result storage tobi:temp y double 1 run data get entity @s Pos[1]
execute store result storage tobi:temp z double 1 run data get entity @s Pos[2]

# Initialize storage if it doesn't exist
execute unless data storage tobi:waypoint locations run data modify storage tobi:waypoint locations set value []

# Remove old entry for this player (if exists)
data remove storage tobi:waypoint locations[{uuid:[]}]

# Add new entry
data modify storage tobi:waypoint locations append value {uuid:[],dimension:"",x:0.0d,y:0.0d,z:0.0d}
execute store result storage tobi:waypoint locations[-1].uuid[0] int 1 run data get storage tobi:temp uuid[0]
execute store result storage tobi:waypoint locations[-1].uuid[1] int 1 run data get storage tobi:temp uuid[1]
execute store result storage tobi:waypoint locations[-1].uuid[2] int 1 run data get storage tobi:temp uuid[2]
execute store result storage tobi:waypoint locations[-1].uuid[3] int 1 run data get storage tobi:temp uuid[3]
data modify storage tobi:waypoint locations[-1].dimension set from storage tobi:temp dimension
data modify storage tobi:waypoint locations[-1].x set from storage tobi:temp x
data modify storage tobi:waypoint locations[-1].y set from storage tobi:temp y
data modify storage tobi:waypoint locations[-1].z set from storage tobi:temp z

# Teleport to kamui:void at 0 45 0
execute in kamui:void run tp @s 0 45 0

# Reset charge
scoreboard players set @s tobi_waypoint_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Waypoint] Warped to pocket dimension!","color":"dark_purple","bold":true}
tellraw @s [{"text":"→ Waypoint saved at: ","color":"light_purple"},{"nbt":"temp.dimension","storage":"tobi:"},{"text":" (","color":"gray"},{"nbt":"temp.x","storage":"tobi:"},{"text":", ","color":"gray"},{"nbt":"temp.y","storage":"tobi:"},{"text":", ","color":"gray"},{"nbt":"temp.z","storage":"tobi:"},{"text":")","color":"gray"}]
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 0.5
execute at @s run particle minecraft:portal ~ ~1 ~ 1 1 1 1 100 force

# Update COAS to show "Return" with stored location
function tobi:waypoint/update_coas_return with storage tobi:temp
