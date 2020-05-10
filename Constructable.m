% An abstract class that allows creation of objects
% using name value syntax

classdef (Abstract) Constructable 


	methods 


		function self = Constructable(varargin)

			if nargin == 0
				return
			end
			
			
			% validate and accept options
			options = struct;
			prop_names = properties(self);
			if mathlib.iseven(length(varargin))
				for ii = 1:2:length(varargin)-1
					temp = varargin{ii};
			    	if ischar(temp)
			    		if ~any(find(strcmp(temp,prop_names)))
				    		disp(['Unknown option: ' temp])
				    		disp('The allowed options are:')
				    		disp(prop_names)
				    		error('UNKNOWN OPTION')
				    	else
				    		options.(temp) = varargin{ii+1};
				    	end
			    	end
				end
			elseif isstruct(varargin{1})
				% should be OK...
				options = varargin{1};
			else
				error('Inputs need to be name value pairs')
			end


			
			field_names = fieldnames(options);

			for i = 1:length(field_names)
				self.(field_names{i}) = options.(field_names{i});
			end


		end

	end


end