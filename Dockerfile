FROM ubuntu:18.04
# ENV distribution=ubuntu18.04
ENV distribution="$(. /etc/os-release; echo $ID$VERSION_ID)"
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y gnupg
RUN curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
RUN curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list
RUN apt-get update && apt-get install -y nvidia-container-toolkit

# FROM nvidia/cuda:10.0-base
# RUN nvidia-smi --gpus all

FROM tensorflow/tensorflow:2.0.0-gpu-py3
# RUN apt-get update && apt-get install -y python3
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN python -c "import tensorflow as tf; print(tf.__version__); print(tf.test.is_gpu_available()); print(tf.test.gpu_device_name())"
RUN python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
