# ============================================
# LONG RANGE DEBUG
# ============================================
# Usage: /function tobi:debug_long_range

execute as @a run tellraw @s ["",{"text":"=== LONG RANGE DEBUG ===","color":"light_purple","bold":true}]

# COAS Detection
execute as @a run tellraw @s ["",{"text":"--- COAS STATUS ---","color":"gold"}]
execute as @a run tellraw @s [{"text":"Offensive: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive"},"color":"green"}]
execute as @a run tellraw @s [{"text":"Offensive Mode: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"aqua"}]
execute as @a run tellraw @s [{"text":"Has Armor: ","color":"white"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"yellow"}]

# Long Range Scores
execute as @a run tellraw @s ["",{"text":"--- LONG RANGE SCORES ---","color":"light_purple"}]
execute as @a run tellraw @s [{"text":"Ray Distance: ","color":"white"},{"score":{"name":"@s","objective":"tobi_ray_distance"},"color":"aqua"}]
execute as @a run tellraw @s [{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_charge"},"color":"green"}]
execute as @a run tellraw @s [{"text":"Cooldown: ","color":"white"},{"score":{"name":"@s","objective":"tobi_kamui_kidnap_cooldown"},"color":"red"}]

# Marker Check
execute as @a run tellraw @s ["",{"text":"--- MARKERS & ENTITIES ---","color":"light_purple"}]
execute as @a at @s store result score @s tobi_temp_x run execute if entity @e[type=armor_stand,tag=kamui_marker,distance=..30]
execute as @a run tellraw @s [{"text":"Markers nearby: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_x"},"color":"gold"}]
execute as @a at @s if entity @e[type=armor_stand,tag=kamui_marker,distance=..30] run tellraw @s [{"text":"  → Location: ","color":"gray"},{"selector":"@e[type=armor_stand,tag=kamui_marker,distance=..30,limit=1]"}]

execute as @a at @s store result score @s tobi_temp_y run execute if entity @e[tag=kamui_target,distance=..30]
execute as @a run tellraw @s [{"text":"Tagged entities: ","color":"white"},{"score":{"name":"@s","objective":"tobi_temp_y"},"color":"gold"}]

# Sneaking Check
execute as @a[predicate=tobi:is_sneaking] run tellraw @s [{"text":"Sneaking: ","color":"white"},{"text":"YES","color":"green"}]
execute as @a unless predicate tobi:is_sneaking run tellraw @s [{"text":"Sneaking: ","color":"white"},{"text":"NO","color":"red"}]

# Item Check
execute as @a run tellraw @s ["",{"text":"--- ITEM CHECK ---","color":"light_purple"}]
execute as @a if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:1}] run tellraw @s {"text":"✓ Holding Long Range COAS in MAINHAND","color":"green"}
execute as @a if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:1}] run tellraw @s {"text":"✓ Holding Long Range COAS in OFFHAND","color":"green"}
execute as @a unless items entity @s weapon carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:1}] run tellraw @s {"text":"✗ NOT holding Long Range COAS","color":"red"}

execute as @a run tellraw @s ["",{"text":"===========================","color":"light_purple"}]
