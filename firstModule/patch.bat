@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%

goto jp

-d patches\com.jdojo.intro.patch：将所有的类编译文件保存在 patches\com.jdojo.intro.patch 目录下
--module-path lib：读取 lib 目录中的模块
--patch-module com.jdojo.intro=patches\com.jdojo.intro.patch：用 patch 路径中的类替换模块中的类
:jp

rem 编译 patch
javac -d patches\com.jdojo.intro.patch src\com.jdojo.intro.patch\com\jdojo\intro\Welcome.java

rem 打 patch ，运行
java --module-path lib --patch-module com.jdojo.intro=patches\com.jdojo.intro.patch --module com.jdojo.intro/com.jdojo.intro.Welcome

@echo.

cmd