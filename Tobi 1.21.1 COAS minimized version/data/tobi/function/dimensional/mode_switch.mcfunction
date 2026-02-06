# ============================================
# DIMENSIONAL MODE SWITCHING
# ============================================
# Detects when player swaps Dimensional COAS to offhand
# Cycles through: Travel (0) → Dimension (1) → Genjutsu (2) → Travel (0)

# Check if player just swapped the Dimensional COAS to offhand
execute as @a[scores={tobi_dimensional=1}] if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_dimensional:1b}] unless score @s tobi_offhand_swap matches 1 run function tobi:dimensional/cycle_mode

# Reset swap detection after processing
scoreboard players set @a[scores={tobi_offhand_swap=1}] tobi_offhand_swap 0