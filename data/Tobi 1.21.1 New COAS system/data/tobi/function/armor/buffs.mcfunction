# ============================================
# ATTRIBUTE-BASED ARMOR BUFFS (OPTIMIZED)
# ============================================
# This system applies permanent stat boosts via attributes (lag-free)
# and only uses effects for Night Vision and Saturation

# ============================================
# APPLY ATTRIBUTES (ONCE when armor equipped)
# ============================================
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_attributes_applied] run function tobi:armor/apply_attributes

# ============================================
# APPLY EFFECTS (ONCE when armor equipped)
# ============================================
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_effects_applied] run effect give @s minecraft:night_vision infinite 0 true
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_effects_applied] run effect give @s minecraft:saturation infinite 0 true
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_effects_applied] run tag @s add tobi_effects_applied

# ============================================
# REAPPLY ON DEATH (Effects lost on death)
# ============================================
execute as @a[scores={tobi_has_armor=1,tobi_death=1..}] run effect give @s minecraft:night_vision infinite 0 true
execute as @a[scores={tobi_has_armor=1,tobi_death=1..}] run effect give @s minecraft:saturation infinite 0 true
execute as @a[scores={tobi_death=1..}] run scoreboard players set @s tobi_death 0
execute as @a[scores={tobi_death=1..}] run tag @s remove tobi_effects_applied

# ============================================
# REMOVE ATTRIBUTES (ONCE when armor removed)
# ============================================
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_attributes_applied] run function tobi:armor/remove_attributes

# ============================================
# REMOVE EFFECTS (ONCE when armor removed)
# ============================================
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_effects_applied] run effect clear @s minecraft:night_vision
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_effects_applied] run effect clear @s minecraft:saturation
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_effects_applied] run tag @s remove tobi_effects_applied