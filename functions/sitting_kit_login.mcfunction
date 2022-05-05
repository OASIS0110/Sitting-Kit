# login message
scoreboard objectives add sit_kit_login dummy "sitting kit login"
scoreboard players add @a sit_kit_login 0
scoreboard players add @a[scores={sit_kit_login=..299}] sit_kit_login 1
tellraw @a[scores={sit_kit_login=125}] {"rawtext":[{"text":"---§e<§6<§fSitting Kit§6>§e>§fが導入されました---\nどこでも休憩できるキット、\n§6Sitting Kit§fが使えるようになりました。\nCreated by §bOASIS\n§f--------------------"}]}