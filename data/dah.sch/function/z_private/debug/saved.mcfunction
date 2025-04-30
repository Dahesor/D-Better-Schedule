tellraw @a {text:"\n[dah.sch DEBUG] ",color:"dark_aqua",extra:[{text:"Scheduled",color:"green"}," ",{nbt:"stash[0].run",storage: "dah.sch:task",color: "light_purple"}," ","Running at ",{nbt:"stash[0].on",storage: "dah.sch:task",color: "light_purple"},""]}

function dah.sch:z_private/debug/macro with storage dah.sch:task stash[0]
execute unless data storage dah.sch:task stash[0].by run tellraw @a ["",{text: " - Executor: ",color: "green"},"[Server]"]

execute store result score x dah.sch.ram run data get storage dah.sch:task stash[0].position[0]
execute store result score y dah.sch.ram run data get storage dah.sch:task stash[0].position[1]
execute store result score z dah.sch.ram run data get storage dah.sch:task stash[0].position[2]

tellraw @a ["",{text: " - Position: ",color: "green"},"Approx.(",{score: {name: "x",objective: "dah.sch.ram"}}," ",{score: {name: "y",objective: "dah.sch.ram"}}," ",{score: {name: "z",objective: "dah.sch.ram"}},")  ",{text:"View Coords",color: "aqua",underlined: true,"hover_event": {"action": "show_text","value": {nbt:"stash[0].position",storage: "dah.sch:task",color: "white"}}}]
tellraw @a ["",{text: " - Rotation: ",color: "green"},{nbt:"stash[0].rotation",storage: "dah.sch:task",color: "yellow"}]
execute if data storage dah.sch:task stash[0].in run tellraw @a ["",{text: " - Dimension: ",color: "green"},"[",{nbt:"stash[0].in",storage: "dah.sch:task",color: "yellow"},"]"]
execute unless data storage dah.sch:task stash[0].in run tellraw @a ["",{text: " - Dimension: ",color: "green"},"[overworld]"]
tellraw @a {text:"See All Data\n",color: "aqua",underlined: true,"hover_event": {"action": "show_text","value": {nbt:"stash[0]",storage: "dah.sch:task",color: "aqua"}}}