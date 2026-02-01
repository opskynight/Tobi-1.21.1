# ============================================
# KAMUI DIMENSION - DETECT LOCATION
# ============================================
# Detects if player is in Kamui void or elsewhere
# Updates COAS name accordingly

# Check if player is in kamui:void dimension
execute in kamui:void as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1}] if entity @s[distance=0..] run tag @s add in_kamui_void

# If in void → Change COAS to "Return to Original Spot"
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1},tag=in_kamui_void] unless entity @s[tag=coas_name_updated] run function tobi:dimensional/kamui_dimension/update_name_return

# If NOT in void → Change COAS to "Kamui Dimension"
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1},tag=coas_name_updated] unless entity @s[tag=in_kamui_void] run function tobi:dimensional/kamui_dimension/update_name_dimension

# Remove tag for next tick
tag @a remove in_kamui_void