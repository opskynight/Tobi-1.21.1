# ============================================
# KAMUI WAYPOINT - DISPLAY
# ============================================
# Shows current status in action bar

# No armor warning (overrides everything)
execute as @a[scores={tobi_waypoint=1,tobi_has_armor=0}] run title @s actionbar {"text":"⚠ NEED TOBI ARMOR ⚠","color":"red","bold":true}

# In void, ready to return
execute as @a[scores={tobi_waypoint=1,tobi_waypoint_charge=0,tobi_has_armor=1},predicate=tobi:in_kamui_void] run title @s actionbar {"text":"✦ WAYPOINT READY - SNEAK TO RETURN ✦","color":"aqua","bold":true}

# Not in void, ready to warp
execute as @a[scores={tobi_waypoint=1,tobi_waypoint_charge=0,tobi_has_armor=1}] unless predicate tobi:in_kamui_void run title @s actionbar {"text":"✦ WAYPOINT READY - SNEAK TO WARP ✦","color":"dark_purple","bold":true}
