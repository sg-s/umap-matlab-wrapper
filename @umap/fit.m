% small wrapper for umap so you can use it in MATLAB

function R = fit(self, D)

if nargin == 0
	error('Not enough input arguments')
end



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
