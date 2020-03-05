# Add the package repositories
#distribution=$(. /etc/os-release; echo $ID$VERSION_ID) # will not work in Linux Mint - use below
distribution=ubuntu18.04
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

docker pull tensorflow/tensorflow:2.0.0-gpu-py3

