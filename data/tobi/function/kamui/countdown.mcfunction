# Increment active timer for players in kamui mode
execute as @a[scores={tobi_kamui_active=1..}] run scoreboard players add @s tobi_kamui_active 1

# Continuous particles while in kamui
execute as @a[scores={tobi_kamui_active=1..}] at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.5 0.3 0.05 5 force

# Action bar display
execute as @a[scores={tobi_kamui_active=1..239}] run title @s actionbar {"text":"◉◉◉ KAMUI DIMENSION ◉◉◉","color":"dark_purple","bold":true}

# Start WITHDRAW at 240 ticks (portal closes first)
execute as @a[scores={tobi_kamui_active=240}] run tellraw @s {"text":"[Kamui] Returning in 3 seconds...","color":"yellow"}
execute as @a[scores={tobi_kamui_active=240}] run title @s actionbar {"text":"⚠ Returning in 3s ⚠","color":"yellow","bold":true}

# Spawn spinner if needed (backup)
execute as @a[scores={tobi_kamui_active=240}] at @s anchored eyes unless entity @e[type=armor_stand,tag=kamui_spinner,distance=..3] run summon armor_stand ^ ^ ^0.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["kamui_spinner"]}

# Start DEPLOY at 260 ticks (portal opens after closing)
execute as @a[scores={tobi_kamui_active=260}] run tellraw @s {"text":"[Kamui] Returning in 2 seconds...","color":"gold"}
execute as @a[scores={tobi_kamui_active=260}] run title @s actionbar {"text":"⚠ Returning in 2s ⚠","color":"gold","bold":true}

execute as @a[scores={tobi_kamui_active=280}] run tellraw @s {"text":"[Kamui] Returning in 1 second...","color":"red"}
execute as @a[scores={tobi_kamui_active=280}] run title @s actionbar {"text":"⚠ Returning in 1s ⚠","color":"red","bold":true}

# Return to survival at 300 ticks (NO withdraw trigger here)
execute as @a[scores={tobi_kamui_active=300}] run function tobi:kamui/trigger_deploy
execute as @a[scores={tobi_kamui_active=300}] run gamemode survival @s
execute as @a[scores={tobi_kamui_active=300}] run tellraw @s {"text":"[Kamui] Warped back to reality.","color":"green"}
execute as @a[scores={tobi_kamui_active=300}] at @s run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2
execute as @a[scores={tobi_kamui_active=300}] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
execute as @a[scores={tobi_kamui_active=320}] run function tobi:kamui/trigger_withdraw

# Reset animation state and timer
execute as @a[scores={tobi_kamui_active=300}] run scoreboard players set @s kamui.state 0
execute as @a[scores={tobi_kamui_active=300}] run scoreboard players set @s kamui.frame 0
execute as @a[scores={tobi_kamui_active=300}] run scoreboard players set @s tobi_kamui_active 0