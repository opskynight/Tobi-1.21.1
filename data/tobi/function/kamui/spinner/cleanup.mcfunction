# Kill armor stands only if no player is nearby AND not animating AND not in Kamui
execute as @e[type=armor_stand,tag=kamui_spinner] at @s unless entity @a[distance=..5] run kill @s