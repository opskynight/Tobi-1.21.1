# ============================================
# DO TELEPORT (MACRO)
# ============================================
# Teleports player to stored coordinates
# Called with: function tobi:waypoint_creator/do_teleport with storage tobi:temp compass_data

$execute in $(token_dim) run tp @s $(token_x) $(token_y) $(token_z)
