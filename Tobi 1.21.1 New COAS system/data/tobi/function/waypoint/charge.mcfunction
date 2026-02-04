# ============================================
# KAMUI WAYPOINT - CHARGE
# ============================================
# Charge for 5 seconds (100 ticks) to warp or return

# Increase charge if holding waypoint + sneaking + survival + has armor
execute as @a[scores={tobi_waypoint=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_waypoint_charge 1

# Reset charge if they stop sneaking OR no armor OR not holding waypoint
execute as @a[scores={tobi_waypoint_charge=1..}] unless score @s tobi_waypoint matches 1 run scoreboard players set @s tobi_waypoint_charge 0
execute as @a[scores={tobi_waypoint_charge=1..}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_waypoint_charge 0
execute as @a[scores={tobi_waypoint_charge=1..}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_waypoint_charge 0

# Action bar feedback while charging (different based on location)
# If in void → charging return
execute as @a[scores={tobi_waypoint=1,tobi_waypoint_charge=1..99},predicate=tobi:is_sneaking,predicate=tobi:in_kamui_void] run title @s actionbar {"text":"⬤ CHARGING RETURN ⬤","color":"aqua","bold":true}

# If NOT in void → charging warp
execute as @a[scores={tobi_waypoint=1,tobi_waypoint_charge=1..99},predicate=tobi:is_sneaking] unless predicate tobi:in_kamui_void run title @s actionbar {"text":"⬤ CHARGING WAYPOINT WARP ⬤","color":"dark_purple","bold":true}

# On 100th tick (5 seconds), activate appropriate function
# If in void → return to waypoint
execute as @a[scores={tobi_waypoint_charge=100..},predicate=tobi:in_kamui_void] run function tobi:waypoint/activate_return

# If NOT in void → warp to void and save location
execute as @a[scores={tobi_waypoint_charge=100..}] unless predicate tobi:in_kamui_void run function tobi:waypoint/activate_warp
