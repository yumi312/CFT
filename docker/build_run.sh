#!/bin/bash

dockerhub="yichen312w"
imagename="yolov8"
tag="bridge"

# mount 要執行的project
source=/home/yumi/win_E/ITRI-bridge
target="/workspace/"
mount="-v $source:$target"
# 想要mount更多可以再加

# build image
docker build -t $dockerhub/$imagename:$tag .

container_name="yolov8_test2"

# 啟動容器
docker run -it --shm-size=42g --gpus 0 $mount $dockerhub/$imagename:$tag