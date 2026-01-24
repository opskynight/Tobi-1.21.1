# ACTIVE PHASE: 0-160 ticks (8 seconds)

# Kill projectiles with feedback (smoke + sound)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=arrow,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=arrow,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=arrow,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=spectral_arrow,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=spectral_arrow,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=spectral_arrow,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=trident,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=trident,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=trident,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=fireball,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=fireball,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=fireball,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=small_fireball,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=small_fireball,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=small_fireball,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=snowball,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=snowball,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=snowball,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=egg,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=egg,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=egg,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=dragon_fireball,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=dragon_fireball,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=dragon_fireball,distance=..5]

execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=wither_skull,distance=..5] at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.05 10 force
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s as @e[type=wither_skull,distance=..5] at @s run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 0.5 2
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run kill @e[type=wither_skull,distance=..5]

# Grant player continuous resistance during active phase
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] run effect give @s minecraft:resistance 1 255 true

# Apply weakness to ALL entities except players and items within 20 blocks
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run effect give @e[type=!player,type=!item,type=!experience_orb,distance=..20] minecraft:weakness 5 255 true

# Visual feedback - dragon breath particles (REMOVED continuous sound)
# execute as @a[scores={tobi_slot=2,tobi_barrier_timer=0..160}] at @s run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2

# Activation message and sound at tick 1 (when selecting slot)
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=1}] run tellraw @s {"text":"[Intangibility] Activated!","color":"dark_red","bold":true}
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=1}] at @s run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2

# End of active phase message at tick 161
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=161}] run tellraw @s {"text":"[Intangibility] Fading... Cooldown started.","color":"yellow"}
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=161}] at @s run playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.5 0.8

# Clear effects when entering cooldown
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=161}] run effect clear @s minecraft:resistance
execute as @a[scores={tobi_slot=2,tobi_barrier_timer=161}] at @s run effect clear @e[distance=..20] minecraft:weakness