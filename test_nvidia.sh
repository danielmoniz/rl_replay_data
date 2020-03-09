#### Test nvidia-smi with the latest official CUDA image
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi

docker run --gpus all -it --rm tensorflow/tensorflow:2.0.0-gpu-py3 python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
docker run --gpus all -it --rm tensorflow/tensorflow:2.0.0-gpu-py3 python -c "import tensorflow as tf; print(tf.__version__); print(tf.test.is_gpu_available()); print(tf.test.gpu_device_name())"
