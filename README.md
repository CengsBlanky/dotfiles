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

### 使用nvim-treesitter缩进解决问题

* treesitter在设置缩进的时候会出现自动缩进出问题的情况, 建议目前不要使用treesitter提供的缩进功能, 关于缩进这块, treesitter的配置存疑 *

## 使用gnu stow管理各种配置文件

详见script目录下的bash脚本文件, 运行该脚本需要使用4.0版本以上的bash, macos默认使用的bash版本较低,不支持关联数组, 需要使用HomeBrew安装一个更新版本的bash, 并在shell配置文件中将bash别名设为该bash的可执行二进制文件

## Tmux使用技巧🧩

> `C-b`是tmux默认前缀快捷键
> 依据个人习惯, 我将前缀快捷键设为`C-Space`
> 后文中使用`<prefix>指代前缀快捷键`

### session操作

* `tmux new -s [sessionName]` 创建一个新session
* `tmux attach -t [sessionName]` 重新连接到一个现有session
* `<prefix>d` 脱离当前session

### window操作

> tmux会在状态栏显示当前所在的窗口和已经存在的其他窗口

* `<prefix>c`新建窗口
* `<prefix>,`重命名当前窗口
* `<prefix>n`/`<prefix>p`在不同的窗口之间切换, `n`是下一个window, `p`是前一个window
* `<prefix>0-9`switch between windows by window number
* `<prefix>w`显示所有窗口, 可以在其中选择一个
* `<prefix>&`删除当前窗口

> 在编辑代码时, 可以使用一个窗口编辑代码, 一个窗口运行本地构建运行服务器或编译检查服务器, 此时给每个窗口一个名称会更简单明了

### 快捷键难解问题

* 如果出现某个快捷键不是你想要的功能或者是tmux默认的快捷键与其他软件出现冲突, 想要解除快捷键与对应功能的关系, 可以在命令行输入: `tmux list-keys | grep []`, 例如, tmux默认使用`Escape`键实现`previous-window`功能, 但是`Escape`与vim的快捷键冲突, 此时在命令行输入: `tmux list-keys | grep previous-window`可以查看到快捷键的绑定关系, 此时只需在tmux配置文件中使用`unbind-key -T root Escape`即可解绑`Escape`默认功能, 此时就可以在vim中顺畅使用`Escape`键了
> `Escape`键位在网络上有许多讨论, 有些结论是在tmux配置文件中设置`set -s escape-time 0`, 以个人理解, 该办法是解决在tmux中使用`Escape`快捷键时出现延时, 导致操作不流畅, 也就是说tmux将`Escape`视为一个前缀命令, 如果在一段时间的延时之后没有后续命令, 就执行`Escape`快捷键对应的功能(tmux对应默认功能为previous-window,即切换到前一个窗口), 个人强烈不建议在tmux中绑定使用`Escape`快捷键, 尤其是配合vim使用的时候,
> 很多人都会将vim中的复位键(即键盘左上角ESC)设置为`jk`或者`jj`这些更容易按到的键位, 即便如此, 默认的<ESC>仍然在很多情况下发挥作用, 比如可视模式下取消选择, 命令模式下取消输入命令, 待决模式下取消进一步操作 这些都需要使用<ESC>才能更有效率, 更不用说很多强迫症会多次按下<ESC>键以保证自己处在NORMAL模式下
