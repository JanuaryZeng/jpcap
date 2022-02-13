# jpcap 0.01.16
[jpcap官网](http://jpcap.sourceforge.net/)上的jar包和动态库是基于32位linux系统编译的，本文在64位linux系统上重新编译。其中jpcap-0.01.16.tar.gz是官网下载的原文件。

## 环境

- Ubuntu20.04
- Java 1.8

# 重新编译

## 1、安装libpcap库

```shell
sudo apt-get install libpcap-dev
```

终端执行

```shell
locate libpcap
```

找到libpcap.a文件的位置，之后需要用到。例如：

```shell
/usr/lib/x86_64-linux-gnu/libpcap.a
```

## 2、安装jpcap库

解压jpcap-0.01.16.tar.gz文件，找到scripts/env_jpcap文件，修改以下几项，并把env_jpcap文件后面加上.sh：

```shell
# 你解压后的目录
export PROJECT_HOME=~/dev/sourceforge/jpcap
# 生成目录
export RELEASE_HOME=~/dev/releases
# 选填，指定你的JDK目录
#export JAVA_HOME=/usr/java/jdk1.3 ; export PATH=$JAVA_HOME/bin:$PATH
```

然后让配置生效

```
./scripts/env_jpcap.sh
```

编译

```shell
make clean && make
```

### 错误1

```shell
g++: /usr/lib/libpcap.a: No such file or directory
```

找到报错的文件，将其中的libpcap.a目录修改为刚刚找到的目录。

### 错误2

如果make报找不到targets.makefile等错误，需要把项目下的所有makefile文件的开头加上：

```makefile
#路径需要按照自己的进行修改
MAKE_HOME = /home/zxj/project/IdeaProjects/jpcap-0.01.16/make
```

### 生成jar文件

make成功之后运行：

```shell
make release
```

就可以在之前配置的RELEASE_HOME目录下发现编译好的文件了：

javadoc_net.sourceforge.jpcap-0.01.16.jar

net.sourceforge.jpcap-0.01.16.jar

解压后者，发现libjpcap.so也在里面。

# 使用jpcap

主要使用的是

- net.sourceforge.jpcap-0.01.16.jar
- libjpcap.so

## 导入libjpcap.so

使用java运行以下命令：

```Java
System.out.println(System.getProperty("java.library.path"));
```

将libjpcap.so导入到其中任意一个文件夹下即可。

## 使用net.sourceforge.jpcap-0.01.16.jar

在IDEA中点击File->Project Stucture->Modules->Dependencies->点击+号->找到net.sourceforge.jpcap-0.01.16.jar的位置->点击ok，导入完毕。

net.sourceforge.jpcap.tutorial下面有7个例子可以帮助理解，配合官网食用更佳。

