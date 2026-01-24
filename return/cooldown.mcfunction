# Increment cooldown timer for players on slot 4
execute as @a[scores={tobi_slot=4,tobi_return_cooldown=1..}] run scoreboard players add @s tobi_return_cooldown 1

# Display cooldown status (120 ticks = 6 seconds total cooldown)
execute as @a[scores={tobi_slot=4,tobi_return_cooldown=1..59}] run title @s actionbar {"text":"▱▱▱▱▱ TRANSPORT RECHARGING ▱▱▱▱▱","color":"red","bold":true}
execute as @a[scores={tobi_slot=4,tobi_return_cooldown=60..119}] run title @s actionbar {"text":"▱▱▱▱▱▱▱▱▱▱ ALMOST READY ▱▱▱▱▱▱▱▱▱▱","color":"yellow","bold":true}

# Reset cooldown after 120 ticks (6 seconds)
execute as @a[scores={tobi_return_cooldown=120..}] run scoreboard players set @s tobi_return_cooldown 0

# Ready notification
execute as @a[scores={tobi_slot=4,tobi_return_cooldown=0}] run title @s actionbar {"text":"✦ RETURN READY ✦","color":"green","bold":true}