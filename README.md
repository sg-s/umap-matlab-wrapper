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

## Parameters and options

Many of the parameters and options in `umap` are exposed in the object, 
and you can change these directly from MATLAB. For example:

```
u = umap

  umap with properties:

             n_neighbors: 15
            n_components: 2
                  metric: 'euclidean'
           learning_rate: 1
                min_dist: 0.1000
                  spread: 1
        set_op_mix_ratio: 1
      local_connectivity: 1
      repulsion_strength: 1
    negative_sample_rate: 5
    transform_queue_size: 4
      target_n_neighbors: -1
           target_weight: 0.5000
          transform_seed: 42


u.n_neighbors = 10;
u.metric = 'precomputed';
```


# License

GPL