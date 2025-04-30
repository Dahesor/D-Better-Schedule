tellraw @a {"text":"\n[dah.sch DEBUG] ","color":"dark_aqua","extra":[{"text":"Scheduled","color":"green"}," ",{"nbt":"this.run","storage": "dah.sch:task","color": "light_purple"}," ","Running at ",{"nbt":"this.on","storage": "dah.sch:task","color": "light_purple"},"(Game tick or Player Timer)"]}

function dah.sch:z_private/debug/for_player/macro with storage dah.sch:task this
execute unless data storage dah.sch:task this.by run tellraw @a ["",{"text": " - Executor: ","color": "green"},"[Server]"]

execute store result score x dah.sch.ram run data get storage dah.sch:task this.position[0]
execute store result score y dah.sch.ram run data get storage dah.sch:task this.position[1]
execute store result score z dah.sch.ram run data get storage dah.sch:task this.position[2]

tellraw @a ["",{"text": " - Position: ","color": "green"},"Approx.(",{"score": {"name": "x","objective": "dah.sch.ram"}}," ",{"score": {"name": "y","objective": "dah.sch.ram"}}," ",{"score": {"name": "z","objective": "dah.sch.ram"}},")  ",{"text":"View Coords","color": "aqua","underlined": true,"hover_event": {"action": "show_text","value": {"nbt":"this.position","storage": "dah.sch:task","color": "white"}}}]
tellraw @a ["",{"text": " - Rotation: ","color": "green"},{"nbt":"this.rotation","storage": "dah.sch:task","color": "yellow"}]
execute if data storage dah.sch:task this.in run tellraw @a ["",{"text": " - Dimension: ","color": "green"},"[",{"nbt":"this.in","storage": "dah.sch:task","color": "yellow"},"]"]
execute unless data storage dah.sch:task this.in run tellraw @a ["",{"text": " - Dimension: ","color": "green"},"[overworld]"]
tellraw @a {"text":"See All Data\n","color": "aqua","underlined": true,"hover_event": {"action": "show_text","value": {"nbt":"this","storage": "dah.sch:task","color": "aqua"}}}