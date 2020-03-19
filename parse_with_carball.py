import os

import carball

num_bad_files = 0
output_path = "./parsed_replays/" # include trailing slash
input_paths = [
	"./replay_files/1v1s/Syracks/",
	"./replay_files/1v1s/Kevpert/",
]

print(f"Saving all replay data into {output_path}")

for input_path in input_paths:
	input_path = os.path.normpath(input_path)
	print(f"Taking replays from {input_path}/")
	prefix = os.path.basename(os.path.normpath(input_path)) + '_'
	print(f"Saving files with prefix '{prefix}'")

	input_files = os.listdir(input_path)
	for filename in input_files:
		if filename.endswith('.replay'):
			name = filename[0:filename.find('.replay')]
			output = output_path + prefix + name + '.json'
			try:
				_json = carball.decompile_replay(f"{input_path}/{filename}", output_path=output, overwrite=True)
			except:
				print(f"Something went wrong reading \"{filename}\". Omitting.")
				num_bad_files += 1

print(f"Finished parsing {len(input_files) - num_bad_files} replays.")
print(f" --> {num_bad_files} files failed to parse. See above for filesnames.")
