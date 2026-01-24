# Summon invisible armor stand marker
summon armor_stand ~ ~ ~ {
  Invisible:1b,
  Marker:1b,
  NoGravity:1b,
  Invulnerable:1b,
  Tags:["kamui_marker","new_marker"],
  CustomName:'{"text":"Kamui Target","color":"dark_purple"}'
}

# Link marker to player using UUID (store player's position for reference)
execute as @e[type=armor_stand,tag=new_marker,limit=1] run tag @s remove new_marker

# Prevent further raycasting this tick
scoreboard players set @s tobi_ray_hit 2