# ============================================
# DEFENSIVE STYLE STATUS DISPLAY
# ============================================

# Show different messages based on what's active

# Phasing active (sneaking underground)
execute as @a[gamemode=spectator,scores={tobi_defensive=1,tobi_phase=1}] run title @s actionbar {"text":"◉ DEFENSIVE - Underground Phasing ◉","color":"dark_gray","bold":true}

# Phasing sinking (still in survival, sinking down)
execute as @a[gamemode=survival,scores={tobi_defensive=1,tobi_phase=1}] run title @s actionbar {"text":"◉ DEFENSIVE - Sinking... ◉","color":"gray","bold":true}

# Passive mode (just holding, not phasing)
execute as @a[scores={tobi_defensive=1,tobi_phase=0,tobi_has_armor=1}] run title @s actionbar {"text":"▰▰▰ KAMUI DEFENSIVE - INVULNERABLE ▰▰▰","color":"dark_red","bold":true}

# No armor warning
execute as @a[scores={tobi_defensive=1,tobi_has_armor=0}] run title @s actionbar {"text":"⚠ NEED TOBI ARMOR ⚠","color":"red","bold":true}
