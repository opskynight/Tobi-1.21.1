# ============================================
# GENJUTSU DETECT/CLEANUP - FIXED v2
# ============================================
# Cleanup when switching modes or losing COAS

# ============================================
# CRITICAL FIX: Only restore AI when SWITCHING AWAY
# ============================================
# Don't touch mobs while player is still in Genjutsu mode!

# When switching away from Genjutsu mode - restore AI and clear tags
execute as @a unless score @s tobi_defensive_mode matches 1 at @s as @e[tag=genjutsu_target,distance=..25] run data merge entity @s {NoAI:0b}
execute as @a unless score @s tobi_defensive_mode matches 1 at @s run tag @e[tag=genjutsu_target,distance=..25] remove genjutsu_target
execute as @a unless score @s tobi_defensive_mode matches 1 at @s run effect clear @e[distance=..25] minecraft:glowing

# When losing armor - restore AI and clear tags
execute as @a[tag=!tobi_abilities_enabled] at @s as @e[tag=genjutsu_target,distance=..25] run data merge entity @s {NoAI:0b}
execute as @a[tag=!tobi_abilities_enabled] at @s run tag @e[tag=genjutsu_target,distance=..25] remove genjutsu_target

# Kill markers when player switches away from Genjutsu mode
execute as @a unless score @s tobi_defensive_mode matches 1 at @s run kill @e[type=armor_stand,tag=genjutsu_marker,distance=..25]

# Kill markers when player loses armor
execute as @a[tag=!tobi_abilities_enabled] at @s run kill @e[type=armor_stand,tag=genjutsu_marker,distance=..25]

# Cleanup sneak-frozen mobs when switching away
execute as @a unless score @s tobi_defensive_mode matches 1 at @s as @e[tag=genjutsu_sneak_target,distance=..15] run data merge entity @s {NoAI:0b}
execute as @a unless score @s tobi_defensive_mode matches 1 at @s run tag @e[tag=genjutsu_sneak_target,distance=..15] remove genjutsu_sneak_target
execute as @a unless score @s tobi_defensive_mode matches 1 run scoreboard players set @s tobi_genjutsu_sneak_freeze 0
execute as @a unless score @s tobi_defensive_mode matches 1 run scoreboard players set @s tobi_charge 0

# Damage cooldown system - tick down timer
execute as @e[tag=genjutsu_damaged,scores={tobi_genjutsu_timer=1..}] run scoreboard players remove @s tobi_genjutsu_timer 1

# Remove tag when cooldown expires
execute as @e[tag=genjutsu_damaged,scores={tobi_genjutsu_timer=0}] run tag @s remove genjutsu_damaged

# Clean up entities that are far from any player in genjutsu mode
execute as @e[tag=genjutsu_damaged] at @s unless entity @a[scores={tobi_defensive_mode=1},distance=..20] run tag @s remove genjutsu_damaged
execute as @e[tag=genjutsu_damaged] at @s unless entity @a[scores={tobi_defensive_mode=1},distance=..20] run scoreboard players set @s tobi_genjutsu_timer 0
