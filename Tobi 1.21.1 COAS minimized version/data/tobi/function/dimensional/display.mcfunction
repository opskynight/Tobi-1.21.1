# ============================================
# DIMENSIONAL STYLE STATUS DISPLAY
# ============================================
# Shows current mode and status

# No armor warning (overrides everything)
execute as @a[scores={tobi_dimensional=1,tobi_has_armor=0}] run title @s actionbar {"text":"⚠ NEED TOBI ARMOR ⚠","color":"red","bold":true}

# MODE 0: KAMUI TRAVEL
# Charging spectator
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0,tobi_has_armor=1,tobi_kamui_charge=1..99}] run title @s actionbar {"text":"⬤ CHARGING SPECTATOR MODE ⬤","color":"aqua","bold":true}

# In spectator mode
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0,tobi_has_armor=1,tobi_kamui_active=1},gamemode=spectator] run title @s actionbar {"text":"◈ SPECTATOR - Move to explore ◈","color":"dark_aqua","bold":true}

# Idle (not charging, not active)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=0,tobi_has_armor=1,tobi_kamui_charge=0,tobi_kamui_active=0}] run title @s actionbar {"text":"◈ TRAVEL: SNEAK 5s for Spectator ◈","color":"aqua","bold":true}

# MODE 1: KAMUI DIMENSION
# (handled by dimension mode functions - they override this)

# MODE 2: GENJUTSU
# Control mode (not sneaking)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1}] unless predicate tobi:is_sneaking run title @s actionbar {"text":"◉ GENJUTSU: PARALYSIS ◉","color":"light_purple","bold":true}

# Torture mode (sneaking)
execute as @a[scores={tobi_dimensional=1,tobi_dimensional_mode=2,tobi_has_armor=1},predicate=tobi:is_sneaking] run title @s actionbar {"text":"◉◉◉ MANGEKYOU SHARINGAN: TORTURE ◉◉◉","color":"dark_red","bold":true}