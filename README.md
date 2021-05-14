# 实验二 Shell脚本编程

> 王绍源
>
> 518021910336

## 一、myfind

**代码**

```shell
#!/bin/bash
if [ -z "$2" ] ;then
    grep -rn $1 --include *.c
    grep -rn $1 --include *.h
else
    grep -rn "$2" $1 --include *.c
    grep -rn "$2" $1 --include *.h
fi
```

代码比较简单明了，在此不作过多解释。

### 测试

**测试环境：**Linux kali 5.10.0-kali3-amd64

**测试步骤：**

* 建立如下的目录用于测试：

  .
  ├── test1
  │   ├── test1.c
  │   ├── test1.h
  │   └── test3
  │       ├── test3.c
  │       └── test3.h
  ├── test2
  │   ├── test2.c
  │   └── test2.h
  └── tree.md

  所有文件内容均为：

  ```c
  # hello world
  # bye world
  ```

1. 将脚本置于根目录下，测试不输入地址参数的情况，结果如下图：

   <img src='C:\Users\Wsy\AppData\Roaming\Typora\typora-user-images\image-20210514145628348.png' style='float:left'>

2. 测试输入地址参数的情况

   <img src='C:\Users\Wsy\AppData\Roaming\Typora\typora-user-images\image-20210514150417428.png' style='float:left'>

## 二、mytree

### 代码

```shell
#! /bin/bash
a=""
function read_dir(){
    local space="$2"
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            echo "$space"$file
	    local temp="$space"
	    space="    ""$space"
            read_dir $1"/"$file "$space"
	    space="$temp"
        else
            echo "$space"$file
        fi
    done
}

read_dir . $a
```

该程序首先定义了一个函数，函数的第一个参数为当前目录，第二个参数为当前目录需要的空格。程序开始运行，将当前目录输入，第二个参数为空，遍历当前目录下所有对象，若其为文件，则将其名称打印，若其为文件夹，则将其名称打印的同时以其为当前目录递归执行，直到在当前目录下找不到文件夹，递归结束，循环继续。

### 测试

**测试环境：**Linux kali 5.10.0-kali3-amd64

**测试步骤：**

在测试目录下使用tree命令得到的结果：

<img src='C:\Users\Wsy\AppData\Roaming\Typora\typora-user-images\image-20210514173636548.png' style='float:left'>

运行mytree.sh得到的结果：

<img src='C:\Users\Wsy\AppData\Roaming\Typora\typora-user-images\image-20210514173803939.png' style='float:left'>