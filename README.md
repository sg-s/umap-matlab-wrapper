# MATLAB wrapper for [umap](https://github.com/lmcinnes/umap)

![](https://user-images.githubusercontent.com/6005346/57731525-d98bb980-7668-11e9-8d85-3c35e422f2ab.png)

This repo provides a simple wrapper for [umap](https://github.com/lmcinnes/umap)

# Installation

1. Install umap using `conda install -c conda-forge umap-learn`
2. Install `h5py` using `conda install h5py`
3. Install [condalab](https://github.com/sg-s/condalab)
4. Run `conda.init` to configure `condalab` in MATLAB

# Use 

```matlab

u = umap();
R = u.fit(X);

```

# License

GPL