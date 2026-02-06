# ============================================
# DETECT COMPASS TOKEN USAGE
# ============================================
# Detects when player sneak + right-clicks a waypoint compass

# Detect sneak + right-click on compass with waypoint_token data
execute as @a[scores={tobi_used_compass=1..},predicate=tobi:is_sneaking] if items entity @s weapon.mainhand compass[custom_data~{waypoint_token:1b}] run function tobi:waypoint_creator/teleport_from_compass
execute as @a[scores={tobi_used_compass=1..},predicate=tobi:is_sneaking] if items entity @s weapon.offhand compass[custom_data~{waypoint_token:1b}] run function tobi:waypoint_creator/teleport_from_compass

# Reset stat
scoreboard players set @a tobi_used_compass 0
