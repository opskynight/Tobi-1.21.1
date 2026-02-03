# ============================================
# GENJUTSU TORTURE ALL
# ============================================
# Torture all mobs with genjutsu_target OR genjutsu_sneak_target tags

# Apply damage to raycast-targeted mobs (genjutsu_target tag)
execute as @e[tag=genjutsu_target] unless entity @s[tag=genjutsu_damaged] run function tobi:defensive/genjutsu/apply_damage

# Apply damage to sneak-frozen mobs (genjutsu_sneak_target tag)
execute as @e[tag=genjutsu_sneak_target] unless entity @s[tag=genjutsu_damaged] run function tobi:defensive/genjutsu/apply_damage

# Sound effect for player
playsound minecraft:entity.wither.hurt player @s ~ ~ ~ 1 0.5

# Particle burst around player
execute at @s run particle minecraft:dust{color:[0.8,0.0,0.0],scale:2.0} ~ ~1 ~ 1 1 1 0.3 50 force

# Message
tellraw @s {"text":"[Genjutsu] Torture activated!","color":"dark_red","bold":true}
