# ============================================
# TOBI DATAPACK - LOAD (COAS SYSTEM)
# ============================================

# Core Logic
scoreboard objectives add tobi_slot dummy
scoreboard objectives add tobi_has_armor dummy
scoreboard objectives add tobi_death deathCount

# ============================================
# COAS DETECTION SCORES
# ============================================
scoreboard objectives add tobi_defensive dummy "Holding Defensive COAS"
scoreboard objectives add tobi_offensive dummy "Holding Offensive COAS"
scoreboard objectives add tobi_dimensional dummy "Holding Dimensional COAS"

# Mode switching detection
scoreboard objectives add tobi_offhand_swap dummy "Offhand swap detection"

# ============================================
# DEFENSIVE STYLE (Phasing + Invulnerability)
# ============================================
scoreboard objectives add tobi_phase dummy
scoreboard objectives add tobi_underground dummy

# ============================================
# OFFENSIVE STYLE (Short/Long/Return)
# ============================================
scoreboard objectives add tobi_offensive_mode dummy "0=Short, 1=Long, 2=Return"
scoreboard objectives add tobi_ray_distance dummy
scoreboard objectives add tobi_ray_hit dummy
scoreboard objectives add tobi_kamui_kidnap_charge dummy
scoreboard objectives add tobi_kamui_kidnap_cooldown dummy
scoreboard objectives add tobi_return_cooldown dummy
scoreboard objectives add tobi_return_charge dummy
scoreboard objectives add tobi_entity_marked dummy
scoreboard objectives add tobi_maintain_timer dummy

# ============================================
# DIMENSIONAL STYLE (Travel/Dimension/Genjutsu) - COMING SOON
# ============================================
scoreboard objectives add tobi_dimensional_mode dummy "0=Travel, 1=Dimension, 2=Genjutsu"
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

# ============================================
# EXTRA FEATURES
# ============================================
# Spiral Animation (Slot 6 - keeping this separate)
scoreboard objectives add spiral_state dummy
scoreboard objectives add spiral_scale dummy
scoreboard objectives add spiral_timer dummy
scoreboard objectives add spiral_rotation dummy

# Barrier Timer (keeping for legacy compatibility)
scoreboard objectives add tobi_barrier_timer dummy

tellraw @a {"text":"[Tobi] COAS System Loaded!","color":"gold","bold":true}
tellraw @a {"text":"→ /function tobi:give_all (Get everything)","color":"yellow"}
