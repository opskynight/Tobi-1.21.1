# Teleport spinner to follow players who are animating OR in Kamui dimension
execute as @a[scores={kamui.state=1..3}] at @s anchored eyes run tp @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] ^ ^ ^0.5
execute as @a[scores={tobi_kamui_active=1..}] at @s anchored eyes run tp @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] ^ ^ ^0.5