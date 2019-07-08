#在ubuntu 18.04上安装cuda nccl等深度学习必备的组件
set -x
#change mirror source 
sudo tar xf
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cat>/etc/apt/sources.list<<EOF
deb http://mirrors.163.com/ubuntu/ precise main universe restricted multiverse 
deb-src http://mirrors.163.com/ubuntu/ precise main universe restricted multiverse 
deb http://mirrors.163.com/ubuntu/ precise-security universe main multiverse restricted 
deb-src http://mirrors.163.com/ubuntu/ precise-security universe main multiverse restricted 
deb http://mirrors.163.com/ubuntu/ precise-updates universe main multiverse restricted 
deb http://mirrors.163.com/ubuntu/ precise-proposed universe main multiverse restricted 
deb-src http://mirrors.163.com/ubuntu/ precise-proposed universe main multiverse restricted 
deb http://mirrors.163.com/ubuntu/ precise-backports universe main multiverse restricted 
deb-src http://mirrors.163.com/ubuntu/ precise-backports universe main multiverse restricted 
deb-src http://mirrors.163.com/ubuntu/ precise-updates universe main multiverse restricte
EOF
sudo apt-get update
sudo apt-get upgrade


#install driver cuda cudnn and nccl
sudo dpkg -i ./nvidia-diag-driver-local-repo-ubuntu1804-418.67_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.168-418.67_1.0-1_amd64.deb
sudo apt-key  add /var/cuda-repo-10-1-local-10.1.168-418.67/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda
sudo apt-get install ./libcudnn7_7.6.0.64-1+cuda10.1_amd64.deb
sudo apt-get install ./libcudnn7-dev_7.6.0.64-1+cuda10.1_amd64.deb

sudo dpkg -i nccl-repo-ubuntu1804-2.4.7-ga-cuda10.1_1-1_amd64.deb
sudo apt-get update
sudo apt install libnccl2=2.4.7-1+cuda10.1 libnccl-dev=2.4.7-1+cuda10.1
