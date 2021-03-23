# 更新时间: 2021.03.23
# 安装文件所在目录
cd /home/root/installs/nvidia
# 不建议使用wget下载，用迅雷下载再传送到服务器上更快
# 预下载文件清单
# 1. NVIDIA-Linux-x86_64-460.67.run
# 2. cuda_11.2.0_460.27.04_linux.run
# 3. cudnn-11.2-linux-x64-v8.1.1.33.tgz
# 4. Miniconda3-latest-Linux-x86_64.sh
# 5. rtx3090.sh
# 6. hello_tf.py

# step 1. driver 460.27.04 安装
sudo chmod +x NVIDIA-Linux-x86_64-460.67.run
sudo sh NVIDIA-Linux-x86_64-460.67.run

# step 2. cuda_11.2.0 安装
# 交互式，自带驱动(460.27.04)不要选择安装
# 参考: https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#ubuntu-x86_64-run
chmod +x cuda_11.2.0_460.27.04_linux.run
sudo sh cuda_11.2.0_460.27.04_linux.run --toolkit --no-opengl-libs
# 查看显卡信息, 确认安装成功
nvidia-smi
# 配置CUDA目录, 添加到 ~/.bashrc中
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64
export PATH=$CUDA_HOME/bin:$PATH
# 验证CUDA是否已安装
nvcc -V

# step 3. cuDNN v8.1.1 安装
tar -zxvf cudnn-11.2-linux-x64-v8.1.1.33.tgz 
sudo cp cuda/lib64/* /usr/local/cuda/lib64/
sudo cp cuda/include/* /usr/local/cuda/include/
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# step 4. 测试 tensorflow
chmod +x Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

conda create -n tf python=3.8
conda activate tf
# https://tensorflow.google.cn/install/source#linux
pip install tensorflow-gpu==2.4.0 -i http://pypi.douban.com/simple --trusted-host pypi.douban.com


python hello_tf.py

