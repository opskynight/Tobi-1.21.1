# ============================================
# ALTERNATIVE WAYPOINT CREATOR DETECTION
# ============================================
# This bypasses the normal detection and uses a different method
# Replace detect_creator.mcfunction with this if the original doesn't work

# Method 1: Check for any COAS right-click while holding creator
execute as @a if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{waypoint_creator:1b}] store result score @s tobi_temp_x run clear @s carrot_on_a_stick[custom_data~{waypoint_creator:1b}] 0
execute as @a[scores={tobi_temp_x=1..}] if score @s tobi_used_coas matches 1.. run function tobi:waypoint_creator/create_token

# Alternative Method 2: Use advancement trigger
# (Would need to create an advancement for this)

# Alternative Method 3: Detect by checking if player used ANY carrot_on_a_stick
execute as @a[scores={tobi_used_coas=1..}] if items entity @s weapon.mainhand carrot_on_a_stick run tellraw @s {"text":"[ALT] You used a COAS!","color":"yellow"}
execute as @a[scores={tobi_used_coas=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{waypoint_creator:1b}] run tellraw @s {"text":"[ALT] It's the Waypoint Creator!","color":"green"}
execute as @a[scores={tobi_used_coas=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{waypoint_creator:1b}] run function tobi:waypoint_creator/create_token

# Reset
scoreboard players set @a tobi_used_coas 0
