# ============================================
# WAYPOINT CREATOR DEBUG
# ============================================
# Run this to test the system: /function tobi:waypoint_creator/debug

# Check if you have the item
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{waypoint_creator:1b}] run tellraw @s {"text":"✓ You have Waypoint Creator in mainhand","color":"green"}
execute unless items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{waypoint_creator:1b}] run tellraw @s {"text":"✗ No Waypoint Creator in mainhand","color":"red"}

# Check scoreboard
execute if score @s tobi_used_coas matches 1.. run tellraw @s [{"text":"✓ Right-click detected! Score: ","color":"green"},{"score":{"name":"@s","objective":"tobi_used_coas"},"color":"gold"}]
execute unless score @s tobi_used_coas matches 1.. run tellraw @s {"text":"✗ No right-click detected (score is 0)","color":"red"}

# Check if scoreboard exists
execute unless score @s tobi_used_coas = @s tobi_used_coas run tellraw @s {"text":"⚠ WARNING: tobi_used_coas scoreboard doesn't exist!","color":"yellow"}

# Show current storage
tellraw @s {"text":"========================================","color":"gold"}
tellraw @s {"text":"Storage Check:","color":"aqua","bold":true}
tellraw @s [{"text":"token_x: ","color":"yellow"},{"nbt":"token_x","storage":"tobi:temp"}]
tellraw @s [{"text":"token_y: ","color":"yellow"},{"nbt":"token_y","storage":"tobi:temp"}]
tellraw @s [{"text":"token_z: ","color":"yellow"},{"nbt":"token_z","storage":"tobi:temp"}]
tellraw @s [{"text":"token_dim: ","color":"yellow"},{"nbt":"token_dim","storage":"tobi:temp"}]
tellraw @s {"text":"========================================","color":"gold"}

# Manual test - force create token
tellraw @s {"text":"Running manual token creation in 3 seconds...","color":"green"}
schedule function tobi:waypoint_creator/test_manual_create 60t
