#!/bin/bash

# 删除 Mediatek 和其他非 x86 架构的源码目录
echo "正在清理非 x86_64 架构的源码..."
rm -rf target/linux/mediatek
rm -rf target/linux/ramips
rm -rf target/linux/rockchip
rm -rf target/linux/bcm27xx
rm -rf target/linux/ipq806x
rm -rf target/linux/ipq40xx
# 可以根据需要添加更多不需要的架构
echo "清理完成。"

# 修改默认IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 更改默认 Shell 为 zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD 免登录
# sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

./scripts/feeds update -a
./scripts/feeds install -a
