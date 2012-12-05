% cycleCompare( gait, 5, 7, 'R', 100)
function [medianData] = cycleCompare( gait, startCycle, endCycle, compareBy, sampleRate)
	
	figure(1)
	hold all
	
	medianData = []
	
	for i = [startCycle:endCycle-1]
	
		% Data
		if compareBy == 'R'
			y = gait.jointAngle([ gait.RightInitialContact(i) : gait.RightInitialContact(i + 1) ], 51);
			indexLeftInitialContact = []
		else
			y = gait.jointAngle([ gait.LeftInitialContact(i) : gait.LeftInitialContact(i + 1) ], 63);
			indexRightInitialContact = []
		end
		
		% Resample
		y_resampled = resample(y, sampleRate, length(y));
		
		% Push Resample Data Into Array, Prepare For Median Caulcation
		medianData = [medianData y_resampled]
		
		% Legend
		h(i - startCycle + 1) = plot([1:sampleRate], y_resampled);
		s{i - startCycle + 1} = sprintf('Cycle %d', i);
		
	end
	
	medianData = median(medianData ,2)
	h(end+1) = plot([1:sampleRate], medianData(:,1));
	s{end+ 1} = sprintf('Median');
	
	legend(h, s)
	
	gait.medianGait = []
	gait.medianGait = [ gait.medianGait median(indexRightToeOff) ]
	if compareBy == 'R'
		gait.medianGait = [ gait.medianGait median(indexLeftInitialContact) ]
	else
		gait.medianGait = [ gait.medianGait median(indexRightInitialContact) ]
	end
	gait.medianGait = [ gait.medianGait median(indexLeftToeOff) ]
	
	hold off
end