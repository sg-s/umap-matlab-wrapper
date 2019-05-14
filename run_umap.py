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

a = []
for arg in sys.argv: 
    a.append(arg)
metric = (a[1])

hf = h5py.File(os.path.dirname(sys.argv[0]) + 'D.mat','r')
D = np.array(hf.get('D'));

reducer = umap.UMAP(metric=metric)
embedding = reducer.fit_transform(D)

with h5py.File(os.path.dirname(sys.argv[0]) + 'data.h5', 'w') as hf:
    hf.create_dataset('R', data=embedding)