@echo off
set PATH="%JAVA11_HOME%\bin";%PATH%
goto jp

-C： 表示改变目录
--release 11：表示 JDK 11
--release N 选项之后的所有文件将被添加到 MRJAR 的 META-INF/versions/N 目录下

两个包中的公共类一定要一样
不能是 JDK8Main 和 JDK11Main

--hash-modules <regex-pattern>      
计算和记录散列, 以将打包模块绑定到与指定 <正则表达式模式> 匹配并直接或间接依赖于的模块。
散列记录在所创建的 JMOD 文件中, 或者记录在 jmod hash 命令指定的模块路径的 JMOD 文件或模块化 JAR

:jp

@echo.
@echo ----- 创建多版本 Jar -----
jar --create --verbose --file mrjars\com.jdojo.mrjar.jar -C com.jdojo.mrjar.jdk8\target\classes . --release 11 -C com.jdojo.mrjar.jdk11\target\classes .

@echo.
@echo ----- 列出条目 -----
jar --list --file mrjars\com.jdojo.mrjar.jar

@echo.
@echo ----- 更新条目 -----
jar --update --file mrjars\com.jdojo.mrjar.jar --release 11 -C com.jdojo.mrjar.jdk11\target\classes .

@echo.
@echo ----- JDK8 运行 -----
"C:\Program Files\Java\jdk1.8.0_152\bin\java" -classpath mrjars\com.jdojo.mrjar.jar com.jdojo.mrjar.Main

@echo.
@echo ----- JDK11 运行 -----
java --module-path mrjars\com.jdojo.mrjar.jar --module com.jdojo.mrjar/com.jdojo.mrjar.Main

@echo.
@echo ----- 指定打包文件 -----
jar --create --verbose --file mrjars\com.jdojo.mrjar2.jar -C com.jdojo.mrjar.jdk8\target\classes . --release 11 -C com.jdojo.mrjar.jdk11\target\classes com\jdojo\mrjar\TimeUtil.class -C com.jdojo.mrjar.jdk11\target\classes module-info.class

@echo.
@echo ----- JDK8 运行 -----
"%JAVA8_HOME%\bin\java" -classpath mrjars\com.jdojo.mrjar2.jar com.jdojo.mrjar.Main

@echo.
@echo ----- JDK11 运行（使用 JDK8 Main） -----
java --module-path mrjars\com.jdojo.mrjar2.jar --module com.jdojo.mrjar/com.jdojo.mrjar.Main

@echo.
@echo ----- 创建 JMOD -----
jmod create --class-path lib\com.jdojo.prime.jar jmods\com.jdojo.prime.jmod

@echo.
@echo ----- 提取 JMOD 文件 -----
jmod extract --dir extracted jmods\com.jdojo.prime.jmod

@echo.
@echo ----- 列出 JMOD 文件 -----
jmod list jmods\com.jdojo.prime.jmod

jmod create --class-path lib\com.jdojo.prime.faster.jar jmods\com.jdojo.prime.faster.jmod
jmod create --class-path lib\com.jdojo.prime.generic.jar jmods\com.jdojo.prime.generic.jmod
jmod create --class-path lib\com.jdojo.prime.probable.jar jmods\com.jdojo.prime.probable.jmod

@echo.
@echo ----- 记录散列 -----
jmod hash --module-path jmods --hash-modules com.jdojo.prime.? 
jmod describe jmods\com.jdojo.prime.jmod

@echo.
@echo ----- 验证散列 -----
jmod hash --dry-run --module-path jmods --hash-modules com.jdojo.prime.? 

@echo.
cmd