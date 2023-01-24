#Scoreboard
scoreboard objectives add SittingKit dummy
scoreboard objectives add sit_kit_login dummy "sitting kit login"
#login message
scoreboard players add @a sit_kit_login 0
scoreboard players add @a[scores={sit_kit_login=..299}] sit_kit_login 1
tellraw @a[scores={sit_kit_login=125}] {"rawtext":[{"text":"---§e<§6<§fSitting Kit§6>§e>§fが導入されました---\nどこでも休憩できるキット、\n§6Sitting Kit§fが使えるようになりました。\nCreated by §bOASIS\n§f--------------------"}]}

#Sitting Kitが置けるか確認
scoreboard players add @e[type=sitting_kit:sitting_kit] SittingKit 0
scoreboard players add @e[type=sitting_kit:sitting_kit,scores={SittingKit=..99}] SittingKit 1

#BlackList
execute as @e[type=sitting_kit:sitting_kit] if score @s SittingKit matches 5.. at @s if block ~ ~0.1 ~ air run tag @s add ChairKill
execute as @e[type=sitting_kit:sitting_kit] if score @s SittingKit matches 5.. at @s if block ~ ~0.1 ~ water run tag @s add ChairKill
execute as @e[type=sitting_kit:sitting_kit] if score @s SittingKit matches 5.. at @s if block ~ ~0.1 ~ lava run tag @s add ChairKill

#Wite List
execute as @e[type=sitting_kit:sitting_kit] if score @s SittingKit matches 5.. at @s if block ~ ~-1 ~ anvil run tag @s remove ChairKill

#同じところにSitting Kitがあったらinstant despawn
execute as @e[type=sitting_kit:sitting_kit] at @s if score @s SittingKit matches 5 if entity @e[r=0.1,type=sitting_kit:sitting_kit,scores={SittingKit=6..}] run event entity @s instant_despawn

#Kill
event entity @e[tag=ChairKill] instant_despawn

#Particle
#プレイヤーの半径10ブロック以内にいるsitting kitにコマンドを実行
#(sitting kitに一度に二回以上コマンドを実行させないようにする)
tag @e[type=sitting_kit:sitting_kit] remove ShowParticle
execute as @a at @s run tag @e[type=sitting_kit:sitting_kit,scores={SittingKit=10..},r=4] add ShowParticle
execute as @a at @s positioned ~ ~0.575 ~ run tag @e[type=sitting_kit:sitting_kit,scores={SittingKit=10..},r=0.01] remove ShowParticle
execute as @e[tag=ShowParticle] at @s run particle minecraft:balloon_gas_particle ~ ~ ~

#First Time Chair Moving (最初少し下にSitting KitをTP)
execute as @e[type=sitting_kit:sitting_kit,tag=!SittingKit] at @s run tp @s ~ ~-0.25 ~
tag @e[type=sitting_kit:sitting_kit,tag=!SittingKit] add SittingKit

tag @a remove NowGamemode_c
tag @a[m=c] add NowGamemode_c