# Tips & Tricks

## 使用ssh远程连接主机的过程🧩

### 基本命令:
```
ssh hostname@ipAddr
```
这种方式有两个缺点：
1. 如果有很多服务器，用户名和IP地址很难记，容易混淆
2. 效率很低，每次登录都要输入密码，流程繁琐，也不安全

下面介绍通过设置ssh密钥连接和修改配置文件，让ssh登录更加方便快捷

### 相关配置文件

* ~/.ssh/config: 设置连接主机相关参数, 之后可以直接通过主机名登录

```
Host openEuler
    Hostname 192.168.2.113
    User zeng
    IdentityFile ~/.ssh/id_rsa
```

这里，Host是一个主机助记名，可以设置为比较好区分的名称，Hostname为服务器IP地址，User是服务器端的用户名，IdentityFile是私钥文件地址
* 在客户端生成密钥对`ssh-keygen -t rsa -f [~/.ssh/id_rsa]`，将生成的公钥内容复制到服务器端`~/.ssh/authorized_keys`文件中
> 将公钥传到服务器端可以直接使用命令`ssh-copy-id <user>@<ip address>`, `authorized_keys`这个文件若不存在可以手动建立
* 配置config文件加上一行`IdentityFile ~/.ssh/id_rsa`, 注意这里指定的是私钥文件，就是让ssh连接时使用这个私钥进行验证

通过以上配置，可以直接输入服务器名进行登录，无需输入密码, 即输入`ssh openEuler`就可直接登录

> 配置过程中如果出现问题，可以查看系统配置文件，一般客户端和服务器端关于ssh的配置文件位于/etc/ssh/sshd_config<br>
> 查看该文件，确保公钥连接设置是允许的<br>
> 同一个机器上的不同用户使用的ssh也是不同的，可以有两种方法解决这个问题：
> 1. 直接将另一个用户的.ssh文件夹拷贝到自己的家目录下
> 2. 重新生成ssh key建立连接

## vim 使用技巧🧩

### 以只读方式打开文件的方式：

* 命令行中输入`view`, 打开文件后如果有修改，会有readonly提示，但是仍然可以强制更改文件
* `vim -m`或者`vim -M`，两者都会禁止对文件进行任何更改
> 以上两条命令进入vim之后，使用`:edit [file]`打开的其他文件也是只读的
* 如果正在编辑文件，想打开一个只读文件进行参考，在vim命令行中输入`:view [file]`即可，只有新打开的buffer是只读的，不影响其他正在编辑的buffer

### 使用autoformatter插件实现保存前自动格式化代码文本

* 仓库新增clang-format.yaml文件，将该文件重命名为`.clang-format`放在代码项目根目录或者代码所在文件夹，插件会根据该文件规则对代码进行格式化
* 一般来说，以`.git`所在文件夹为根目录，将`.clang-format`放在根目录，项目中所有满足要求的代码文件都以该文件设置的规则进行格式化

### 使用session保存文件编辑状态，以便迅速在不同项目之间切换

TODO
