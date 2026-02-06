# ============================================
# DETECT COMPASS TOKEN USAGE
# ============================================

# Method 1: Sneak + Right-click
execute as @a[scores={tobi_used_compass=1..},predicate=tobi:is_sneaking] if items entity @s weapon.mainhand minecraft:compass[custom_data~{waypoint_token:1b}] run function tobi:waypoint_creator/teleport_from_compass

execute as @a[scores={tobi_used_compass=1..},predicate=tobi:is_sneaking] if items entity @s weapon.offhand minecraft:compass[custom_data~{waypoint_token:1b}] run function tobi:waypoint_creator/teleport_from_compass

# Reset stat
scoreboard players set @a[scores={tobi_used_compass=1..}] tobi_used_compass 0