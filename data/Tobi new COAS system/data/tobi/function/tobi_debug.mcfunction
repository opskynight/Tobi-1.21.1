# ============================================
# TOBI DEBUG - Run this to see what's happening
# ============================================
# Usage: /function tobi:debug

# Check COAS detection
execute as @a run tellraw @s ["",{"text":"=== COAS DEBUG ===","color":"gold","bold":true}]
execute as @a run tellraw @s ["",{"text":"Defensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_defensive"},"color":"green"}]
execute as @a run tellraw @s ["",{"text":"Offensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive"},"color":"green"}]
execute as @a run tellraw @s ["",{"text":"Offensive Mode: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"aqua"}]
execute as @a run tellraw @s ["",{"text":"Has Armor: ","color":"white"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"yellow"}]

# Check Short Range specific
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"--- SHORT RANGE ---","color":"red"}]
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=0}] at @s run tellraw @s ["",{"text":"Tagged entities nearby: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"}]
execute as @a[scores={tobi_offensive_mode=0}] at @s store result score @s tobi_temp_x run execute if entity @e[tag=short_range_target,distance=..5]

# Check Long Range specific
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"--- LONG RANGE ---","color":"light_purple"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Ray Distance: ","color":"white"},{"score":{"name":"@s","objective":"tobi_ray_distance"},"color":"aqua"}]
execute as @a[scores={tobi_offensive_mode=1}] at @s run tellraw @s ["",{"text":"Markers nearby: ","color":"white"},{"selector":"@e[type=armor_stand,tag=kamui_marker,distance=..30]"}]
execute as @a[scores={tobi_offensive_mode=1}] at @s run tellraw @s ["",{"text":"Kamui targets nearby: ","color":"white"},{"selector":"@e[tag=kamui_target,distance=..30]"}]

# Check Return specific
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"--- RETURN MODE ---","color":"aqua"}]
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_return_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_return_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=2}] at @s run tellraw @s ["",{"text":"Kidnapped entities in void: ","color":"white"},{"selector":"@e[tag=tobi_kidnapped]"}]

execute as @a run tellraw @s ["",{"text":"==================","color":"gold"}]
