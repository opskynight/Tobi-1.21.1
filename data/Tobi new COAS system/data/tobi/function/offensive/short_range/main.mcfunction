# ============================================
# SHORT RANGE MODE - MAIN
# ============================================
# Freeze entities within 3 blocks when sneaking

# ACTIVATE: Freeze entities when sneaking
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0,tobi_has_armor=1},predicate=tobi:is_sneaking] run function tobi:offensive/short_range/activate

# DEACTIVATE: Restore AI when not sneaking
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0}] unless predicate tobi:is_sneaking run function tobi:offensive/short_range/deactivate
