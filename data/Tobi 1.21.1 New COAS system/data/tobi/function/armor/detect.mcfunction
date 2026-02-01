# First, assume player doesn't have full armor
scoreboard players set @a tobi_has_armor 0

# Simplified detection - just check if wearing golden armor with custom names
# Check helmet
execute as @a if items entity @s armor.head golden_helmet[custom_name='{"text":"Tobi\'s Mask","color":"gold","italic":false}'] run tag @s add has_helmet
execute as @a unless items entity @s armor.head golden_helmet[custom_name='{"text":"Tobi\'s Mask","color":"gold","italic":false}'] run tag @s remove has_helmet

# Check chestplate
execute as @a if items entity @s armor.chest golden_chestplate[custom_name='{"text":"Akatsuki\'s Clothes","color":"red","italic":false}'] run tag @s add has_chest
execute as @a unless items entity @s armor.chest golden_chestplate[custom_name='{"text":"Akatsuki\'s Clothes","color":"red","italic":false}'] run tag @s remove has_chest

# Check leggings
execute as @a if items entity @s armor.legs golden_leggings[custom_name='{"text":"Akatsuki\'s Cloak","color":"red","italic":false}'] run tag @s add has_legs
execute as @a unless items entity @s armor.legs golden_leggings[custom_name='{"text":"Akatsuki\'s Cloak","color":"red","italic":false}'] run tag @s remove has_legs

# Check boots
execute as @a if items entity @s armor.feet golden_boots[custom_name='{"text":"Akatsuki\'s Sandals","color":"red","italic":false}'] run tag @s add has_boots
execute as @a unless items entity @s armor.feet golden_boots[custom_name='{"text":"Akatsuki\'s Sandals","color":"red","italic":false}'] run tag @s remove has_boots

# If player has all 4 tags, set armor score to 1
execute as @a[tag=has_helmet,tag=has_chest,tag=has_legs,tag=has_boots] run scoreboard players set @s tobi_has_armor 1

# Feedback when armor is equipped
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_armor_notified] run tellraw @s {"text":"[Tobi] Full armor detected! Abilities unlocked.","color":"gold","bold":true}
execute as @a[scores={tobi_has_armor=1}] unless entity @s[tag=tobi_armor_notified] run tag @s add tobi_armor_notified

# Remove tag when armor is removed
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_armor_notified] run tellraw @s {"text":"[Tobi] Armor removed. Abilities locked.","color":"red"}
execute as @a[scores={tobi_has_armor=0}] if entity @s[tag=tobi_armor_notified] run tag @s remove tobi_armor_notified