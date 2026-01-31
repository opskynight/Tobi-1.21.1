# ============================================
# FORCE RESET LONG RANGE MODE
# ============================================
# Usage: /function tobi:force_reset_long_range
# Unstucks all long range scoreboards and entities

# Reset all long range scores
scoreboard players set @s tobi_ray_distance 0
scoreboard players set @s tobi_ray_hit 0
scoreboard players set @s tobi_kamui_kidnap_charge 0
scoreboard players set @s tobi_kamui_kidnap_cooldown 0

# Kill ALL kamui markers near player
execute at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..50]

# Clean up ALL kamui_target tags
execute at @s run tag @e[tag=kamui_target,distance=..50] remove kamui_target

# Clear glowing from all entities
execute at @s run effect clear @e[distance=..50] minecraft:glowing

# Restore AI to any frozen entities
execute at @s as @e[type=!player,distance=..50,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Success message
tellraw @s {"text":"[Long Range] All scores reset, markers killed, AI restored!","color":"green","bold":true}
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.5

# Show current status
tellraw @s [{"text":"Ray Distance: ","color":"gray"},{"score":{"name":"@s","objective":"tobi_ray_distance"},"color":"green"}]
tellraw @s [{"text":"Charge: ","color":"gray"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_charge"},"color":"green"}]
tellraw @s [{"text":"Cooldown: ","color":"gray"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_cooldown"},"color":"green"}]
