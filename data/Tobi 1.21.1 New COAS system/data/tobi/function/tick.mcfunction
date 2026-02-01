# ============================================
# TOBI DATAPACK - TICK (COAS SYSTEM) - COMPLETE
# ============================================

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