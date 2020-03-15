# rl_replay_data
Replay data for Rocket League

## Parse replays

Replays needs to be parsed into a JSON format. You can find replays wherever you like, including at ballchasing.com. There is a zip containing replays from RLCS 7. These should be unzipped if they are to be used.

Note that `parse_with_carball.py` is currently hardcoded to access replays in a specific directory. Modify this file as needed.

Place any replay files into `./replay_files/1v1s/`. Then run:

```bash
python parse_with_carball.sh
```

This should parse your replays into a new directory called `./parsed_replays/1v1s/`. You can check that this worked by ensuring you have `.json` files in that directory.

## Docker or Virtualenv

This project can either be set up by using Docker (recommended) or manually by using virtualenv. GPU functionality comes with the Docker approach by default. The manual approach will rely on your CPU unless you undergo the (arduous) process of setting up CUDA on your machine. If setting up manually, you should additionally [install Tensorflow 2](https://www.tensorflow.org/install/gpu), following instructions for GPU support.

### Automatic (Docker w/ GPU)

First, a Docker image should be built, which will contain the relevant Python version, Tensorflow, and all other requirements. Then a Docker container needs to be run and the Jupyter notebook opened.

#### Build

This process creates a new Docker image called `rl-replays-gpu` from the provided Dockerfile. The need only be run once. This will also install all dependencies from requirements.txt.

```bash
./build.sh
```

#### Run

To start the Jupyter notebook, simply run:

```bash
./run.sh
```

Open the URL provided by the terminal to open the notebook and begin!

### Manual (virtualenv, not recommended)

You should additionally [install Tensorflow 2](https://www.tensorflow.org/install/gpu), following instructions for GPU support.

Please use Python 3.6 at the latest. You can specify which Python version to use when making a virtualenv with the `--python=path/to/python` argument.

#### Setup

```bash
./setup.sh
```

#### Run

```bash
sh jupyter_colab.sh
```

Or run Jupyter directly:
```bash
source env/bin/activate
jupyter notebook
```

You can then use the Jupyter notebook that should have opened to navigate to the `build_model_relative.ipynb` file and begin!

Optionally, a Jupyter Colab can be used to connect to the given URL. This is not recommended.

## Check for GPU compatibility

To ensure your machine is able to detect a GPU, try running:

```bash
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi
```

It should output information about your GPU, including a driver version, CUDA version, and hardware info (eg. GeForce GTX 1080).

Note that the Jupyter notebook being run should also have a GPU test to confirm whether or not Tensorflow has access to a GPU.
