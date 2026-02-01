# ============================================
# KAMUI DIMENSION - DETECT LOCATION - FIXED
# ============================================
# Detects if player is in Kamui void or elsewhere
# Updates COAS name accordingly

# First, check if player is in kamui:void dimension
# Remove old tag first
tag @a remove in_kamui_void

# Tag players who are in the void dimension
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1}] in kamui:void if entity @s[distance=0..] run tag @s add in_kamui_void

# If in void AND haven't updated COAS yet → Change COAS to "Return to Original Spot"
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1},tag=in_kamui_void,tag=!coas_name_updated] run function tobi:dimensional/kamui_dimension/update_name_return

# If NOT in void AND have the updated COAS → Change COAS back to "Kamui Dimension"
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1},tag=!in_kamui_void,tag=coas_name_updated] run function tobi:dimensional/kamui_dimension/update_name_dimension
