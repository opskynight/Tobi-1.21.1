# Track the slot first
execute as @a store result score @s tobi_slot run data get entity @s SelectedItemSlot

# Activate Phasing: Slot 0 + Sneaking + Has Armor + NOT in Kamui
execute as @a[scores={tobi_slot=0,tobi_has_armor=1,tobi_kamui_active=0},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players set @s tobi_phase 1

# Reset if conditions aren't met
execute as @a[scores={tobi_phase=1}] unless score @s tobi_slot matches 0 run scoreboard players set @s tobi_phase 0
execute as @a[scores={tobi_phase=1}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_phase 0
execute as @a[scores={tobi_phase=1}] unless score @s tobi_has_armor matches 1 run scoreboard players set @s tobi_phase 0

# CRITICAL: If Kamui activates, turn off phasing
execute as @a[scores={tobi_phase=1,tobi_kamui_active=1..}] run scoreboard players set @s tobi_phase 0