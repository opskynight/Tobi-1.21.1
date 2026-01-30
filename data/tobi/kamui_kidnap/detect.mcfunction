# Apply 7-second lingering effects when player stops sneaking (but still on slot 3)
execute as @a[scores={tobi_slot=3}] unless predicate tobi:is_sneaking at @s as @e[tag=kamui_target,distance=..30] run effect give @s minecraft:blindness 7 255 true
execute as @a[scores={tobi_slot=3}] unless predicate tobi:is_sneaking at @s as @e[tag=kamui_target,distance=..30] run effect give @s minecraft:slowness 7 255 true
execute as @a[scores={tobi_slot=3}] unless predicate tobi:is_sneaking at @s run tag @e[tag=kamui_target,distance=..30] remove kamui_target

# Apply 7-second lingering effects when player switches away from slot 3
execute as @a unless score @s tobi_slot matches 3 at @s as @e[tag=kamui_target,distance=..30] run effect give @s minecraft:blindness 7 255 true
execute as @a unless score @s tobi_slot matches 3 at @s as @e[tag=kamui_target,distance=..30] run effect give @s minecraft:slowness 7 255 true

# Kill ALL markers if player switches away from slot 3
execute as @a unless score @s tobi_slot matches 3 at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Kill ALL markers if player loses armor
execute as @a[scores={tobi_has_armor=0}] at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Kill ALL markers if player is on cooldown
execute as @a[scores={tobi_kamui_kidnap_cooldown=1..}] at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..30]

# Clear kamui_target tags when marker is removed or conditions not met
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..30] run tag @s remove kamui_target
execute as @e[tag=kamui_target] at @s unless entity @e[type=armor_stand,tag=kamui_marker,distance=..30] run effect clear @s minecraft:glowing

execute as @a unless score @s tobi_slot matches 3 at @s run tag @e[tag=kamui_target,distance=..30] remove kamui_target
execute as @a unless score @s tobi_slot matches 3 at @s run effect clear @e[distance=..30] minecraft:glowing

# Reset charge if player switches away from slot 3
execute as @a unless score @s tobi_slot matches 3 run scoreboard players set @s tobi_kamui_kidnap_charge 0

# Reset cooldown if not on slot 3
execute as @a unless score @s tobi_slot matches 3 run scoreboard players set @s tobi_kamui_kidnap_cooldown 0
