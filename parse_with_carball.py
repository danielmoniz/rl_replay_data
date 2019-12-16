import os

import carball

input_path = "/Users/daniel/dev/projects/rl_replay_data/replay_files/1v1s/"
output_path = "/Users/daniel/dev/projects/rl_replay_data/parsed_replays/1v1s/"

for filename in os.listdir(input_path):
	if filename.endswith('.replay'):
		name = filename[0:filename.find('.replay')]
		output = output_path + name + '.json'
		_json = carball.decompile_replay(input_path + filename, output_path=output, overwrite=True)
