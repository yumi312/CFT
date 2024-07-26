#!/bin/bash
# 設定時區
echo "export TZ=Asia/Taipei" >> /root/.bashrc
echo 'ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone' >> /root/.bashrc

# 定義不同的顏色組合
cat << 'EOF' >> /root/.bashrc
container_name=CFT_NEW
path_color=250
bg_color=234

first_colors=(23 216 33 69)
second_colors=(73 225 81 111)
third_colors=(116 223 220 195)

select=$((RANDOM % ${#first_colors[@]}))
first_color=${first_colors[$select]}
second_color=${second_colors[$select]}
third_color=${third_colors[$select]}
path_block="\[\e[38;5;${path_color}m\][ \w ]\n"

first_block="\[\e[38;5;${bg_color};48;5;${first_color}m\]\[\] $container_name \[\e[38;5;${first_color};48;5;${second_color}m\]\[\] "
second_block="\[\e[38;5;${bg_color};48;5;${second_color}m\]\h \[\e[38;5;${second_color};48;5;${third_color}m\]\[\] "
third_block="\[\e[38;5;${bg_color};48;5;${third_color}m\]\u \[\e[38;5;${third_color};48;5;${bg_color}m\]\[\] \[\e[38;5;${path_color}m\]"
EOF

# 設定環境變數
echo 'export PS1="${path_block}${first_block}${second_block}${third_block}"' >> /root/.bashrc
echo 'export CLICOLOR=1' >> /root/.bashrc
echo 'export LSCOLORS=Gxfxcxdxbxegedabagacad' >> /root/.bashrc

# 啟動 bash
exec bash