package me.zhangjin.demos;

import com.jdojo.reflect.Item;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        // 这不是一个模块化项目（没有 module-info.java）
        // 通过标准的类路径加载模块（运行参数中包含 -classpath）
        // 未命名模块读取普通模块
        // 在“模块路径”中添加 com.jdojo.reflect
        // 使用 -p / --module-path 参数指定模块路径
        // 使用 -m / --module <模块>/<主类> 形式执行
        int v = Item.v;
        System.out.println("Item.v = " + v);
    }
}
