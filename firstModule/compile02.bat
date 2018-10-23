@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%

goto jp

-d mods：选项告诉 Java 编译器将所有编译的类文件保存到 mods 目录下

--module-source-path src：指定 src 目录的子目录包含多个模块的源代码，其中每个子目录名称与包含源代码的子目录的模块名称相同
	在 src 目录下，必须将模块的源文件保存在子目录下，该目录必须与模块命名相同。
	Java 编译器将镜像 src 目录下的目录结构，同时将生成的类文件保存在 mods 目录中。 
	也就是说，com.jdojo.intro 模块的所有生成的类文件将保存在包层次结构的 mods\com.jdojo.intro 目录中
	如果不指定此选项，生成的类文件将直接放在 mods 目录下。

javac 命令的最后两个参数是源文件：一个是模块声明，一个 Welcome 类
	
:jp


@echo on
DEL /F /A /Q mods\*.*
javac -d mods --module-source-path src src\com.jdojo.intro\module-info.java src\com.jdojo.intro\com\jdojo\intro\Welcome.java
cmd