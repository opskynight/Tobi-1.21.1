# Only update marker position every 5 ticks to reduce lag
scoreboard players add @a[scores={tobi_slot=3,tobi_has_armor=1,tobi_kamui_kidnap_cooldown=0,tobi_kamui_kidnap_charge=0}] tobi_ray_distance 1

# Run raycast every 5 ticks
execute as @a[scores={tobi_slot=3,tobi_has_armor=1,tobi_kamui_kidnap_cooldown=0,tobi_kamui_kidnap_charge=0,tobi_ray_distance=5..}] at @s anchored eyes run function tobi:kamui_kidnap/start_raycast