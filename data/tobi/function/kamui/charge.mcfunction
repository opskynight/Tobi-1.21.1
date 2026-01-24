# Detect if player is holding slot 1 and sneaking AND wearing armor
execute as @a[scores={tobi_slot=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run scoreboard players add @s tobi_kamui_charge 1

# NEW - Start deploy animation when charging begins (MOVED UP)
execute as @a[scores={tobi_slot=1,tobi_kamui_charge=1,tobi_has_armor=1},predicate=tobi:is_sneaking,gamemode=survival] run function tobi:kamui/trigger_deploy

# Reset charge if player stops sneaking or changes slot
execute as @a unless score @s tobi_slot matches 1 run scoreboard players set @s tobi_kamui_charge 0
execute as @a unless predicate tobi:is_sneaking run scoreboard players set @s tobi_kamui_charge 0

# Reset if armor is removed
execute as @a[scores={tobi_has_armor=0}] run scoreboard players set @s tobi_kamui_charge 0

# Reset charge if player is already in kamui mode
execute as @a[scores={tobi_kamui_active=1..}] run scoreboard players set @s tobi_kamui_charge 0

# Action bar feedback
execute as @a[scores={tobi_slot=1,tobi_kamui_charge=1..79},predicate=tobi:is_sneaking] run title @s actionbar {"text":"⬤ CHARGING KAMUI ⬤","color":"dark_purple","bold":true}

# Activate kamui when charge reaches 80 ticks (4 seconds) - CHANGED FROM 40
execute as @a[scores={tobi_kamui_charge=80..}] run function tobi:kamui/activate

# NEW - Reset animation if charge is cancelled
execute as @a[scores={kamui.state=1..2}] unless score @s tobi_kamui_charge matches 1.. run scoreboard players set @s kamui.state 0
execute as @a[scores={kamui.state=1..2}] unless score @s tobi_kamui_charge matches 1.. run scoreboard players set @s kamui.frame 0