# ============================================
# TOBI DATAPACK - TICK (COAS SYSTEM) - FIXED
# ============================================

# ============================================
# PLAYER INITIALIZATION (CRITICAL FIX!)
# ============================================
# Run initialization for any player who doesn't have scores set
# This prevents the "undefined score" bug on first join
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

# ============================================
# DEFENSIVE STYLE (COAS #1)
# ============================================
execute as @a[scores={tobi_defensive=1}] run function tobi:defensive/main

# ============================================
# OFFENSIVE STYLE (COAS #2)
# ============================================
# SHORT RANGE (Mode 0)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0}] run function tobi:offensive/short_range/main

# LONG RANGE (Mode 1)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=1}] run function tobi:offensive/long_range/main

# RETURN (Mode 2)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=2}] run function tobi:offensive/return_mode/main

# General display
execute as @a[scores={tobi_offensive=1}] run function tobi:offensive/display

# Mode switching
function tobi:offensive/mode_switch

# ============================================
# DIMENSIONAL STYLE (COAS #3)
# ============================================
execute as @a[scores={tobi_dimensional=1}] run function tobi:dimensional/main

# ============================================
# LEGACY SYSTEMS
# ============================================
# Spiral Animation (Slot 6)
function tobi:test_spiral/main


# ============================================
# ADD THESE LINES TO YOUR tick.mcfunction
# ============================================

# Kamui Waypoint Detection
function tobi:coas/detect_waypoint

# Kamui Waypoint System
execute as @a[scores={tobi_waypoint=1}] run function tobi:waypoint/main

