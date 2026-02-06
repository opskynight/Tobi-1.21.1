# ============================================
# TOBI DATAPACK - LOAD (COAS SYSTEM) - UPDATED WITH GENJUTSU
# ============================================

# Core Logic
scoreboard objectives add tobi_slot dummy
scoreboard objectives add tobi_death deathCount

# ============================================
# COAS DETECTION SCORES
# ============================================
scoreboard objectives add tobi_defensive dummy "Holding Defensive COAS"
scoreboard objectives add tobi_offensive dummy "Holding Offensive COAS"
scoreboard objectives add tobi_dimensional dummy "Holding Dimensional COAS"
scoreboard objectives add tobi_waypoint dummy "Holding Waypoint COAS"

# Mode switching detection
scoreboard objectives add tobi_offhand_swap dummy "Offhand swap detection"

# ============================================
# DEFENSIVE STYLE (Invulnerability + Genjutsu)
# ============================================
scoreboard objectives add tobi_defensive_mode dummy "0=Invulnerability, 1=Genjutsu"
scoreboard objectives add tobi_phase dummy
scoreboard objectives add tobi_underground dummy

# Genjutsu raycast
scoreboard objectives add tobi_genjutsu_ray_distance dummy "Genjutsu raycast distance"
scoreboard objectives add tobi_genjutsu_ray_hit dummy "Genjutsu raycast hit"

# Genjutsu sneak freeze
scoreboard objectives add tobi_genjutsu_sneak_freeze dummy "Sneak freeze state"
scoreboard objectives add tobi_genjutsu_sneak_timer dummy "Sneak freeze timer"

# Genjutsu right click detection
scoreboard objectives add tobi_used_coas minecraft.used:minecraft.carrot_on_a_stick "Right click detection"

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
# DIMENSIONAL STYLE (Travel/Dimension) - GENJUTSU REMOVED!
# ============================================
scoreboard objectives add tobi_dimensional_mode dummy "0=Travel, 1=Dimension"

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

# Genjutsu damage calculation (now used by Defensive, not Dimensional)
scoreboard objectives add tobi_genjutsu_dmg dummy "Genjutsu damage calc"
scoreboard objectives add tobi_genjutsu_timer dummy "Genjutsu damage cooldown"

# Set constants for genjutsu
scoreboard players set #3 tobi_genjutsu_dmg 3
scoreboard players set #100 tobi_genjutsu_dmg 100
scoreboard players set #20 tobi_genjutsu_dmg 20

# ============================================
# WAYPOINT SYSTEM
# ============================================
scoreboard objectives add tobi_waypoint_charge dummy "Waypoint charge timer"

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

# ============================================
# INITIALIZE ALL PLAYER SCORES TO 0
# ============================================

# Core scores
execute as @a unless score @s tobi_defensive = @s tobi_defensive run scoreboard players set @s tobi_defensive 0
execute as @a unless score @s tobi_offensive = @s tobi_offensive run scoreboard players set @s tobi_offensive 0
execute as @a unless score @s tobi_dimensional = @s tobi_dimensional run scoreboard players set @s tobi_dimensional 0
execute as @a unless score @s tobi_waypoint = @s tobi_waypoint run scoreboard players set @s tobi_waypoint 0

# Defensive scores
execute as @a unless score @s tobi_defensive_mode = @s tobi_defensive_mode run scoreboard players set @s tobi_defensive_mode 0
execute as @a unless score @s tobi_phase = @s tobi_phase run scoreboard players set @s tobi_phase 0
execute as @a unless score @s tobi_underground = @s tobi_underground run scoreboard players set @s tobi_underground 0

# Genjutsu scores
execute as @a unless score @s tobi_genjutsu_ray_distance = @s tobi_genjutsu_ray_distance run scoreboard players set @s tobi_genjutsu_ray_distance 0
execute as @a unless score @s tobi_genjutsu_ray_hit = @s tobi_genjutsu_ray_hit run scoreboard players set @s tobi_genjutsu_ray_hit 0
execute as @a unless score @s tobi_genjutsu_sneak_freeze = @s tobi_genjutsu_sneak_freeze run scoreboard players set @s tobi_genjutsu_sneak_freeze 0
execute as @a unless score @s tobi_genjutsu_sneak_timer = @s tobi_genjutsu_sneak_timer run scoreboard players set @s tobi_genjutsu_sneak_timer 0

# Offensive scores
execute as @a unless score @s tobi_offensive_mode = @s tobi_offensive_mode run scoreboard players set @s tobi_offensive_mode 0
execute as @a unless score @s tobi_short_range_charge = @s tobi_short_range_charge run scoreboard players set @s tobi_short_range_charge 0
execute as @a unless score @s tobi_short_range_cooldown = @s tobi_short_range_cooldown run scoreboard players set @s tobi_short_range_cooldown 0
execute as @a unless score @s tobi_ray_distance = @s tobi_ray_distance run scoreboard players set @s tobi_ray_distance 0
execute as @a unless score @s tobi_kamui_kidnap_charge = @s tobi_kamui_kidnap_charge run scoreboard players set @s tobi_kamui_kidnap_charge 0
execute as @a unless score @s tobi_kamui_kidnap_cooldown = @s tobi_kamui_kidnap_cooldown run scoreboard players set @s tobi_kamui_kidnap_cooldown 0
execute as @a unless score @s tobi_return_cooldown = @s tobi_return_cooldown run scoreboard players set @s tobi_return_cooldown 0
execute as @a unless score @s tobi_return_charge = @s tobi_return_charge run scoreboard players set @s tobi_return_charge 0

# Dimensional scores
execute as @a unless score @s tobi_dimensional_mode = @s tobi_dimensional_mode run scoreboard players set @s tobi_dimensional_mode 0
execute as @a unless score @s tobi_kamui_charge = @s tobi_kamui_charge run scoreboard players set @s tobi_kamui_charge 0
execute as @a unless score @s tobi_kamui_active = @s tobi_kamui_active run scoreboard players set @s tobi_kamui_active 0
execute as @a unless score @s tobi_kamui_stillness = @s tobi_kamui_stillness run scoreboard players set @s tobi_kamui_stillness 0
execute as @a unless score @s tobi_dimension_charge = @s tobi_dimension_charge run scoreboard players set @s tobi_dimension_charge 0

# Waypoint scores
execute as @a unless score @s tobi_waypoint_charge = @s tobi_waypoint_charge run scoreboard players set @s tobi_waypoint_charge 0

# Spiral scores
execute as @a unless score @s spiral_state = @s spiral_state run scoreboard players set @s spiral_state 0
execute as @a unless score @s spiral_scale = @s spiral_scale run scoreboard players set @s spiral_scale 0
execute as @a unless score @s spiral_timer = @s spiral_timer run scoreboard players set @s spiral_timer 0
execute as @a unless score @s spiral_rotation = @s spiral_rotation run scoreboard players set @s spiral_rotation 0

# Barrier timer
execute as @a unless score @s tobi_barrier_timer = @s tobi_barrier_timer run scoreboard players set @s tobi_barrier_timer 0

# Temp scores
execute as @a unless score @s tobi_temp_x = @s tobi_temp_x run scoreboard players set @s tobi_temp_x 0
execute as @a unless score @s tobi_temp_y = @s tobi_temp_y run scoreboard players set @s tobi_temp_y 0
execute as @a unless score @s tobi_temp_z = @s tobi_temp_z run scoreboard players set @s tobi_temp_z 0
execute as @a unless score @s tobi_temp_health = @s tobi_temp_health run scoreboard players set @s tobi_temp_health 0

tellraw @a {"text":"[Tobi] COAS System Loaded! (Genjutsu moved to Defensive)","color":"gold","bold":true}
tellraw @a {"text":"→ Defensive now has 2 modes: Invulnerability + Genjutsu","color":"yellow"}
tellraw @a {"text":"→ Dimensional now has 2 modes: Travel + Dimension","color":"yellow"}
tellraw @a {"text":"→ /function tobi:give_all (Get everything)","color":"green"}

# Add to existing scoreboards (around line 60-90):
scoreboard objectives add spiral_test_mode dummy "Spiral test mode flag"
