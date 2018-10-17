@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%

goto jp

使用 JDK 9 之前存在的样式来编译 com.jdojo.intro 模块的源代码。
它仅使用 -d 选项，该选项指定放置编译的类文件的位置
第二个命令的输出与上一个命令的输出是相同的。 
但是，如果要在一个命令中编译多个模块的源代码，并将编译的代码放在特定于模块的目录中，则不起作用。	

使用 javac 的 --module-version 选项，可以指定正在编译的模块的版本。 
模块版本保存在 module-info.class 文件中

使用 javap 命令会在模块名称之后打印模块的定义，其中包含模块的版本（如果存在）。 
如果模块版本存在，则打印的模块名称的格式为 moduleName@moduleVersion

在 JDK 9 中增强了 jar 工具。它允许在创建模块化 JAR 时指定模块版本。

:jp


@echo on
DEL /F /A /Q mods\*.*
javac -d mods\com.jdojo.intro --module-version 1.0 src\com.jdojo.intro\module-info.java src\com.jdojo.intro\com\jdojo\intro\Welcome.java
javap mods\com.jdojo.intro\module-info.class
cmd