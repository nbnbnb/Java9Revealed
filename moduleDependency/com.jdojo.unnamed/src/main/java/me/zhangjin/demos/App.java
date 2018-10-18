package me.zhangjin.demos;

import com.jdojo.reflect.Item;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        // 这不是一个模块化项目（没有 module-info.java）
        // 未命名模块读取普通模块
        // 在“模块路径”中添加 com.jdojo.reflect
        int v = Item.v;
        System.out.println("Item.v = " + v);
    }
}
