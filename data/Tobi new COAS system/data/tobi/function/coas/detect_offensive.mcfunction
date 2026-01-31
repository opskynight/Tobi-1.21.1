# ============================================
# DETECT HOLDING KAMUI OFFENSIVE STYLE (FIXED)
# ============================================
# Detects when player is holding the Offensive COAS
# Also reads which mode (Short=0, Long=1, Return=2)

# Reset offensive mode for all players first
scoreboard players set @a tobi_offensive 0

# Don't reset mode to -1 - let it stay at current value
# This prevents breaking the mode when item NBT is slightly off

# Check mainhand - set offensive flag
execute as @a if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run scoreboard players set @s tobi_offensive 1

# Check offhand - set offensive flag
execute as @a if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] run scoreboard players set @s tobi_offensive 1

# If holding offensive COAS, check which mode
# Check mainhand mode
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:0}] run scoreboard players set @s tobi_offensive_mode 0
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:1}] run scoreboard players set @s tobi_offensive_mode 1
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:2}] run scoreboard players set @s tobi_offensive_mode 2

# Check offhand mode
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:0}] run scoreboard players set @s tobi_offensive_mode 0
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:1}] run scoreboard players set @s tobi_offensive_mode 1
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b,offensive_mode:2}] run scoreboard players set @s tobi_offensive_mode 2

# DEBUG: Show detection results
execute as @a[scores={tobi_offensive=1}] run title @s actionbar [{"text":"Offensive: ","color":"green"},{"score":{"name":"@s","objective":"tobi_offensive"}},{"text":" | Mode: ","color":"white"},{"score":{"name":"@s","objective":"tobi_offensive_mode"},"color":"gold"}]
