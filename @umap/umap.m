classdef umap

properties



	n_neighbors = 15
	n_components = 2
	metric = 'euclidean'
	learning_rate = 1
	min_dist = .1
	spread = 1
	set_op_mix_ratio = 1
	local_connectivity = 1
	repulsion_strength = 1
	negative_sample_rate = 5
	transform_queue_size = 4
	target_n_neighbors = -1
	target_weight = .5
	transform_seed = 42


	containing_dir

end % props


methods 

	function self = umap()
		self.containing_dir = fileparts(fileparts(which('umap')));
	end % constructor


end % methods


end % classdef