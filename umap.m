% small wrapper for umap so you can use it in MATLAB

function R = umap(D, metric)

if nargin < 2
	metric = 'precomputed';
end


containing_dir = fileparts(which('umap'));
save([containing_dir 'D.mat'],'D','-v7.3')


p1 = ['python "' containing_dir];


eval_str =  [p1 filesep 'run_umap.py" ' metric];
system(eval_str);

R = h5read('data.h5','/R')';

% clean up
delete('D.mat')
delete('data.h5')