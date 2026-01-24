# Render the appropriate frame based on current animation state
# ALL frames now render at armor stand position for rotation

execute if score @s kamui.frame matches 0 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_00
execute if score @s kamui.frame matches 1 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_10
execute if score @s kamui.frame matches 2 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_20
execute if score @s kamui.frame matches 3 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_30
execute if score @s kamui.frame matches 4 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_40
execute if score @s kamui.frame matches 5 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_50
execute if score @s kamui.frame matches 6 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_60
execute if score @s kamui.frame matches 7 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_70
execute if score @s kamui.frame matches 8 as @e[type=armor_stand,tag=kamui_spinner,limit=1,sort=nearest] run function tobi:kamui/frames/frame_80
