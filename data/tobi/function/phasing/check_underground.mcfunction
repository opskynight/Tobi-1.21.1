# Check if player has a solid block above their head
execute as @a[gamemode=survival,scores={tobi_phase=1}] at @s unless block ~ ~1 ~ air unless block ~ ~1 ~ cave_air unless block ~ ~1 ~ void_air run scoreboard players add @s tobi_underground 1

# Reset counter if air is detected above
execute as @a[gamemode=survival,scores={tobi_phase=1}] at @s if block ~ ~1 ~ air run scoreboard players set @s tobi_underground 0
execute as @a[gamemode=survival,scores={tobi_phase=1}] at @s if block ~ ~1 ~ cave_air run scoreboard players set @s tobi_underground 0

# Switch to spectator mode when underground for 4+ ticks
execute as @a[gamemode=survival,scores={tobi_phase=1,tobi_underground=4..}] run gamemode spectator @s
execute as @a[gamemode=spectator,scores={tobi_phase=1,tobi_underground=4..}] run tellraw @s {"text":"[Kamui] Phasing through blocks...","color":"dark_purple","italic":true}