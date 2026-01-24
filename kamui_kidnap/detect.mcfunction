# Kill ALL markers if player switches away from slot 3
execute as @a unless score @s tobi_slot matches 3 at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Kill ALL markers if player loses armor
execute as @a[scores={tobi_has_armor=0}] at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Kill ALL markers if player is on cooldown
execute as @a[scores={tobi_kamui_kidnap_cooldown=1..}] at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Clear kamui_target tags when marker is removed
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..30] run tag @s remove kamui_target
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..30] run effect clear @s minecraft:glowing

# Reset charge if player switches away from slot 3
execute as @a unless score @s tobi_slot matches 3 run scoreboard players set @s tobi_kamui_kidnap_charge 0

# Reset cooldown if not on slot 3
execute as @a unless score @s tobi_slot matches 3 run scoreboard players set @s tobi_kamui_kidnap_cooldown 0