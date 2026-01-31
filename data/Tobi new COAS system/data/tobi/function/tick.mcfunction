# ============================================
# TOBI DATAPACK - TICK (COAS SYSTEM) - FIXED
# ============================================

# --- GLOBAL CHECKS ---
function tobi:armor/detect
function tobi:armor/buffs

# ============================================
# COAS DETECTION
# ============================================
# Detect which COAS the player is holding
function tobi:coas/detect_defensive
function tobi:coas/detect_offensive
# function tobi:coas/detect_dimensional (coming later)

# ============================================
# DEFENSIVE STYLE (COAS #1)
# ============================================
# Runs when player is holding Defensive COAS
execute as @a[scores={tobi_defensive=1}] run function tobi:defensive/main

# ============================================
# OFFENSIVE STYLE (COAS #2)
# ============================================
# Runs when player is holding Offensive COAS

# SHORT RANGE (Mode 0)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0}] run function tobi:offensive/short_range/main

# LONG RANGE (Mode 1)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=1}] run function tobi:offensive/long_range/main

# RETURN (Mode 2)
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=2}] run function tobi:offensive/return_mode/main

# General display (for all offensive modes)
execute as @a[scores={tobi_offensive=1}] run function tobi:offensive/display

# Mode switching (offhand swap detection)
function tobi:offensive/mode_switch

# ============================================
# DIMENSIONAL STYLE (COAS #3) - COMING SOON
# ============================================
# execute as @a[scores={tobi_dimensional=1}] run function tobi:dimensional/main

# ============================================
# LEGACY SYSTEMS (keeping for compatibility)
# ============================================
# Spiral Animation (Slot 6 - keeping separate)
function tobi:test_spiral/main
