% defines a hashable object, i.e.,
% one that you call hash() on

classdef (Abstract) Hashable


methods


	function H = hash(self)



		props = properties(self);
		double_values = [];
		char_values = [];


		for i = 1:length(props)
			s = superclasses(self.(props{i}));

			if isa(self.(props{i}),'double') || isa(self.(props{i}),'logical')
				this_value = double(self.(props{i}));
				double_values = [double_values; this_value(:)];
			elseif isa(self.(props{i}),'char')
				this_value = (self.(props{i}));
				char_values = [char_values; this_value(:)];
			elseif any(strcmp(s,'Hashable'))
				% check if this object inherits from Hashable
				this_hash = self.(props{i}).hash;
				char_values = [char_values; this_hash(:)];
			elseif isenum(self.(props{i}))
				% cast into char
				this_value = char(self.(props{i}));
				char_values = [char_values; this_value(:)];
			end
		end
		h1 = hashlib.md5hash(double_values);
		h2 = hashlib.md5hash(char_values);
		H = hashlib.md5hash([h1 h2]);
	end

end


end % classdef