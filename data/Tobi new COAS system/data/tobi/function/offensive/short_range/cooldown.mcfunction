# ============================================
# SHORT RANGE COOLDOWN
# ============================================

# Increment cooldown timer
execute as @a[scores={tobi_short_range_cooldown=1..}] run scoreboard players add @s tobi_short_range_cooldown 1

# Display cooldown status (120 ticks = 6 seconds)
execute as @a[scores={tobi_offensive_mode=0,tobi_short_range_cooldown=1..59}] run title @s actionbar {"text":"▱▱▱▱▱ RECHARGING ▱▱▱▱▱","color":"red","bold":true}
execute as @a[scores={tobi_offensive_mode=0,tobi_short_range_cooldown=60..119}] run title @s actionbar {"text":"▱▱▱▱▱▱▱▱▱▱ ALMOST READY ▱▱▱▱▱▱▱▱▱▱","color":"yellow","bold":true}

# Reset cooldown after 120 ticks
execute as @a[scores={tobi_short_range_cooldown=120..}] run scoreboard players set @s tobi_short_range_cooldown 0

# Ready notification (only show when not actively using)
execute as @a[scores={tobi_offensive_mode=0,tobi_short_range_cooldown=0,tobi_has_armor=1}] unless predicate tobi:is_sneaking unless entity @s[scores={tobi_short_range_charge=1..}] run title @s actionbar {"text":"◈ OFFENSIVE: SHORT RANGE (3 blocks) ◈","color":"red","bold":true}
