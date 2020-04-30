classdef umap < Constructable & Hashable

properties



	n_neighbors (1,1) double = 15
	n_components (1,1) double = 2
	metric = 'euclidean'
	learning_rate (1,1) double = 1
	min_dist (1,1) double = .1
	spread (1,1) double = 1
	set_op_mix_ratio (1,1) double = 1
	local_connectivity (1,1) double = 1
	repulsion_strength (1,1) double = 1
	negative_sample_rate  (1,1) double = 5
	transform_queue_size (1,1) double = 4
	target_n_neighbors (1,1) double = -1
	target_weight (1,1) double = .5
	transform_seed (1,1) double = 42


	labels double 

	containing_dir

end % props


methods 

	function self = umap(varargin)
		self = self@Constructable(varargin{:});   
		self.containing_dir = fileparts(fileparts(which('umap')));
	end % constructor


end % methods


end % classdef