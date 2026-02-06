# ============================================
# TOGGLE TOBI ABILITIES ON/OFF - FIXED v2
# ============================================
# Usage: /function tobi:toggle_abilities
# Toggles between enabled and disabled states

# Check if abilities are currently ENABLED (score = 1)
# If enabled, disable them
execute as @s[scores={tobi_has_armor=1}] run function tobi:disable_abilities

# If disabled (score = 0 or not set), enable them
execute as @s unless score @s tobi_has_armor matches 1 run function tobi:enable_abilities
