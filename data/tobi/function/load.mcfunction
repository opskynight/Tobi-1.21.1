# Create scoreboard objectives
scoreboard objectives add tobi_phase dummy
scoreboard objectives add tobi_underground dummy
scoreboard objectives add tobi_slot dummy

# Kamui Teleport scoreboards
scoreboard objectives add tobi_kamui_charge dummy
scoreboard objectives add tobi_kamui_active dummy

# Time Barrier scoreboards
scoreboard objectives add tobi_barrier_timer dummy

# NEW - Kamui Raycast scoreboards
scoreboard objectives add tobi_ray_distance dummy
scoreboard objectives add tobi_ray_hit dummy
scoreboard objectives add tobi_kamui_kidnap_charge dummy
scoreboard objectives add tobi_kamui_kidnap_cooldown dummy

# Return ability scoreboards
scoreboard objectives add tobi_return_cooldown dummy
scoreboard objectives add tobi_return_charge dummy

# Armor detection
scoreboard objectives add tobi_has_armor dummy

# NEW - Kamui Spiral Animation scoreboards
scoreboard objectives add kamui_state dummy
scoreboard objectives add kamui_frame dummy
scoreboard objectives add kamui_timer dummy

# Test Spiral scoreboards
scoreboard objectives add spiral_state dummy
scoreboard objectives add spiral_scale dummy
scoreboard objectives add spiral_timer dummy
scoreboard objectives add spiral_rotation dummy

# Confirmation message
tellraw @a {"text":"[Tobi] Datapack loaded! Wear full Tobi armor to unlock abilities.","color":"dark_purple","bold":true}