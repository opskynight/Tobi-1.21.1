# Display color-coded action bar based on timer status

# GREEN PHASE (0-160 ticks) - ACTIVE BARRIER (8 seconds)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] run title @s actionbar {"text":"▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰ KAMUI ACTIVE ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰","color":"dark_red","bold":true}

# YELLOW PHASE (161-220 ticks) - Early Cooldown (3 seconds)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=161..220}] run title @s actionbar {"text":"▱▱▱▱▱▱▱▱▱▱ COOLDOWN ▱▱▱▱▱▱▱▱▱▱","color":"gold","bold":true}

# RED PHASE (221-259 ticks) - Late Cooldown (2 seconds, almost ready)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=221..259}] run title @s actionbar {"text":"▱▱▱▱▱ RECHARGING ▱▱▱▱▱","color":"yellow","bold":true}

# Ready notification (when timer resets to 0)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0}] run title @s actionbar {"text":"✦ KAMUI IS READY ✦","color":"green","bold":true}