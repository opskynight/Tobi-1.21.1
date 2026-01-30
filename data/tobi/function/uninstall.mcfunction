# Remove all scoreboard objectives
scoreboard objectives remove tobi_slot
scoreboard objectives remove tobi_has_armor
scoreboard objectives remove tobi_death
scoreboard objectives remove tobi_phase
scoreboard objectives remove tobi_underground
scoreboard objectives remove tobi_kamui_charge
scoreboard objectives remove tobi_kamui_active
scoreboard objectives remove tobi_kamui_pos_x
scoreboard objectives remove tobi_kamui_pos_y
scoreboard objectives remove tobi_kamui_pos_z
scoreboard objectives remove tobi_temp_x
scoreboard objectives remove tobi_temp_y
scoreboard objectives remove tobi_temp_z
scoreboard objectives remove tobi_kamui_stillness
scoreboard objectives remove tobi_kamui_return_countdown
scoreboard objectives remove tobi_barrier_timer
scoreboard objectives remove tobi_ray_distance
scoreboard objectives remove tobi_ray_hit
scoreboard objectives remove tobi_kamui_kidnap_charge
scoreboard objectives remove tobi_kamui_kidnap_cooldown
scoreboard objectives remove tobi_return_cooldown
scoreboard objectives remove tobi_return_charge
scoreboard objectives remove tobi_entity_marked
scoreboard objectives remove tobi_maintain_timer
scoreboard objectives remove tobi_genjutsu_dmg
scoreboard objectives remove tobi_genjutsu_timer
scoreboard objectives remove spiral_state
scoreboard objectives remove spiral_scale
scoreboard objectives remove spiral_timer
scoreboard objectives remove spiral_rotation

# Clean up entities and effects
kill @e[type=armor_stand,tag=kamui_marker]
kill @e[type=marker,tag=kamui_spinner]
gamemode survival @a[gamemode=spectator]
effect clear @e

# Restore AI for any frozen entities
execute as @e[type=!player,type=!item,type=!experience_orb,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Remove genjutsu tags
tag @e[tag=genjutsu_damaged] remove genjutsu_damaged

tellraw @a {"text":"[Tobi] Datapack uninstalled successfully.","color":"red"}
