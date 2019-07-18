% small wrapper for umap so you can use it in MATLAB

% ### fit
%
% Dimensionally reduce a dataset using uniform manifold approximation and projection.
%
% **Syntax**
%
% ```matlab
% R = u.fit(D);
%
% **Description**
%
% `D` is a dataset represented as an M x N matrix
% with M observations (rows) and N features (columns).
% This function performs the UMAP dimensionality-reduction algorithm
% to produce a reduced dataset `R` of dimensions M x P,
% where `P = u.n_components`.
%
%
% See Also:
% umap.writeOptions

function R = fit(self, D)

if nargin == 0
	error('Not enough input arguments')
end

% transpose the matrix because the Python script doesn't expect data the same way as MATLAB
D = D';

save([self.containing_dir filesep 'D.mat'],'D','-v7.3')


% write out the options
self.writeOptions;


p1 = ['python "' self.containing_dir];


eval_str =  [p1 filesep 'run_umap.py" ' self.metric];
system(eval_str);

output_data_path = [self.containing_dir filesep 'data.h5'];

try
	R = h5read(output_data_path,'/R')';
catch
	error('Failed to read output data file, does it exist?')
end

% clean up
delete([self.containing_dir filesep 'D.mat'])
delete([self.containing_dir filesep 'data.h5'])
