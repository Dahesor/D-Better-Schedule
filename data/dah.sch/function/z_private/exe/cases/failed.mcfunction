execute if data storage dah.sch:task this.debug run function dah.sch:z_private/debug/error
execute unless data storage dah.sch:task this.retry run return fail

execute store result score #retry dah.sch.ram run data get storage dah.sch:task this.retry
scoreboard players remove #retry dah.sch.ram 1
execute if score #retry dah.sch.ram matches ..0 run data remove storage dah.sch:task this.retry
execute if score #retry dah.sch.ram matches 1.. store result storage dah.sch:task this.retry int 1 run scoreboard players get #retry dah.sch.ram
data modify storage dah.sch:task retry append from storage dah.sch:task this

execute if data storage dah.sch:task this.debug run tellraw @a {text:"[dah.sch DEBUG] ",color:"dark_aqua",extra:[{text:"Retrying in 1 tick",color:"red"}]}