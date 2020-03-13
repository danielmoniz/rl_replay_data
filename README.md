# rl_replay_data
Replay data for Rocket League

## Setup

Please use Python 3.6 at the latest. You can specify which Python version to use when making a virtualenv with the `--python=path/to/python` argument.

```bash
virtualenv env
./setup.sh
```

## Parse replays

Replays needs to be parsed into a JSON format. You can find replays wherever you like, including at ballchasing.com. There is a zip containing replays from RLCS 7. These should be unzipped if they are to be used.

Note that `parse_with_carball.py` is currently hardcoded to access replays in a specific directory. Modify this file as needed.

Place any replay files into `./replay_files/1v1s/`. Then run:

```bash
python parse_with_carball.sh
```

This should parse your replays into a new directory called `./parsed_replays/1v1s/`. You can check that this worked by ensuring you have `.json` files in that directory.

## Run

```bash
./jupyter_colab.sh
```

Then run the Google Colaboratory notebook and connect to a local runtime:

https://colab.research.google.com/drive/1_Gl0aMOtyUdjNfHsU_rLydfDkb0NfKdf


# NOTE (temporary)
To run Tensorflow with a GPU:
```bash
docker build . --tag gpu-test
docker run --gpus all -p 8888:8888 -v /data -e VIRTUAL_ENV=./env -e PATH="$VIRTUAL_ENV/bin:$PATH" gpu-test
```