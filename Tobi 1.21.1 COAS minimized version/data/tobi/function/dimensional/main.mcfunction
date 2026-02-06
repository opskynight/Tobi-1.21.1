# ============================================
# KAMUI DIMENSIONAL STYLE - MAIN CONTROLLER
# ============================================
# Routes to appropriate mode based on dimensional_mode score

# MODE 0: KAMUI TRAVEL (Spectator)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0}] run function tobi:dimensional/kamui_travel/main

# MODE 1: KAMUI DIMENSION (Void Teleport)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=1}] run function tobi:dimensional/kamui_dimension/main

# MODE 2: GENJUTSU (Illusion/Torture)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2}] run function tobi:dimensional/genjutsu/main

# General display (for all dimensional modes)
execute as @a[scores={tobi_dimensional=1}] run function tobi:dimensional/display

# Mode switching (offhand swap detection)
function tobi:dimensional/mode_switch