@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%

goto jp

打包模块代码

--create 选项表示要创建一个新的模块化JAR。

--file 选项用于指定新的模块化JAR的位置和名称。
将新的模块化JAR保存在lib目录中，其名称将为com.jdojo.intro-1.0.jar。
将模块化JAR的版本指定为1.0。

--main-class 选项指定public static void main(String[])方法作为应用程序入口。
当您指定此选项时，jar工具将在module-info.class文件中添加一个属性，其值是指定类的名称。 
jar工具还使用此选项将Main-Class属性添加到MANIFEST.MF文件中。

--module-version 
选项将模块的版本指定为1.0。 
jar工具将把这些信息记录在module-info.class文件的属性中。
请注意，将模块版本指定为1.0不会影响模块化JAR的名称。
包含1.0以指示其文件名的版本。该模块的实际版本由此选项指定。
选项用于指定执行jar命令时将用作设置当前目录。
将mods\com.jdojo.intro目录指定为jar工具的当前目录。
这将使jar工具从该目录中读取所有要包含在模块化JAR中的文件。

命令的最后一部分是一个点（.），这意味着jar工具需要包括当前目录mods\com.jdojo.intro下所有文件和目录。
请注意，这个参数和-C选项一起使用。
如果不提供-C选项，则该点将被解释为C:\Java9Revealed目录，因为该目录是当前命令行运行的目录。

--module-path lib：该命令将模块路径指定为lib目录，这意味着lib目录将用于搜索应用程序模块
--list-modules：该选项将打印模块描述以及模块的位置
--module：选项指定要与其主类一起运行的模块。 如果您的模块化JAR包含主属性，则需要指定部分，并且将从模块化JAR读取。



:jp

jar --create --file lib/com.jdojo.intro-1.0.jar --main-class com.jdojo.intro.Welcome --module-version 1.0 -C mods/com.jdojo.intro .

java --module-path lib --list-modules com.jdojo.intro
 
java --module-path lib --module com.jdojo.intro/com.jdojo.intro.Welcome

rem 如果在模块代码打包到模块化JAR中时指定主类，则可以从命令中省略主类名称
java --module-path lib --module com.jdojo.intro

rem 还可以指定包含模块代码的目录作为模块路径。 已将模块代码编译到mods目录中
java --module-path mods --module com.jdojo.intro/com.jdojo.intro.Welcome

rem JDK还提供了-jar选项来从JAR文件运行主类（看来只有输出中的第一行是正确的，第二行是不正确的） 
rem Module Name: null
java -jar lib\com.jdojo.intro-1.0.jar 

rem 还可以使用--class-path选项的java命令来运行Welcome类（Welcome类将被加载到应用程序类加载器的未命名模块中。 就像在JDK 9之前运行类一样）
rem Module Name: null
java --class-path lib\com.jdojo.intro-1.0.jar com.jdojo.intro.Welcome
cmd