import os
dockerhub="yichen312w"
imagename="cft"
tag="0603"

container_name="cft_new"

# mount 要執行的project
source= os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
target="/workspace/"
mount=f"-v {source}:{target}"
# 想要mount更多可以再加

# build image
print("===建立image===")
print(f"docker build -t {dockerhub}/{imagename}:{tag} .")
print()

# 啟動容器
print("===啟動容器===")
print(f"docker run -it --ipc=host --name {container_name} --gpus all {mount} {dockerhub}/{imagename}:{tag}")
print()