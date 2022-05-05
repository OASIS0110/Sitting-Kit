# effect clear
effect @e[type=anywhere_sitting:sitting_kit] clear
# score_setting
scoreboard objectives add particle_time dummy "particle time"
scoreboard objectives add sitting_kit dummy "sitting kit"
scoreboard players add @e[type=anywhere_sitting:sitting_kit] sitting_kit 0
scoreboard players add @e[type=anywhere_sitting:sitting_kit] particle_time 0
scoreboard players add @e[type=anywhere_sitting:sitting_kit,scores={sitting_kit=..99}] sitting_kit 1
#Black list
execute @e[type=anywhere_sitting:sitting_kit,scores={sitting_kit=5..}] ~~~ detect ~~0.1~ air 0 tag @s add no_chair
execute @e[type=anywhere_sitting:sitting_kit,scores={sitting_kit=5..}] ~~~ detect ~~0.1~ water -1 tag @s add no_chair
execute @e[type=anywhere_sitting:sitting_kit,scores={sitting_kit=5..}] ~~~ detect ~~0.1~ lava -1 tag @s add no_chair
#White list
execute @e[type=anywhere_sitting:sitting_kit] ~~~ detect ~~-0.5~ anvil -1 tag @s remove no_chair
# kill
event entity @e[type=anywhere_sitting:sitting_kit,tag=no_chair] instant_despawn
#stack detection
execute @e[tag=sitting_kit] ~~~ event entity @e[r=0.999,type=anywhere_sitting:sitting_kit,tag=!sitting_kit] instant_despawn
# chair particle
tag @e remove particle_can_see
execute @a ~~~ tag @e[type=anywhere_sitting:sitting_kit,r=3,rm=0.01,scores={sitting_kit=10..}] add particle_can_see
scoreboard players add @e[tag=particle_can_see] particle_time 1
execute @e[tag=particle_can_see,scores={particle_time=20}] ~~~ particle minecraft:balloon_gas_particle ~~~
scoreboard players set @e[scores={particle_time=20..}] particle_time 0
scoreboard players set @e[tag=!particle_can_see] particle_time 0
# first chair setting
execute @e[type=anywhere_sitting:sitting_kit,tag=!sitting_kit] ~~~ tp @s ~~-0.25~
execute @e[type=anywhere_sitting:sitting_kit,tag=!sitting_kit] ~~~ tp @s ~~-0.25~
tag @e[type=anywhere_sitting:sitting_kit] add sitting_kit