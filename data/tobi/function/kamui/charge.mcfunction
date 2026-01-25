# 1. Increase charge if Slot 1 + Sneaking + Survival + Has Armor
execute as @a[scores={tobi_slot=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_kamui_charge 1

# 2. Reset charge if they stop sneaking OR change slots OR no armor
execute as @a[scores={tobi_kamui_charge=1..}] unless score @s tobi_slot matches 1 run scoreboard players set @s tobi_kamui_charge 0
execute as @a[scores={tobi_kamui_charge=1..}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_kamui_charge 0
execute as @a[scores={tobi_kamui_charge=1..}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_kamui_charge 0

# 3. Action bar feedback while charging
execute as @a[scores={tobi_slot=1,tobi_kamui_charge=1..99},predicate=tobi:is_sneaking] run title @s actionbar {"text":"⬤ CHARGING KAMUI ⬤","color":"dark_purple","bold":true}

# 4. On 100th tick (5 seconds), activate Kamui
execute as @a[scores={tobi_kamui_charge=100..}] run function tobi:kamui/activate