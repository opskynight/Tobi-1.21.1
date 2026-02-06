# ============================================
# MANUAL TOKEN CREATION TEST
# ============================================
# Forces token creation to test if the give command works

tellraw @a {"text":"[TEST] Forcing token creation...","color":"yellow"}

# Store test data
data modify storage tobi:temp token_x set value 100
data modify storage tobi:temp token_y set value 64
data modify storage tobi:temp token_z set value -200
data modify storage tobi:temp token_dim set value "minecraft:overworld"

# Try to give compass directly (no macro)
give @a compass[custom_name='{"text":"TEST Waypoint","color":"light_purple"}',custom_data={waypoint_token:1b}] 1

tellraw @a {"text":"[TEST] If you got a compass, the give command works!","color":"green"}
tellraw @a {"text":"[TEST] If not, there's an issue with the command itself.","color":"red"}
