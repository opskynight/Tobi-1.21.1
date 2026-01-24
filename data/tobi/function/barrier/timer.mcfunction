# Increment timer only for players holding slot 2 AND wearing armor
execute as @a[scores={tobi_slot=2,tobi_has_armor=1}] run scoreboard players add @s tobi_barrier_timer 1

# Reset timer at 260 ticks
execute as @a[scores={tobi_barrier_timer=260..}] run scoreboard players set @s tobi_barrier_timer 0