@echo off
set PATH="C:\Program Files\Java\jdk-11+28\bin";%PATH%
@rem 普通模块读取 “类路径”中的 “未命名模块”
java --module-path target\classes --class-path D:\JavaLibs\com.jdojo.reflect-0.0.1-SNAPSHOT.jar --module com.jdojo.unnamed.test/com.jdojo.unnamed.test.UnnamedTestMain
pause