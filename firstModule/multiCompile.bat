@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%

goto jp

如果要编译多个模块，则需要将每个源文件指定为 javac 命令的参数。 
这里提供一个 Windows 和 UNIX 的快捷命令来一次性编译所有的模块。 
在 Windows 中的一行中使用以下命令：

Windows
	FOR /F "tokens=1 delims=" %A in ('dir src\*.java /S /B') do javac -d mods --module-source-path src %A
Unix
	javac -d mods --module-source-path src $(find src -name "*.java")

该命令循环遍历 src 目录下的所有 ".java" 文件，并一次编译一个 Java 文件。
如果将命令保存在批处理文件中并运行批处理文件来编译所有源文件，则需要将 ％A 替换为 %%A

:jp


@echo on
DEL /F /A /Q mods\*.*
FOR /F "tokens=1 delims=" %%A in ('dir src\*.java /S /B') do javac -d mods --module-source-path src %%A
cmd