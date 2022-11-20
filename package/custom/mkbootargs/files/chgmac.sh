#!/bin/bash

dl_url="https://dl.ecoo.top/public/update/soft_init"
bootargs_txt="/etc/emmc_bootargs_32.txt"
flash_partition="/dev/mmcblk0p2"

[ "$(uname -m)" = "armv7l" ] && ARCH="armhf" || ARCH="arm64"

mkbootargs_file="mkbootargs_${ARCH}"
mkbootargs_bin="/tmp/${mkbootargs_file}"

usage() {
    cat <<-EOF
Usage: usage: chgmac.sh -m <addr>
EOF
    exit $1
}

[ $# -eq 0 ] && usage 0
while [ $# -gt 0 ]; do
    if [ -z "$1" ]; then
        usage 0
    else
        case "$1" in
            --help | -h)
                usage 0
                ;;
            -m)
                INPUT_ADDR=$2
                shift 2
                ;;
            *)
                usage 1
                ;;
        esac
    fi
done

_exit() {
    exit_singal=$1
    shift
    echo -e "[ ERROR ]: $*"
    exit $exit_singal
}

#check_mac
if [ "$(echo $INPUT_ADDR|awk '{print length($1)}')" != "17" ]; then
    _exit 1 "'$INPUT_ADDR' 地址非法，请重新设置！"
fi
re="([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}"
if [[ ! $INPUT_ADDR =~ ${re} ]]; then
    _exit 1 "'$INPUT_ADDR' 地址非法，请重新设置！"
fi
sed -ri "s/(ethaddr=).*$/\1$INPUT_ADDR/g" ${bootargs_txt}

curl ${dl_url}/${mkbootargs_file} -o ${mkbootargs_bin} || _exit 1 "下载失败，请重试"
chmod a+x ${mkbootargs_bin}
${mkbootargs_bin} -s 64 -r ${bootargs_txt} -o /tmp/bootargs.bin >/dev/null || _exit 1 "生成失败，请重试"
dd if=/tmp/bootargs.bin of=${flash_partition} bs=1024 count=1024
rm -f ${mkbootargs_bin}
rm -f /tmp/bootargs.bin
echo -e "[ OK ]: 已经成功更改你的盒子MAC地址，重启即可生效"
