# Kamui Animation Tick

# Rotate spinner armor stands
function tobi:kamui/spinner/rotate

# Teleport spinners to follow players
function tobi:kamui/spinner/teleport

# Run deploying animation
execute as @a[scores={kamui.state=1}] run function tobi:kamui/states/deploying

# Run withdrawing animation
execute as @a[scores={kamui.state=3}] run function tobi:kamui/states/withdrawing

# Render current frame for all active animations
execute as @a[scores={kamui.state=1..3}] run function tobi:kamui/frames/render

# Cleanup armor stands when animation is done
function tobi:kamui/spinner/cleanup