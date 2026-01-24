# Detect if player is in slot 0 and sneaking AND wearing full armor
execute as @a[scores={tobi_slot=0,tobi_has_armor=1},predicate=tobi:is_sneaking] run scoreboard players set @s tobi_phase 1

# Detect if player changed slot or stopped sneaking
execute as @a[scores={tobi_phase=1}] unless score @s tobi_slot matches 0 run scoreboard players set @s tobi_phase 0
execute as @a[scores={tobi_phase=1}] unless predicate tobi:is_sneaking run scoreboard players set @s tobi_phase 0

# Disable if armor is removed
execute as @a[scores={tobi_phase=1,tobi_has_armor=0}] run scoreboard players set @s tobi_phase 0

# Track current hotbar slot for all players
execute as @a store result score @s tobi_slot run data get entity @s SelectedItemSlot