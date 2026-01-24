# Main tick function - runs all abilities

# ARMOR DETECTION - Check if player has full Tobi armor set
function tobi:armor/detect
function tobi:armor/buffs

# Phasing (Slot 0)
function tobi:phasing/detect_activation
function tobi:phasing/sink
function tobi:phasing/check_underground
function tobi:phasing/check_surface

# Kamui Teleport (Slot 1)
function tobi:kamui/charge
function tobi:kamui/countdown

# Time Barrier (Slot 2)
function tobi:barrier/detect
function tobi:barrier/timer
function tobi:barrier/activate
function tobi:barrier/display

# NEW - Kamui Kidnap with Raycast (Slot 3)
function tobi:kamui_kidnap/detect
function tobi:kamui_kidnap/raycast_control
function tobi:kamui_kidnap/marker_effects
function tobi:kamui_kidnap/charge_kidnap
function tobi:kamui_kidnap/cooldown

# Return (Slot 4)
function tobi:return/detect
function tobi:return/teleport_back
function tobi:return/reset
function tobi:return/cooldown

# Genjutsu (Slot 5)
function tobi:genjutsu/effects
function tobi:genjutsu/detect

# Test Spiral (Slot 6) - CLEAN SYSTEM
function tobi:test_spiral/main

# NEW - Kamui Spiral Animation System
function tobi:kamui/animation_tick