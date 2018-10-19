package com.jdojo.unnamed.test;

import java.lang.reflect.Field;

public class UnnamedTestMain {
    public static void main(String[] args) throws Exception {

        // 这是一个 模块化 项目
        // 引用“标准类路径”中的 jar 包

        // 设置 JVM 参数，应用类路径文件
        // --class-path D:\JavaLibs\com.jdojo.reflect-0.0.1-SNAPSHOT.jar

        Class<?> cls = Class.forName("com.jdojo.reflect.Item");
        Field[] fields = cls.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            System.out.println(field.getName() + " = " +
                    field.get(null));
        }
    }
}
