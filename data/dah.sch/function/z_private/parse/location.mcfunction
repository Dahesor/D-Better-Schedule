tp @s ~ ~ ~ ~ ~
data modify storage dah.sch:task this.position set from entity @s Pos
data modify storage dah.sch:task this.rotation set from entity @s Rotation
data modify storage dah.sch:task this.pos_x set from storage dah.sch:task this.position[0]
data modify storage dah.sch:task this.pos_y set from storage dah.sch:task this.position[1]
data modify storage dah.sch:task this.pos_z set from storage dah.sch:task this.position[2]
data modify storage dah.sch:task this.rot_x set from storage dah.sch:task this.rotation[0]
data modify storage dah.sch:task this.rot_y set from storage dah.sch:task this.rotation[1]
kill @s