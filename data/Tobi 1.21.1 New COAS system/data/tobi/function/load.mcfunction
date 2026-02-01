# ============================================
# TOBI DATAPACK - LOAD (COAS SYSTEM) - COMPLETE
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

# Short Range (Mode 0)
scoreboard objectives add tobi_short_range_charge dummy "Short range charge timer"
scoreboard objectives add tobi_short_range_cooldown dummy "Short range cooldown"

# Long Range (Mode 1)
scoreboard objectives add tobi_ray_distance dummy
scoreboard objectives add tobi_ray_hit dummy
scoreboard objectives add tobi_kamui_kidnap_charge dummy
scoreboard objectives add tobi_kamui_kidnap_cooldown dummy

# Return (Mode 2)
scoreboard objectives add tobi_return_cooldown dummy
scoreboard objectives add tobi_return_charge dummy
scoreboard objectives add tobi_entity_marked dummy
scoreboard objectives add tobi_maintain_timer dummy

# Temporary storage for counts/calculations
scoreboard objectives add tobi_temp_x dummy
scoreboard objectives add tobi_temp_health dummy

# ============================================
# DIMENSIONAL STYLE (Travel/Dimension/Genjutsu)
# ============================================
scoreboard objectives add tobi_dimensional_mode dummy "0=Travel, 1=Dimension, 2=Genjutsu"

# Travel Mode (Mode 0)
scoreboard objectives add tobi_kamui_charge dummy "Kamui travel charge"
scoreboard objectives add tobi_kamui_active dummy "Kamui travel active"
scoreboard objectives add tobi_kamui_pos_x dummy "Kamui position X"
scoreboard objectives add tobi_kamui_pos_y dummy "Kamui position Y"
scoreboard objectives add tobi_kamui_pos_z dummy "Kamui position Z"
scoreboard objectives add tobi_kamui_stillness dummy "Kamui stillness timer"
scoreboard objectives add tobi_temp_y dummy "Temp Y storage"
scoreboard objectives add tobi_temp_z dummy "Temp Z storage"

# Dimension Mode (Mode 1)
scoreboard objectives add tobi_dimension_charge dummy "Dimension warp charge"
scoreboard objectives add tobi_return_x dummy "Return X coordinate"
scoreboard objectives add tobi_return_y dummy "Return Y coordinate"
scoreboard objectives add tobi_return_z dummy "Return Z coordinate"
scoreboard objectives add tobi_return_dim dummy "Return dimension ID"

# Genjutsu Mode (Mode 2)
scoreboard objectives add tobi_genjutsu_dmg dummy "Genjutsu damage calc"
scoreboard objectives add tobi_genjutsu_timer dummy "Genjutsu damage cooldown"

# Set constants for genjutsu
scoreboard players set #3 tobi_genjutsu_dmg 3
scoreboard players set #100 tobi_genjutsu_dmg 100
scoreboard players set #20 tobi_genjutsu_dmg 20

# ============================================
# EXTRA FEATURES (Legacy)
# ============================================
# Spiral Animation (Slot 6 - keeping separate)
scoreboard objectives add spiral_state dummy
scoreboard objectives add spiral_scale dummy
scoreboard objectives add spiral_timer dummy
scoreboard objectives add spiral_rotation dummy

# Barrier Timer (keeping for legacy compatibility)
scoreboard objectives add tobi_barrier_timer dummy

tellraw @a {"text":"[Tobi] COAS System Loaded! (COMPLETE - All 3 COAS)","color":"gold","bold":true}
tellraw @a {"text":"→ /function tobi:give_all (Get everything)","color":"yellow"}
tellraw @a {"text":"→ Defensive, Offensive, AND Dimensional ready!","color":"green"}