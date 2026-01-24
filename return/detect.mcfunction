# Reset cooldown if player is NOT on slot 4
execute as @a unless score @s tobi_slot matches 4 run scoreboard players set @s tobi_return_cooldown 0

# Reset charge if player is NOT on slot 4
execute as @a unless score @s tobi_slot matches 4 run scoreboard players set @s tobi_return_charge 0