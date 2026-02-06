# ============================================
# KAMUI TRAVEL - DEACTIVATE
# ============================================
# Return to survival mode after stillness detected

# Switch back to survival
gamemode survival @s

# Reset scores
scoreboard players set @s tobi_kamui_active 0
scoreboard players set @s tobi_kamui_stillness 0
scoreboard players set @s tobi_kamui_charge 0

# Messages and effects
tellraw @s {"text":"[Kamui Travel] Returned to survival mode.","color":"green","bold":true}
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 2
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 0.5 0.5 1 50 force