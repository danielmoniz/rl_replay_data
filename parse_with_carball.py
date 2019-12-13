import os

import carball

input_path = "/Users/daniel/dev/projects/rl_replay_data/rlcs_season_7/"
output_path = "/Users/daniel/dev/projects/rl_replay_data/rlcs_season_7/"

for filename in os.listdir(input_path):
	if filename.endswith('.replay'):
		name = filename[0:filename.find('.')]
		output = output_path + name + '.json'
		_json = carball.decompile_replay(input_path + filename, output_path=output, overwrite=True)
