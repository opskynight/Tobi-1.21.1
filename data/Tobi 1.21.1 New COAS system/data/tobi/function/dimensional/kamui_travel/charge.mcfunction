# ============================================
# KAMUI TRAVEL - CHARGE
# ============================================
# Charge for 5 seconds (100 ticks) to activate spectator mode

# 1. Increase charge if Mode 0 + Sneaking + Survival + Has Armor
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_kamui_charge 1

# 2. Reset charge if they stop sneaking OR change modes OR no armor
execute as @a[scores={tobi_kamui_charge=1..}] unless score @s tobi_dimensional_mode matches 0 run scoreboard players set @s tobi_kamui_charge 0
execute as @a[scores={tobi_kamui_charge=1..}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_kamui_charge 0
execute as @a[scores={tobi_kamui_charge=1..}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_kamui_charge 0

# 3. Action bar feedback while charging
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0,tobi_kamui_charge=1..99},predicate=tobi:is_sneaking] run title @s actionbar {"text":"⬤ CHARGING SPECTATOR MODE ⬤","color":"aqua","bold":true}

# 4. On 100th tick (5 seconds), activate spectator mode
execute as @a[scores={tobi_kamui_charge=100..}] run function tobi:dimensional/kamui_travel/activate