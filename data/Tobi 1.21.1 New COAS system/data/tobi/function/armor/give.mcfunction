# Give Tobi armor to the player who runs this command
# Usage: /function tobi:armor/give

give @s golden_helmet[unbreakable={},custom_name='{"text":"Tobi\'s Mask","color":"gold","italic":false}',lore=['{"text":"Only for Tobi!","color":"gray","italic":false}'],enchantments={levels:{"minecraft:protection":2,"minecraft:fire_protection":2,"minecraft:blast_protection":2,"minecraft:aqua_affinity":1,"minecraft:respiration":3}}] 1

give @s golden_chestplate[unbreakable={},custom_name='{"text":"Akatsuki\'s Clothes","color":"red","italic":false}',lore=['{"text":"Only for Akatsuki member.","color":"gray","italic":false}'],enchantments={levels:{"minecraft:protection":2,"minecraft:fire_protection":2,"minecraft:blast_protection":2}}] 1

give @s golden_leggings[unbreakable={},custom_name='{"text":"Akatsuki\'s Cloak","color":"red","italic":false}',lore=['{"text":"Only for Akatsuki member.","color":"gray","italic":false}'],enchantments={levels:{"minecraft:protection":2,"minecraft:fire_protection":2,"minecraft:blast_protection":2}}] 1

give @s golden_boots[unbreakable={},custom_name='{"text":"Akatsuki\'s Sandals","color":"red","italic":false}',lore=['{"text":"Only for Akatsuki member.","color":"gray","italic":false}'],enchantments={levels:{"minecraft:protection":2,"minecraft:fire_protection":2,"minecraft:blast_protection":2,"minecraft:feather_falling":4,"minecraft:depth_strider":3}}] 1

tellraw @s {"text":"[Tobi] You have received the complete Tobi armor set!","color":"gold","bold":true}