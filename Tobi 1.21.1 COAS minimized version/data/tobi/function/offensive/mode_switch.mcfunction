# ============================================
# OFFENSIVE MODE SWITCHING
# ============================================
# Detects when player swaps Offensive COAS to offhand
# Cycles through: Short (0) → Long (1) → Return (2) → Short (0)

# Detect carrot use (F key to swap to offhand)
# This increments when player uses a carrot_on_a_stick
scoreboard players add @a tobi_carrot_use 0

# Check if player just swapped the Offensive COAS to offhand
execute as @a[scores={tobi_offensive=1}] if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] unless score @s tobi_offhand_swap matches 1 run function tobi:offensive/cycle_mode

# Reset swap detection after processing
scoreboard players set @a[scores={tobi_offhand_swap=1}] tobi_offhand_swap 0
