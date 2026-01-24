# Spawn rotating armor stand at player's eyes
execute anchored eyes run summon armor_stand ^ ^ ^0.5 {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["kamui_spinner","kamui_spinner_new"]}

# Link armor stand to player using UUID (store player's slot as identifier)
scoreboard players operation @e[type=armor_stand,tag=kamui_spinner_new,limit=1] tobi_slot = @s tobi_slot
tag @e[type=armor_stand,tag=kamui_spinner_new] remove kamui_spinner_new

# Debug message
tellraw @s {"text":"[DEBUG] Spinner armor stand spawned","color":"aqua"}