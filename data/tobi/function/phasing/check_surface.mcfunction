# Return to survival ONLY for PHASING (not Kamui)
# Requirements:
# - In spectator mode
# - Phasing is OFF (tobi_phase=0)
# - NOT in Kamui (tobi_kamui_active=0)
# - Underground score exists (tobi_underground >= 1) - this means they were phasing before
# - Air detected above head

# Check air blocks with underground requirement
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ air if block ~ ~2 ~ air run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ air if block ~ ~2 ~ air run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 2
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ air if block ~ ~2 ~ air run gamemode survival @s
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ air if block ~ ~2 ~ air run tellraw @s {"text":"[Phasing] Returned to normal.","color":"green"}
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ air if block ~ ~2 ~ air run scoreboard players set @s tobi_underground 0

# Also check cave_air
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ cave_air if block ~ ~2 ~ cave_air run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ cave_air if block ~ ~2 ~ cave_air run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 2
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ cave_air if block ~ ~2 ~ cave_air run gamemode survival @s
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ cave_air if block ~ ~2 ~ cave_air run tellraw @s {"text":"[Phasing] Returned to normal.","color":"green"}
execute as @a[gamemode=spectator,scores={tobi_phase=0,tobi_kamui_active=0,tobi_underground=1..}] at @s if block ~ ~1 ~ cave_air if block ~ ~2 ~ cave_air run scoreboard players set @s tobi_underground 0