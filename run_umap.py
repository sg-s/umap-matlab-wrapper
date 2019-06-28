#!/usr/bin/env python
# from __future__ import print_function

# small wrapper to run umap
# serves as a bridge b/w MATLAB and pythong

# Usage:
# python run_umap.py "$metric"

import scipy.io
import numpy as np
import h5py
import sys
import umap
import os

# read options
script_path = os.path.dirname(os.path.realpath(sys.argv[0]))
hf = h5py.File(os.path.join(script_path, 'options.mat'), 'r')

n_neighbors = hf['n_neighbors']
n_neighbors = int(n_neighbors[0][0])

n_components = hf['n_components']
n_components = int(n_components[0][0])

learning_rate = hf['learning_rate']
learning_rate = (learning_rate[0][0])

min_dist = hf['min_dist']
min_dist = (min_dist[0][0])

spread = hf['spread']
spread = (spread[0][0])

set_op_mix_ratio = hf['set_op_mix_ratio']
set_op_mix_ratio = (set_op_mix_ratio[0][0])

local_connectivity = hf['local_connectivity']
local_connectivity = (local_connectivity[0][0])

repulsion_strength = hf['repulsion_strength']
repulsion_strength = (repulsion_strength[0][0])

negative_sample_rate = hf['negative_sample_rate']
negative_sample_rate = (negative_sample_rate[0][0])

transform_queue_size = hf['transform_queue_size']
transform_queue_size = (transform_queue_size[0][0])

target_n_neighbors = hf['target_n_neighbors']
target_n_neighbors = (target_n_neighbors[0][0])

target_weight = hf['target_weight']
target_weight = (target_weight[0][0])

transform_seed = hf['transform_seed']
transform_seed = (transform_seed[0][0])

metric = sys.argv[1]


hf = h5py.File(os.path.join(script_path, 'D.mat'),'r')
D = np.array(hf.get('D'));

reducer = umap.UMAP(metric=metric,n_neighbors=n_neighbors,n_components=n_components,learning_rate=learning_rate,min_dist=min_dist,spread=spread,set_op_mix_ratio=set_op_mix_ratio,local_connectivity=local_connectivity,repulsion_strength=repulsion_strength,negative_sample_rate=negative_sample_rate,transform_queue_size=transform_queue_size,target_n_neighbors=target_n_neighbors,target_weight=target_weight,transform_seed=transform_seed)
embedding = reducer.fit_transform(D)

with h5py.File(os.path.join(script_path, 'data.h5'), 'w') as hf:
    hf.create_dataset('R', data=embedding)
