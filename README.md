# 简介

欢迎使用Dahesor's Better Schedule。这是一个原本自用的前置库。它提供了一个会记录执行环境的schedule。
支持1.20.2以上（即加入了宏函数后）的任意版本。

## 使用说明

格式：
```
/function dah.sch:set {time:延迟,run:"命令"}
```
time后面接多少游戏刻以后执行命令。run是要执行的命令。比如下例子中会在20刻（1秒）后执行say 1：
```
/function dah.sch:set {time:20,run:"say 1"}
```

和原版的/schedule不同，命令执行时会保留原有的**执行者**，**执行地点**，**与执行朝向**。
且可以执行任何命令，不止函数。
注意这**不会保存执行维度**。命令总是在**主世界执行**。然而下面的进阶版允许你定义维度。
注意，如果命令执行时**执行者不存在（比如已经死亡或下线），则不会执行命令。**
若`/function dah.sch:set`是由服务器执行的，那么延迟后的命令也由服务器执行。

看到这里你就已经可以用本数据包了。后面都是进阶内容，如debug等。

### 更多参数


`/function dah.sch:set {time:100,run:"say 1"}`只能输入执行延迟与执行命令。
然而，使用`/function #dah.sch:set`可以填入更多参数。注意多了个`#`。这是一个**标签**。
这样使用时，多余的参数都应该放入extra内。

 - `as`  本参数允许你指定一个或多个执行者来执行命令。这会覆盖原有的执行者。下例中5秒后使得所有实体都执行say 1：
```
/function #dah.sch:set {time:100,run:"say 1",extra:{as:"@e"}}
```
注意是5秒后的@e而非当前的。

 - `in` 本参数可以指定一个维度。命令会在该维度内执行：
```
/function #dah.sch:set {time:20,run:"summon zombie ~ ~ ~",extra:{in:"the_nether"}}
```
1秒后在下界当前位置召唤僵尸

 - `at_time`本参数可以指定一个确定执行时间。如指定为1400时就会在第1400游戏刻执行（而非常规的，1400游戏刻以后执行）。你可以使用/time query gametime 查寻当前时间：
```
/function #dah.sch:set {time:20,run:"say 1",extra:{at_time:100000}}
```
游戏总共经历至少100000刻后执行say 1。注意虽然time已经用不上了，但是还要加上以免宏出现错误

 - `flags`这是一个列表。在里面加入特定的项目可以更改计划执行的选项。可用的flags有：
 	- `no_executer`: 如果存在，则命令由服务器执行，而不由运行了`#dah.sch:set`的实体或`as`指定的实体运行。执行地点等不受影响。
 	- `force_run`: 如果存在，若命令执行时执行者不存在，则会由服务器执行本命令。
 	- `debug`：如果存在，本次计划执行在创建任务，尝试执行命令前，以及执行后都会向聊天框输出结果。会显示执行者，执行位置，是否成功等。
例：
```
/function #dah.sch:set {time:100,run:"say 1",extra:{flags:["debug","force_run"]}}
```
这里加入了两个flag，也就是`debug`与`force_run`。
或：
```
/function #dah.sch:set {time:100,run:"say 1",extra:{flags:["no_executer"]}}
```
加入了`no_executer`。本命令由服务器执行。

不同参数之间可以混用

### 杂项

函数`function dah.sch:get_time`用于获取当前时间。你可以更改本函数来自定义“时间”为由你自己控制的分数来实现其他功能。

命令里不能直接包含单引号，会导致宏异常。不过你可以将它转义两次。以下两个命令都是合法的：
```
dah.sch:set {time:5,run:"say 单引号\\'单引号"}
dah.sch:set {time:5,run:'say 单引号\\\'单引号'}
```

## 依赖库文件

库中包含一个`dependency.zip`。将改文件放置于电脑的任何位置，你就可以通过在自己根目录中创建一个`spyglass.json`文件来获取本前置库提供的，所有函数，NBT，记分板，与标签的补全信息（告别黄条）：

1. 将前置文件放置于电脑某处
2. 在数据包的根目录新建文件spyglass.json，内容如下：
```
{
	"env": {
		"dependencies": [
			"file:///C:/path/to/dependency.zip",
			"@vanilla-mcdoc"
		],
		"gameVersion": "1.21.4"
	}
}
```
修改路径以指向dependency.zip，修改`gameVersion`以匹配你的版本，刷新VS Code即可。
若补全突然出错，尝试使VS Code执行`Spyglass: Reset Project Cahce`命令。

# 其他

存货+1。
数据包中内置了[gu](https://github.com/gibbsly/gu)前置来管理玩家的UUID。
