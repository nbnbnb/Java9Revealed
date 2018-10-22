@echo off
set PATH="%JAVA11_HOME%\bin";%PATH%

goto jp

使用--launcher选项与jlink命令。 
指定了命令名称runprimechecker，模块名称为com.jdojo.prime.client。--launcher选项使jlink在bin目录中的Windows上创建一个平台特定的可执行文件，例如runprimechecker.bat文件。 
可以使用此可执行文件来运行你的应用程序。 
文件内容只是在这个模块中运行主类的包装器。 
可以使用此文件来运行应用程序

使用--bind-services选项创建运行时映像时自动绑定服务。 
这一次，需要将模块（即com.jdojo.prime模块）添加到模块图中，并且jlink工具将负责其余部分。
com.jdojo.prime.client模块读取com.jdojo.prime模块，因此将前者添加到模块图中也将解决后者

以下命令使用compress和strip-debug插件。 
压缩插件将压缩映像，这将得到较小的映像
这里使用压缩级别2来进行最大压缩。

strip-debug插件从Java代码中删除调试信息，从而进一步减小映像的大小 


:jp


@echo on

jlink --module-path jmods --add-modules com.jdojo.prime.client,com.jdojo.prime.generic,com.jdojo.prime.faster --launcher runprimechecker=com.jdojo.prime.client/com.jdojo.prime.client.Main --output d:\primechecker

jlink --module-path jmods --add-modules com.jdojo.prime.client --launcher runprimechecker=com.jdojo.prime.client/com.jdojo.prime.client.Main --bind-services --output d:\primecheckerservice

jlink --module-path jmods --compress 2 --strip-debug --add-modules com.jdojo.prime.client,com.jdojo.prime.generic,com.jdojo.prime.faster --launcher runprimechecker=com.jdojo.prime.client/com.jdojo.prime.client.Main --output d:\primechecker-min

cmd