# ============================================
# KAMUI TRAVEL - DETECT STILLNESS
# ============================================
# Return to survival after standing still for 5 seconds

# Only run for players in spectator with kamui active
execute as @a[gamemode=spectator,scores={tobi_kamui_active=1}] run function tobi:dimensional/kamui_travel/check_movement