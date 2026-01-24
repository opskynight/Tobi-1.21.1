# Remove all scoreboard objectives
scoreboard objectives remove tobi_phase
scoreboard objectives remove tobi_underground
scoreboard objectives remove tobi_slot

# Kamui scoreboards
scoreboard objectives remove tobi_kamui_charge
scoreboard objectives remove tobi_kamui_active

# Barrier scoreboard
scoreboard objectives remove tobi_barrier_timer

# Raycast Kamui Kidnap scoreboards
scoreboard objectives remove tobi_ray_distance
scoreboard objectives remove tobi_ray_hit
scoreboard objectives remove tobi_kamui_kidnap_charge
scoreboard objectives remove tobi_kamui_kidnap_cooldown

# Return scoreboards
scoreboard objectives remove tobi_return_cooldown
scoreboard objectives remove tobi_return_charge

# Armor detection scoreboard
scoreboard objectives remove tobi_has_armor

# NEW - Kamui Animation scoreboards
scoreboard objectives remove kamui_state
scoreboard objectives remove kamui_frame
scoreboard objectives remove kamui_timer

# Remove all markers
kill @e[type=armor_stand,tag=kamui_marker]

# Remove all tags
tag @a remove tobi_armor_notified
tag @a remove kamui_raycaster
tag @a remove raycast_done
tag @a remove raycast_hit
tag @e remove kamui_target
tag @e remove tobi_kidnapped

# Return all spectators to survival
gamemode survival @a[gamemode=spectator]

# Clear all effects from entities
effect clear @e minecraft:blindness
effect clear @e minecraft:weakness
effect clear @e minecraft:resistance
effect clear @e minecraft:slowness
effect clear @e minecraft:wither
effect clear @e minecraft:night_vision
effect clear @e minecraft:saturation
effect clear @e minecraft:health_boost
effect clear @e minecraft:glowing

# Test Spiral scoreboards
scoreboard objectives remove spiral_state
scoreboard objectives remove spiral_rotation
scoreboard objectives remove spiral_scale
scoreboard objectives remove spiral_timer

# Confirmation
tellraw @a {"text":"[Tobi] Datapack uninstalled successfully.","color":"red"}