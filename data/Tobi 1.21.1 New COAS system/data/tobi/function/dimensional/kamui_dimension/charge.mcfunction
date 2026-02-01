# ============================================
# KAMUI DIMENSION - CHARGE
# ============================================
# Charge for 5 seconds (100 ticks) to warp to/from void

# Increase charge if Mode 1 + Sneaking + Survival + Has Armor
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_dimension_charge 1

# Reset charge if they stop sneaking OR change modes OR no armor
execute as @a[scores={tobi_dimension_charge=1..}] unless score @s tobi_dimensional_mode matches 1 run scoreboard players set @s tobi_dimension_charge 0
execute as @a[scores={tobi_dimension_charge=1..}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_dimension_charge 0
execute as @a[scores={tobi_dimension_charge=1..}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_dimension_charge 0

# Action bar feedback while charging (different based on location)
# If in void → charging return
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=1..99},tag=in_kamui_void,predicate=tobi:is_sneaking] run title @s actionbar {"text":"⬤ CHARGING RETURN ⬤","color":"light_purple","bold":true}

# If not in void → charging warp
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1,tobi_dimension_charge=1..99},predicate=tobi:is_sneaking] unless entity @s[tag=in_kamui_void] run title @s actionbar {"text":"⬤ CHARGING KAMUI WARP ⬤","color":"dark_purple","bold":true}

# On 100th tick (5 seconds), activate appropriate function
# If in void → return
execute as @a[scores={tobi_dimension_charge=100..},tag=in_kamui_void] run function tobi:dimensional/kamui_dimension/activate_return

# If not in void → warp to void
execute as @a[scores={tobi_dimension_charge=100..}] unless entity @s[tag=in_kamui_void] run function tobi:dimensional/kamui_dimension/activate_warp