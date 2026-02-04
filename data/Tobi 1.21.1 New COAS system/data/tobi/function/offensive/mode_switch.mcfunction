# ============================================
# OFFENSIVE MODE SWITCHING
# ============================================
# Detects when player swaps Offensive COAS to offhand
# Cycles through: Short (0) → Long (1) → Return (2) → Travel (3) → Short (0)

# ============================================
# BLOCK: Do NOT allow cycling while inside Kamui Travel (spectator)
# Clearing + re-giving the stick in spectator breaks everything.
# ============================================
execute as @a[scores={tobi_kamui_active=1}] run title @s actionbar {"text":"◉ Cannot switch modes while in Kamui Travel ◉","color":"red","bold":true}

# Check if player just swapped the Offensive COAS to offhand
# Added: unless score tobi_kamui_active matches 1
execute as @a[scores={tobi_offensive=1}] unless score @s tobi_kamui_active matches 1 if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{tobi_offensive:1b}] unless score @s tobi_offhand_swap matches 1 run function tobi:offensive/cycle_mode

# Reset swap detection after processing
scoreboard players set @a[scores={tobi_offhand_swap=1}] tobi_offhand_swap 0
