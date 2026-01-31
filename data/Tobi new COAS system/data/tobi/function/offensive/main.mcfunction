# ============================================
# KAMUI OFFENSIVE STYLE - MAIN CONTROLLER
# ============================================
# Routes to different functions based on offensive_mode:
# - Mode 0: Short Range (Freeze nearby entities)
# - Mode 1: Long Range (Raycast kidnap)
# - Mode 2: Return (Bring entities back)

# ============================================
# MODE 0: SHORT RANGE
# ============================================
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=0}] run function tobi:offensive/short_range/main

# ============================================
# MODE 1: LONG RANGE
# ============================================
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=1}] run function tobi:offensive/long_range/main

# ============================================
# MODE 2: RETURN
# ============================================
execute as @a[scores={tobi_offensive=1,tobi_offensive_mode=2}] run function tobi:offensive/return_mode/main

# ============================================
# GENERAL DISPLAY (when no specific mode activity)
# ============================================
function tobi:offensive/display
