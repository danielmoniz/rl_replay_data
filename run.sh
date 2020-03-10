
docker run --gpus all tensorflow/tensorflow:2.0.1-gpu-py3-jupyter nvidia-smi
docker run -u $(id -u):$(id -g) --gpus all --name tf-gpu tensorflow/tensorflow:2.0.1-gpu-py3-jupyter