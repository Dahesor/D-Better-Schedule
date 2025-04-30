execute if entity @s[type=player] run return run data modify storage dah.sch:task this.in set from entity @s Dimension
execute at @s if predicate {condition:"location_check",predicate:{dimension:"overworld"}} run data modify storage dah.sch:task this.in set value "minecraft:overworld"
execute at @s if predicate {condition:"location_check",predicate:{dimension:"the_nether"}} run data modify storage dah.sch:task this.in set value "minecraft:the_nether"
execute at @s if predicate {condition:"location_check",predicate:{dimension:"the_end"}} run data modify storage dah.sch:task this.in set value "minecraft:the_end"
function #dah.sch:known_dimensions