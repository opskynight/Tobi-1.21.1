# Only sink if NOT in kamui mode
execute as @a[gamemode=survival,scores={tobi_phase=1,tobi_kamui_active=0}] at @s run tp @s ~ ~-0.1 ~

# Visual feedback - particles (only when phasing, not kamui)
execute as @a[gamemode=survival,scores={tobi_phase=1,tobi_kamui_active=0}] at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.1 10 force