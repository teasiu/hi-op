## Hi-OP 系统 自定义源码

建议使用ubuntu-20.04
```
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync qemu-utils android-sdk-ext4-utils
```
```bash
./scripts/feeds update -a
./scripts/feeds install -a
cp demo-32.config .config 或者 cp demo-64.config .config
make defconfig
make
```

## 刷入指南
编译后得到以下文件
```
bin/targets/armvirt/64/openwrt-armvirt-64-root.ext4.gz
```
或
```
bin/targets/armvirt/32/openwrt-armvirt-32-root.ext4.gz
```
将此文件上传到盒子海纳思系统当前位置
```
mount /dev/mmcblk0p8 /media
cp openwrt-armvirt-64-root.ext4.gz /media/backup-64.gz
或者
cp openwrt-armvirt-32-root.ext4.gz /media/backup-32.gz
sync
recoverbackup
```
注意：请自行判断你的盒子海纳思系统是32位还是64位并对应使用文档。

或者到社区bbs.histb.com交流。
