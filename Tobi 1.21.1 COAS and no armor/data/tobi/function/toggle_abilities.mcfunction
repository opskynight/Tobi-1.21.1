# ============================================
# TOGGLE TOBI ABILITIES ON/OFF
# ============================================
# Usage: /function tobi:toggle_abilities
# Toggles between enabled and disabled states

# Check current state and toggle
execute as @s unless entity @s[tag=tobi_abilities_enabled] run function tobi:enable_abilities
execute as @s[tag=tobi_abilities_enabled] run function tobi:disable_abilities