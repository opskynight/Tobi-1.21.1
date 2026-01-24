# Apply passive buffs to players wearing full Tobi armor

# Night Vision (infinite)
effect give @a[scores={tobi_has_armor=1}] minecraft:night_vision infinite 0 true

# Saturation (infinite)
effect give @a[scores={tobi_has_armor=1}] minecraft:saturation infinite 0 true

# Health Boost IV (+10 hearts)
effect give @a[scores={tobi_has_armor=1}] minecraft:health_boost infinite 4 true

# Strength (infinite)
effect give @a[scores={tobi_has_armor=1}] minecraft:strength infinite 4 true

# Speed (infinite)
effect give @a[scores={tobi_has_armor=1}] minecraft:speed infinite 1 true

# Jump_boost (infinite)
effect give @a[scores={tobi_has_armor=1}] minecraft:jump_boost infinite 4 true

# Clear effects when armor is removed
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:night_vision
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:saturation
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:health_boost
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:strength
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:speed
execute as @a[scores={tobi_has_armor=0}] run effect clear @s minecraft:jump_boost