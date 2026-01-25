# --- GLOBAL CHECKS ---
function tobi:armor/detect
function tobi:armor/buffs

# --- ABILITIES BY SLOT ---

# Slot 0: Phasing
function tobi:phasing/detect_activation
function tobi:phasing/sink
function tobi:phasing/check_underground
function tobi:phasing/check_surface

# Slot 1: Kamui Teleport
function tobi:kamui/charge
function tobi:kamui/detect_stillness
# Ensure your return_countdown handles the scoreboard tobi:kamui_return_countdown

# Slot 2: Time Barrier (Intangibility)
function tobi:barrier/detect
function tobi:barrier/timer
function tobi:barrier/activate
function tobi:barrier/display

# Slot 3: Kamui Kidnap (Raycast)
function tobi:kamui_kidnap/detect
function tobi:kamui_kidnap/raycast_control
function tobi:kamui_kidnap/marker_effects
function tobi:kamui_kidnap/charge_kidnap
function tobi:kamui_kidnap/cooldown

# Slot 4: Return Entities
function tobi:return/detect
function tobi:return/teleport_back
function tobi:return/reset
function tobi:return/cooldown

# Slot 5: Genjutsu
function tobi:genjutsu/detect
function tobi:genjutsu/effects

# Slot 6: Spiral Animation
function tobi:test_spiral/main
# The render_spiral should be called inside your states or main spiral logic