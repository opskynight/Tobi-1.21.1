# ============================================
# CHECK COOLDOWN STATUS
# ============================================

execute if score @s tobi_short_range_cooldown matches 0 run tellraw @s {"text":"✓ Cooldown = 0 (READY)","color":"green"}
execute if score @s tobi_short_range_cooldown matches 1.. run tellraw @s [{"text":"✗ Cooldown = ","color":"red"},{"score":{"name":"@s","objective":"tobi_short_range_cooldown"},"color":"gold"},{"text":" (NOT READY)","color":"red"}]

tellraw @s ["",{"text":"Full check for tagging:","color":"yellow"}]
execute if score @s tobi_offensive matches 1 run tellraw @s {"text":"  ✓ tobi_offensive = 1","color":"green"}
execute unless score @s tobi_offensive matches 1 run tellraw @s {"text":"  ✗ tobi_offensive != 1","color":"red"}

execute if score @s tobi_offensive_mode matches 0 run tellraw @s {"text":"  ✓ tobi_offensive_mode = 0","color":"green"}
execute unless score @s tobi_offensive_mode matches 0 run tellraw @s {"text":"  ✗ tobi_offensive_mode != 0","color":"red"}

execute if score @s tobi_has_armor matches 1 run tellraw @s {"text":"  ✓ tobi_has_armor = 1","color":"green"}
execute unless score @s tobi_has_armor matches 1 run tellraw @s {"text":"  ✗ tobi_has_armor != 1","color":"red"}

execute if score @s tobi_short_range_cooldown matches 0 run tellraw @s {"text":"  ✓ tobi_short_range_cooldown = 0","color":"green"}
execute unless score @s tobi_short_range_cooldown matches 0 run tellraw @s {"text":"  ✗ tobi_short_range_cooldown > 0","color":"red"}

tellraw @s {"text":"==================","color":"gold"}
tellraw @s {"text":"If all 4 are ✓, tagging SHOULD work!","color":"aqua"}
