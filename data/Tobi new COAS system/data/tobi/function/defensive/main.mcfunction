# ============================================
# KAMUI DEFENSIVE STYLE - MAIN CONTROLLER
# ============================================
# Combines Phasing (Slot 0) + Invulnerability (Slot 2)
# Only runs when player is holding Defensive COAS

# ============================================
# PASSIVE ABILITY: INVULNERABILITY
# ============================================
# Runs constantly when holding COAS (no cooldown, no sneak required)
function tobi:defensive/passive_invulnerability

# ============================================
# ACTIVE ABILITY: PHASING
# ============================================
# Runs when sneaking while holding COAS
function tobi:defensive/phasing_detect
function tobi:defensive/phasing_sink
function tobi:defensive/phasing_check_underground
function tobi:defensive/phasing_check_surface

# ============================================
# STATUS DISPLAY
# ============================================
function tobi:defensive/display
