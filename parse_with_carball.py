import os

import carball

input_path = "./replay_files/1v1s/"
output_path = "./parsed_replays/"

print(f"Taking replays from {input_path}")
print(f"Saving replay data into {output_path}")

input_files = os.listdir(input_path)
for filename in input_files:
	if filename.endswith('.replay'):
		name = filename[0:filename.find('.replay')]
		output = output_path + name + '.json'
		_json = carball.decompile_replay(input_path + filename, output_path=output, overwrite=True)

print(f"Finished parsing {len(input_files)} replays.")
