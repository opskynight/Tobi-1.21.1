# ============================================
# TOBI DATAPACK - TICK (UPDATED WITH GENJUTSU IN DEFENSIVE)
# ============================================

# ============================================
# PLAYER INITIALIZATION
# ============================================
# Run initialization for any player who doesn't have scores set
execute as @a unless score @s tobi_kamui_active = @s tobi_kamui_active run function tobi:player_join

# --- GLOBAL CHECKS ---
function tobi:armor/detect
function tobi:armor/buffs

# ============================================
# COAS DETECTION
# ============================================
function tobi:coas/detect_defensive
function tobi:coas/detect_offensive
function tobi:coas/detect_dimensional
function tobi:coas/detect_waypoint

# ============================================
# DEFENSIVE STYLE (COAS #1) - NOW WITH GENJUTSU!
# ============================================
execute as @a[scores={tobi_defensive=1}] run function tobi:defensive/main

# ============================================
# OFFENSIVE STYLE (COAS #2)
# ============================================
execute as @a[scores={tobi_offensive=1}] run function tobi:offensive/main

# ============================================
# KAMUI TRAVEL SAFETY NET
# ============================================
# detect_stillness runs INDEPENDENTLY of tobi_offensive.
# If the player is stuck in spectator for any reason —
# even if the COAS stick vanished and tobi_offensive dropped to 0 —
# this still ticks so they can stand still and exit spectator.
execute as @a[scores={tobi_kamui_active=1}] run function tobi:offensive/kamui_travel/detect_stillness

# ============================================
# DIMENSIONAL STYLE (COAS #3) - TRAVEL REMOVED, NOW ONLY DIMENSION (1)
# ============================================
execute as @a[scores={tobi_dimensional=1}] run function tobi:dimensional/main

# ============================================
# WAYPOINT STYLE (COAS #4)
# ============================================
execute as @a[scores={tobi_waypoint=1}] run function tobi:waypoint/main

# ============================================
# LEGACY SYSTEMS
# ============================================
# Spiral Animation (Slot 6)
function tobi:test_spiral/main
