# ============================================
# OFFENSIVE STYLE STATUS DISPLAY
# ============================================
# Shows current mode and status (only when not charging/cooling down)

# No armor warning (overrides everything)
execute as @a[scores={tobi_offensive=1,tobi_has_armor=0}] run title @s actionbar {"text":"⚠ NEED TOBI ARMOR ⚠","color":"red","bold":true}

# Mode displays (only shown when not charging/cooldown/no armor)
# Short Range - Idle
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1}] unless predicate tobi:is_sneaking run title @s actionbar {"text":"◈ OFFENSIVE: SHORT RANGE ◈","color":"red","bold":true}

# Short Range - Active
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1},predicate=tobi:is_sneaking] run title @s actionbar {"text":"◈◈◈ FREEZING NEARBY ENTITIES ◈◈◈","color":"dark_red","bold":true}

# Long Range - handled by cooldown.mcfunction

# Return - handled by cooldown.mcfunction
