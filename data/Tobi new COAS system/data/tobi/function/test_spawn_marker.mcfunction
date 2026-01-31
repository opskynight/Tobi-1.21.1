# ============================================
# MANUAL MARKER SPAWN (FOR TESTING)
# ============================================
# Usage: /function tobi:test_spawn_marker
# Spawns a kamui marker where you're looking

# Kill old markers first
execute at @s run kill @e[type=armor_stand,tag=kamui_marker,distance=..50]

# Spawn marker at your position (for testing)
summon armor_stand ~ ~1 ~3 {Invisible:1b,Marker:1b,NoGravity:1b,Invulnerable:1b,Tags:["kamui_marker"],CustomName:'{"text":"TEST Kamui Marker","color":"dark_purple"}'}

tellraw @s {"text":"[TEST] Spawned kamui marker 3 blocks in front of you!","color":"green"}
tellraw @s {"text":"→ Stand near it and sneak to test if entities freeze","color":"yellow"}

# Spawn a test zombie nearby
summon zombie ~3 ~1 ~3 {CustomName:'{"text":"Test Target","color":"red"}'}
tellraw @s {"text":"→ Spawned test zombie near marker","color":"yellow"}
