function [newIC, newTO] = cycleValidate(IC, TO)

%groupedCycles = [];
%newIC = [];
%newTO = [];
%
%for i = 1 : min(length(IC), length(TO))
%	
%	if(~isempty(groupedCycles))
%		if IC(i) < groupedCycles(end)
%			% violate, abort all previous sequence
%			groupedCycles = [];
%			continue;		
%		end
%	end
%	
%	groupedCycles = [groupedCycles IC(i) TO(i)];
%
%end
%
%for i = 1 : 2 : length(groupedCycles)
%
%	newIC = [newIC groupedCycles(i)];
%	newTO = [newTO groupedCycles(i+1)];
%
%end

newIC = IC;
newTO = TO;

if(IC(2) < TO(1)) 
	newIC = newIC(2:end);
end

