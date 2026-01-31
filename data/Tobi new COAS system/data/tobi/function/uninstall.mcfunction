# ============================================
# TOBI DATAPACK - UNINSTALL (COAS SYSTEM) - FIXED
# ============================================

# Remove all scoreboard objectives
scoreboard objectives remove tobi_slot
scoreboard objectives remove tobi_has_armor
scoreboard objectives remove tobi_death

# COAS Detection
scoreboard objectives remove tobi_defensive
scoreboard objectives remove tobi_offensive
scoreboard objectives remove tobi_dimensional
scoreboard objectives remove tobi_offhand_swap

# Defensive Style
scoreboard objectives remove tobi_phase
scoreboard objectives remove tobi_underground

# Offensive Style
scoreboard objectives remove tobi_offensive_mode
scoreboard objectives remove tobi_short_range_charge
scoreboard objectives remove tobi_short_range_cooldown
scoreboard objectives remove tobi_ray_distance
scoreboard objectives remove tobi_ray_hit
scoreboard objectives remove tobi_kamui_kidnap_charge
scoreboard objectives remove tobi_kamui_kidnap_cooldown
scoreboard objectives remove tobi_return_cooldown
scoreboard objectives remove tobi_return_charge
scoreboard objectives remove tobi_entity_marked
scoreboard objectives remove tobi_maintain_timer
scoreboard objectives remove tobi_temp_x

# Dimensional Style
scoreboard objectives remove tobi_dimensional_mode
scoreboard objectives remove tobi_kamui_charge
scoreboard objectives remove tobi_kamui_active
scoreboard objectives remove tobi_kamui_pos_x
scoreboard objectives remove tobi_kamui_pos_y
scoreboard objectives remove tobi_kamui_pos_z
scoreboard objectives remove tobi_temp_y
scoreboard objectives remove tobi_temp_z
scoreboard objectives remove tobi_kamui_stillness
scoreboard objectives remove tobi_kamui_return_countdown

# Genjutsu
scoreboard objectives remove tobi_genjutsu_dmg
scoreboard objectives remove tobi_genjutsu_timer

# Extra Features
scoreboard objectives remove spiral_state
scoreboard objectives remove spiral_scale
scoreboard objectives remove spiral_timer
scoreboard objectives remove spiral_rotation
scoreboard objectives remove tobi_barrier_timer

# Clean up entities and effects
kill @e[type=armor_stand,tag=kamui_marker]
kill @e[type=marker,tag=kamui_spinner]
gamemode survival @a[gamemode=spectator]
effect clear @e

# Restore AI for any frozen entities
execute as @e[type=!player,type=!item,type=!experience_orb,nbt={NoAI:1b}] run data merge entity @s {NoAI:0b}

# Remove tags
tag @e[tag=genjutsu_damaged] remove genjutsu_damaged
tag @e[tag=tobi_kidnapped] remove tobi_kidnapped
tag @e[tag=short_range_target] remove short_range_target
tag @e[tag=kamui_target] remove kamui_target

# Remove player tags
tag @a remove tobi_attributes_applied
tag @a remove tobi_effects_applied
tag @a remove tobi_armor_notified

tellraw @a {"text":"[Tobi] Datapack uninstalled successfully.","color":"red"}
