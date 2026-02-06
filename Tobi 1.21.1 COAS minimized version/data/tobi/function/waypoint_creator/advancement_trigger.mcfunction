# ============================================
# ADVANCEMENT TRIGGER FOR COMPASS USE
# ============================================
# Called when player uses waypoint compass

# Revoke advancement immediately so it can trigger again
advancement revoke @s only tobi:use_waypoint_compass

# Teleport!
function tobi:waypoint_creator/teleport_from_compass