# ============================================
# GIVE ALL TOBI ITEMS (ARMOR + BOTH COAS)
# ============================================
# Usage: /function tobi:give_all
# Simple command to get everything you need for testing

# Give Tobi armor
function tobi:armor/give

# Give Defensive COAS
function tobi:coas/give_defensive

# Give Offensive COAS
function tobi:coas/give_offensive

tellraw @p {"text":"[Tobi] Full equipment received!","color":"gold","bold":true}
tellraw @p {"text":"→ Armor + Defensive COAS + Offensive COAS","color":"yellow"}
