# Core Logic
scoreboard objectives add tobi_slot dummy
scoreboard objectives add tobi_has_armor dummy

# Death tracking for effect reapplication
scoreboard objectives add tobi_death deathCount

# Phasing (Slot 0)
scoreboard objectives add tobi_phase dummy
scoreboard objectives add tobi_underground dummy

# Kamui Teleport (Slot 1)
scoreboard objectives add tobi_kamui_charge dummy
scoreboard objectives add tobi_kamui_active dummy
scoreboard objectives add tobi_kamui_pos_x dummy
scoreboard objectives add tobi_kamui_pos_y dummy
scoreboard objectives add tobi_kamui_pos_z dummy
scoreboard objectives add tobi_temp_x dummy
scoreboard objectives add tobi_temp_y dummy
scoreboard objectives add tobi_temp_z dummy
scoreboard objectives add tobi_kamui_stillness dummy
scoreboard objectives add tobi_kamui_return_countdown dummy

# Time Barrier (Slot 2)
scoreboard objectives add tobi_barrier_timer dummy

# Kamui Kidnap (Slot 3)
scoreboard objectives add tobi_ray_distance dummy
scoreboard objectives add tobi_ray_hit dummy
scoreboard objectives add tobi_kamui_kidnap_charge dummy
scoreboard objectives add tobi_kamui_kidnap_cooldown dummy

# Return Ability (Slot 4)
scoreboard objectives add tobi_return_cooldown dummy
scoreboard objectives add tobi_return_charge dummy
scoreboard objectives add tobi_entity_marked dummy
scoreboard objectives add tobi_maintain_timer dummy

# Genjutsu (Slot 5)
scoreboard objectives add tobi_genjutsu_dmg dummy
scoreboard objectives add tobi_genjutsu_temp dummy

# Spiral Animation (Slot 6)
scoreboard objectives add spiral_state dummy
scoreboard objectives add spiral_scale dummy
scoreboard objectives add spiral_timer dummy
scoreboard objectives add spiral_rotation dummy

# Set constant for division
scoreboard players set #3 tobi_genjutsu_dmg 3

tellraw @a {"text":"[Tobi] Datapack Loaded! All systems online.","color":"gold"}