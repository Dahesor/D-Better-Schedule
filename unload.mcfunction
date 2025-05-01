#This function file is used to unload the datapack
#It will remove all the scoreboard objectives and storage data
#Because of how this library is implemented, it is not possible to unload the datapack while it is enabled
#Thus, first remove the datapack, then you may execute the following lines through any means

scoreboard objectives remove dah.sch.player
scoreboard objectives remove dah.sch.ram
scoreboard objectives remove dah.sch.UID
data remove storage dah.sch:new new
data remove storage dah.sch:task save
data remove storage dah.sch:task player

#The following lines are from the gu library, which is bundled with this library
#If you are using the gu library in other datapacks, do not execute them.

scoreboard objectives remove gu.main
scoreboard objectives remove gu.uuid.0
scoreboard objectives remove gu.uuid.1
scoreboard objectives remove gu.uuid.2
scoreboard objectives remove gu.uuid.3
data remove storage gu:main in
data remove storage gu:main out

#After executing these lines, you may also delete the command_storage_dah.sch.dat file in the WORLD_NAME/data folder.
#Same goes for the command_storage_gu.dat file, but only if you are not using the gu library in other datapacks.