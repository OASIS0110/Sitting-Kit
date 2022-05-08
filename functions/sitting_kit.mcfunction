# effect clear
effect @s clear
# score_setting
scoreboard objectives add particle_time dummy "particle time"
scoreboard objectives add sitting_kit dummy "sitting kit"
scoreboard players add @s sitting_kit 0
scoreboard players add @s particle_time 0
scoreboard players add @s[scores={sitting_kit=..99}] sitting_kit 1
#Black list
execute @s[scores={sitting_kit=5..}] ~~~ detect ~~0.1~ air 0 tag @s add no_chair
execute @s[scores={sitting_kit=5..}] ~~~ detect ~~0.1~ water -1 tag @s add no_chair
execute @s[scores={sitting_kit=5..}] ~~~ detect ~~0.1~ lava -1 tag @s add no_chair
#White list
execute @s ~~~ detect ~~-0.5~ anvil -1 tag @s remove no_chair
# kill
event entity @s[tag=no_chair] instant_despawn
#stack detection
execute @e[tag=sitting_kit] ~~~ event entity @e[r=0.999,type=anywhere_sitting:sitting_kit,tag=!sitting_kit] instant_despawn
# chair particle
tag @e remove show_particle
execute @a[tag=!player_riding] ~~~ tag @e[type=anywhere_sitting:sitting_kit,r=4,scores={sitting_kit=10..}] add show_particle
scoreboard players add @s[tag=show_particle] particle_time 1
execute @s[tag=show_particle,tag=!riding,scores={particle_time=1}] ~~~ particle minecraft:balloon_gas_particle ~~~
scoreboard players set @s[scores={particle_time=5..}] particle_time 0
scoreboard players set @s[tag=!show_particle] particle_time 0
# first chair setting
execute @s[tag=!sitting_kit] ~~~ tp @s ~~-0.25~
execute @s[tag=!sitting_kit] ~~~ tp @s ~~-0.25~
tag @s add sitting_kit