# ============================================
# GIVE COMPASS TOKEN (MACRO)
# ============================================
# Gives compass with stored coordinates in NBT
# Called with: function tobi:waypoint_creator/give_compass_token with storage tobi:temp

$give @s compass[custom_name='{"text":"Waypoint: $(token_dim)","color":"light_purple","bold":true,"italic":false}',lore=['{"text":"Teleport Token","color":"gray","italic":false}','{"text":"","color":"white"}','{"text":"Location: $(token_dim)","color":"aqua","italic":false}','{"text":"X: $(token_x)","color":"yellow","italic":false}','{"text":"Y: $(token_y)","color":"yellow","italic":false}','{"text":"Z: $(token_z)","color":"yellow","italic":false}','{"text":"","color":"white"}','{"text":"SNEAK + RIGHT CLICK: Teleport","color":"green","bold":true,"italic":false}'],custom_data={waypoint_token:1b,token_x:$(token_x)d,token_y:$(token_y)d,token_z:$(token_z)d,token_dim:"$(token_dim)"},max_stack_size=1] 1
