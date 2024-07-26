#! /bin/bash

# 安裝必要的套件
pip install -r ../requirements.txt

# 解除opencv-python
pip uninstall -y opencv-python

# 安裝opencv-python-headless
pip install opencv-python-headless

# 安裝CLIP
pip install git+https://github.com/openai/CLIP.git

# 安裝einops
pip install einops