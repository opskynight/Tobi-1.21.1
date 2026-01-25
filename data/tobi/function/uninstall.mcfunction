# Remove all scoreboard objectives
scoreboard objectives remove tobi_slot
scoreboard objectives remove tobi_has_armor
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
scoreboard objectives remove spiral_state
scoreboard objectives remove spiral_scale
scoreboard objectives remove spiral_timer
scoreboard objectives remove spiral_rotation

# Clean up entities and effects
kill @e[type=armor_stand,tag=kamui_marker]
kill @e[type=marker,tag=kamui_spinner]
gamemode survival @a[gamemode=spectator]
effect clear @e

tellraw @a {"text":"[Tobi] Datapack uninstalled successfully.","color":"red"}