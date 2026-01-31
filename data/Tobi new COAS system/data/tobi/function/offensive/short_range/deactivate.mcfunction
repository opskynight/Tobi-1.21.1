# ============================================
# SHORT RANGE DEACTIVATE
# ============================================
# Restore AI when player stops sneaking or changes mode

# Restore AI to all short_range_frozen entities
execute as @e[tag=short_range_frozen,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Clear effects
execute as @e[tag=short_range_frozen] run effect clear @s minecraft:blindness
execute as @e[tag=short_range_frozen] run effect clear @s minecraft:weakness

# Remove tag
tag @e[tag=short_range_frozen] remove short_range_frozen
