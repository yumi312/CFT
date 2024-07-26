#!/bin/bash
# 設定時區
echo "export TZ=Asia/Taipei" >> /root/.bashrc
echo 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

# 定義不同的顏色組合
cat << 'EOF' >> /root/.bashrc
PS1_OPTIONS=(
    "🦦 \[\033[38;2;187;122;68m\]\u\[\033[38;2;137;221;255m\]@\[\033[38;2;137;221;255m\]\w\[\033[38;2;190;190;190m\]\$ "
    "🐧 \[\033[38;2;150;150;150m\]\u\[\033[38;2;100;200;200m\]@\[\033[38;2;100;200;200m\]\w\[\033[38;2;190;190;190m\]\$ "
    "🐱 \[\033[38;2;200;100;100m\]\u\[\033[38;2;250;200;100m\]@\[\033[38;2;250;200;100m\]\w\[\033[38;2;190;190;190m\]\$ "
)
EOF

# 隨機選擇 PS1
echo 'RANDOM_INDEX=$((RANDOM % ${#PS1_OPTIONS[@]}))' >> /root/.bashrc
echo 'RANDOM_PS1="${PS1_OPTIONS[$RANDOM_INDEX]}"' >> /root/.bashrc

# 設定環境變數
echo 'export PS1="$RANDOM_PS1"' >> /root/.bashrc
echo 'export CLICOLOR=1' >> /root/.bashrc
echo 'export LSCOLORS=Gxfxcxdxbxegedabagacad' >> /root/.bashrc

# 啟動 bash
exec "$@"