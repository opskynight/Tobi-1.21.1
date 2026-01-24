# Kamui Spiral Animation - Initialization
# Run this once on world load

scoreboard objectives add kamui.state dummy "Kamui Animation State"
scoreboard objectives add kamui.frame dummy "Kamui Current Frame"
scoreboard objectives add kamui.timer dummy "Kamui Animation Timer"

tellraw @a {"text":"[Kamui] Animation system initialized","color":"dark_purple"}