@echo off
set PATH="%JAVA11_HOME%\bin";%PATH%
goto jp

-C�� ��ʾ�ı�Ŀ¼
--release 11����ʾ JDK 11
--release N ѡ��֮��������ļ�������ӵ� MRJAR �� META-INF/versions/N Ŀ¼��

�������еĹ�����һ��Ҫһ��
������ JDK8Main �� JDK11Main

--hash-modules <regex-pattern>      
����ͼ�¼ɢ��, �Խ����ģ��󶨵���ָ�� <������ʽģʽ> ƥ�䲢ֱ�ӻ��������ڵ�ģ�顣
ɢ�м�¼���������� JMOD �ļ���, ���߼�¼�� jmod hash ����ָ����ģ��·���� JMOD �ļ���ģ�黯 JAR

:jp

@echo.
@echo ----- ������汾 Jar -----
jar --create --verbose --file mrjars\com.jdojo.mrjar.jar -C com.jdojo.mrjar.jdk8\target\classes . --release 11 -C com.jdojo.mrjar.jdk11\target\classes .

@echo.
@echo ----- �г���Ŀ -----
jar --list --file mrjars\com.jdojo.mrjar.jar

@echo.
@echo ----- ������Ŀ -----
jar --update --file mrjars\com.jdojo.mrjar.jar --release 11 -C com.jdojo.mrjar.jdk11\target\classes .

@echo.
@echo ----- JDK8 ���� -----
"C:\Program Files\Java\jdk1.8.0_152\bin\java" -classpath mrjars\com.jdojo.mrjar.jar com.jdojo.mrjar.Main

@echo.
@echo ----- JDK11 ���� -----
java --module-path mrjars\com.jdojo.mrjar.jar --module com.jdojo.mrjar/com.jdojo.mrjar.Main

@echo.
@echo ----- ָ������ļ� -----
jar --create --verbose --file mrjars\com.jdojo.mrjar2.jar -C com.jdojo.mrjar.jdk8\target\classes . --release 11 -C com.jdojo.mrjar.jdk11\target\classes com\jdojo\mrjar\TimeUtil.class -C com.jdojo.mrjar.jdk11\target\classes module-info.class

@echo.
@echo ----- JDK8 ���� -----
"%JAVA8_HOME%\bin\java" -classpath mrjars\com.jdojo.mrjar2.jar com.jdojo.mrjar.Main

@echo.
@echo ----- JDK11 ���У�ʹ�� JDK8 Main�� -----
java --module-path mrjars\com.jdojo.mrjar2.jar --module com.jdojo.mrjar/com.jdojo.mrjar.Main

@echo.
@echo ----- ���� JMOD -----
jmod create --class-path lib\com.jdojo.prime.jar jmods\com.jdojo.prime.jmod

@echo.
@echo ----- ��ȡ JMOD �ļ� -----
jmod extract --dir extracted jmods\com.jdojo.prime.jmod

@echo.
@echo ----- �г� JMOD �ļ� -----
jmod list jmods\com.jdojo.prime.jmod

jmod create --class-path lib\com.jdojo.prime.faster.jar jmods\com.jdojo.prime.faster.jmod
jmod create --class-path lib\com.jdojo.prime.generic.jar jmods\com.jdojo.prime.generic.jmod
jmod create --class-path lib\com.jdojo.prime.probable.jar jmods\com.jdojo.prime.probable.jmod

@echo.
@echo ----- ��¼ɢ�� -----
jmod hash --module-path jmods --hash-modules com.jdojo.prime.? 
jmod describe jmods\com.jdojo.prime.jmod

@echo.
@echo ----- ��֤ɢ�� -----
jmod hash --dry-run --module-path jmods --hash-modules com.jdojo.prime.? 

@echo.
cmd