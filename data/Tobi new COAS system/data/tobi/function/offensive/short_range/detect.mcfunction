# ============================================
# SHORT RANGE - DETECT (FIXED)
# ============================================
# Cleanup when switching modes or losing armor

# Restore AI when player switches away from mode 0
execute as @a unless score @s tobi_offensive_mode matches 0 at @s as @e[tag=short_range_target,distance=..10,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Clear tags when mode changes
execute as @a unless score @s tobi_offensive_mode matches 0 at @s run tag @e[tag=short_range_target,distance=..10] remove short_range_target
execute as @a unless score @s tobi_offensive_mode matches 0 at @s run effect clear @e[tag=short_range_target,distance=..10] minecraft:glowing

# Reset charge if player switches away from mode 0
execute as @a unless score @s tobi_offensive_mode matches 0 run scoreboard players set @s tobi_short_range_charge 0

# Reset cooldown if not on mode 0
execute as @a unless score @s tobi_offensive_mode matches 0 run scoreboard players set @s tobi_short_range_cooldown 0

# Restore AI when losing armor
execute as @a[scores={tobi_has_armor=0}] at @s as @e[tag=short_range_target,distance=..10,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}
execute as @a[scores={tobi_has_armor=0}] at @s run tag @e[tag=short_range_target,distance=..10] remove short_range_target
