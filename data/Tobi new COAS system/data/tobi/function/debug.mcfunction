# ============================================
# TOBI DEBUG - Run this to see what's happening
# ============================================
# Usage: /function tobi:debug

# Check COAS detection
execute as @a run tellraw @s ["",{"text":"=== TOBI DEBUG ===","color":"gold","bold":true}]
execute as @a run tellraw @s ["",{"text":"Defensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_defensive"},"color":"green"}]
execute as @a run tellraw @s ["",{"text":"Offensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive"},"color":"green"}]
execute as @a run tellraw @s ["",{"text":"Offensive Mode: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"aqua"}," ",{"text":"(0=Short, 1=Long, 2=Return)","color":"gray"}]
execute as @a run tellraw @s ["",{"text":"Has Armor: ","color":"white"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"yellow"}]

# Check Short Range specific
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"--- SHORT RANGE DEBUG ---","color":"red"}]
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_short_range_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=0}] at @s store result score @s tobi_temp_x run execute if entity @e[tag=short_range_target,distance=..5]
execute as @a[scores={tobi_offensive_mode=0}] run tellraw @s ["",{"text":"Tagged entities nearby: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"}]
execute as @a[scores={tobi_offensive_mode=0}] at @s run tellraw @s ["",{"text":"Entities in 3 blocks: ","color":"white"},{"selector":"@e[type=!player,type=!armor_stand,type=!item,type=!experience_orb,distance=..3]"}]
execute as @a[scores={tobi_offensive_mode=0}] at @s run tellraw @s ["",{"text":"Short range targets: ","color":"white"},{"selector":"@e[tag=short_range_target,distance=..5]"}]

# Check Long Range specific
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"--- LONG RANGE DEBUG ---","color":"light_purple"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=1}] run tellraw @s ["",{"text":"Ray Distance: ","color":"white"},{"score":{"name":"@s","objective":"tobi_ray_distance"},"color":"aqua"}]
execute as @a[scores={tobi_offensive_mode=1}] at @s run tellraw @s ["",{"text":"Markers nearby: ","color":"white"},{"selector":"@e[type=armor_stand,tag=kamui_marker,distance=..30]"}]
execute as @a[scores={tobi_offensive_mode=1}] at @s run tellraw @s ["",{"text":"Kamui targets: ","color":"white"},{"selector":"@e[tag=kamui_target,distance=..30]"}]

# Check Return specific
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"--- RETURN MODE DEBUG ---","color":"aqua"}]
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_return_charge"},"color":"green"}]
execute as @a[scores={tobi_offensive_mode=2}] run tellraw @s ["",{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_return_cooldown"},"color":"red"}]
execute as @a[scores={tobi_offensive_mode=2}] at @s run tellraw @s ["",{"text":"Kidnapped in void: ","color":"white"},{"selector":"@e[tag=tobi_kidnapped]"}]

# Check item in hand
execute as @a run tellraw @s ["",{"text":"--- ITEM CHECK ---","color":"yellow"}]
execute as @a if items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s {"text":"✓ Carrot on stick in mainhand","color":"green"}
execute as @a if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s {"text":"✓ Offensive COAS detected in mainhand","color":"green"}
execute as @a if items entity @s weapon.offhand carrot_on_a_stick run tellraw @s {"text":"✓ Carrot on stick in offhand","color":"green"}
execute as @a if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run tellraw @s {"text":"✓ Offensive COAS detected in offhand","color":"green"}

execute as @a run tellraw @s ["",{"text":"==================","color":"gold"}]

# Helpful tips
execute as @a run tellraw @s {"text":"TIP: If offensive=1 but mode=-1 or wrong, the NBT data might be corrupted. Try getting a fresh COAS with /function tobi:coas/give_offensive","color":"gray","italic":true}
