# Reset timer if player is NOT on slot 2
execute as @a unless score @s tobi_slot matches 2 run scoreboard players set @s tobi_barrier_timer 0