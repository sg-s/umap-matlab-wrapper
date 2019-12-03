% writes out options in a file
% so the python script can read them
% this is how we "talk" to python

function writeOptions(self)

p = properties(self);


options = struct;
for i = 1:length(p)
	if ischar(self.(p{i}))
		continue
	end
	options.(p{i}) = self.(p{i});
end

save([self.containing_dir filesep 'options.mat'],'-struct','options', '-v7.3')
