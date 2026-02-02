# ============================================
# SAFETY CHECK - RESTORE VOID MODE TAG
# ============================================
# If player is in kamui:void dimension but doesn't have in_void_mode tag,
# restore it. This prevents players from getting stuck.

# Check all players in kamui:void dimension
execute as @a[tag=!in_void_mode] in kamui:void if entity @s[distance=0..] run tag @s add in_void_mode
execute as @a[tag=!in_void_mode] in kamui:void if entity @s[distance=0..] run tellraw @s {"text":"[DEBUG] Restored in_void_mode tag","color":"yellow"}

# Also check if player has dimensional mode 1 but wrong COAS variant
execute as @a[tag=in_void_mode,scores={tobi_dimensional=1,tobi_dimensional_mode=1}] if items entity @s weapon.* carrot_on_a_stick[custom_name='{"text":"Kamui Dimension","color":"dark_purple","bold":true,"italic":false}'] run function tobi:dimensional/kamui_dimension/fix_coas_in_void

# Remove tag if player is NOT in void (they somehow escaped)
execute as @a[tag=in_void_mode] unless dimension kamui:void run tag @s remove in_void_mode
execute as @a[tag=in_void_mode] unless dimension kamui:void run tellraw @s {"text":"[DEBUG] Removed in_void_mode tag (not in void)","color":"yellow"}
