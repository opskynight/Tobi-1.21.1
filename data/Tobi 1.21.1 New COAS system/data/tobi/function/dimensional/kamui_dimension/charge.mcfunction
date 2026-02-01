# ============================================
# KAMUI DIMENSION - CHARGE (DEBUG VERSION)
# ============================================
# Charge for 5 seconds (100 ticks) to warp to/from void

# DEBUG: Show charge value
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1}] run title @s actionbar [{"text":"Charge: ","color":"white"},{"score":{"name":"@s","objective":"tobi_dimension_charge"},"color":"gold"},{"text":"/100 | Armor: ","color":"white"},{"score":{"name":"@s","objective":"tobi_has_armor"},"color":"gold"},{"text":" | Void: ","color":"white"},{"selector":"@s[tag=in_void_mode]","color":"aqua"}]

# Increase charge if Mode 1 + Sneaking + Survival + Has Armor
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_dimension_charge 1

# DEBUG: Announce when charge increases
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=1}] run tellraw @s {"text":"[DEBUG] Started charging!","color":"green"}
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=50}] run tellraw @s {"text":"[DEBUG] 50% charged!","color":"yellow"}

# Reset charge if they stop sneaking OR change modes OR no armor
execute as @a[scores={tobi_dimension_charge=1..}] unless score @s tobi_dimensional_mode matches 1 run scoreboard players set @s tobi_dimension_charge 0
execute as @a[scores={tobi_dimension_charge=1..}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_dimension_charge 0
execute as @a[scores={tobi_dimension_charge=1..}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_dimension_charge 0

# Action bar feedback while charging (different based on location)
# If in void mode → charging return
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=1..99},tag=in_void_mode,predicate=tobi:is_sneaking] run title @s actionbar {"text":"⬤ CHARGING RETURN ⬤","color":"light_purple","bold":true}

# If not in void mode → charging warp
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=1..99},predicate=tobi:is_sneaking] unless entity @s[tag=in_void_mode] run title @s actionbar {"text":"⬤ CHARGING KAMUI WARP ⬤","color":"dark_purple","bold":true}

# DEBUG: Announce when reaching 100
execute as @a[scores={tobi_dimension_charge=100}] run tellraw @s {"text":"[DEBUG] 100 ticks reached! Attempting teleport...","color":"red","bold":true}

# On 100th tick (5 seconds), activate appropriate function
# If in void mode → return
execute as @a[scores={tobi_dimension_charge=100..},tag=in_void_mode] run tellraw @s {"text":"[DEBUG] Calling activate_return","color":"gold"}
execute as @a[scores={tobi_dimension_charge=100..},tag=in_void_mode] run function tobi:dimensional/kamui_dimension/activate_return

# If not in void mode → warp to void
execute as @a[scores={tobi_dimension_charge=100..}] unless entity @s[tag=in_void_mode] run tellraw @s {"text":"[DEBUG] Calling activate_warp","color":"gold"}
execute as @a[scores={tobi_dimension_charge=100..}] unless entity @s[tag=in_void_mode] run function tobi:dimensional/kamui_dimension/activate_warp
