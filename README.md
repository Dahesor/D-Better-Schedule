需要版本1.20.2或更高

简洁版：

这样来计划执行一条命令：
/function dah.sch:set {time:延迟,run:"命令"}

time后面接多少游戏刻以后执行命令。run是要执行的命令。比如：
/function dah.sch:set {time:20,run:"say 1"}
20刻（1秒）后执行say 1。

和原版的/schedule不同，命令执行时会保留原有的执行者，执行地点，与执行朝向。而且可以执行任何命令，不止函数。
注意这不会保存执行维度。命令总是在主世界执行。然而下面的进阶版允许你定义维度。
注意，如果命令执行时执行者不存在（比如已经死亡），则不会执行命令。
若/function dah.sch:set是由服务器执行的，那么延迟后的命令也由服务器执行。


看到这里你就已经可以用本数据包了。后面都是进阶内容，如debug等。


进阶版：
/function dah.sch:set {time:100,run:"say 1"}只能输入执行延迟与执行命令。
然而，使用/function #dah.sch:set可以填入更多参数。注意多了个井号。这是一个列表。
这样使用时，多余的参数都应该放入extra内。

 - as  本参数允许你指定一个或多个执行者来执行命令。这会覆盖原有的执行者：
/function #dah.sch:set {time:100,run:"say 1",extra:{as:"@e"}}
5秒后使得所有实体都执行say 1

 - in  本参数可以指定一个维度。命令会在该维度内执行：
/function #dah.sch:set {time:20,run:"summon zombie ~ ~ ~",extra:{in:"the_nether"}}
1秒后在下界当前位置召唤僵尸

 - at_time  本参数可以指定一个确定执行时间。如指定为1400时就会在第1400游戏刻执行（而非常规的，1400游戏刻以后执行）。你可以使用/time query gametime 查寻当前时间：
/function #dah.sch:set {time:20,run:"say 1",extra:{at_time:100000}}
游戏总共经历至少100000刻后执行say 1。注意虽然time已经用不上了，但是还要加上以免宏出现错误

 - flags    这是一个列表。在里面加入特定的项目可以更改计划执行的选项。
	        可用的flags有：
			"no_entity": 如果存在，则命令由服务器执行，而不由运行了#dah.sch:set的实体或as指定的实体运行。执行地点等不受影响。
			"force_run": 如果存在，若命令执行时执行者不存在，则会由服务器执行本命令。
			"debug"：如果存在，本次计划执行在创建任务，尝试执行命令前，以及执行后都会向聊天框输出结果。会显示执行者，执行位置，是否成功等。
例如：
/function #dah.sch:set {time:100,run:"say 1",extra:{flags:["debug","force_run"]}}
这里加入了两个flag，也就是debug与force_run。
或：
/function #dah.sch:set {time:100,run:"say 1",extra:{flags:["no_entity"]}}
加入了no_entity。本命令由服务器执行。

不同参数之间可以混用

函数function dah.sch:get_time用于获取当前时间。你可以更改本函数来自定义”时间“为由你自己控制的分数来实现其他功能。

命令里暂时不能直接包含单引号，会导致宏异常。不过你可以将它转义两次。以下两个命令都是合法的：

dah.sch:set {time:5,run:"say 单引号\\'单引号 "}

dah.sch:set {time:5,run:'say 单引号\\\'单引号 '}