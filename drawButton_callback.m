function [ gait ] = pushbutton_callback( hObject, eventdata, panel, gait, cycleSelectStart, cycleSelectEnd)
    
	if gait.LeftInitialContact(1) > gait.RightInitialContact(1)
		compareBy = 'L'
	else
		compareBy = 'R'
	end
	
    sampleRate = 100
    
	startCycle = get(cycleSelectStart, 'Value')
	endCycle = get(cycleSelectEnd, 'Value')
	
	if(startCycle > endCycle)
		msgbox('Start Cannot Be Smaller Than End!','Error!!','error')
		return
	end
	
	axes(panel)
	cla
	hold all
	
	medianData = []
	all_median_data = []
	
	for i = [startCycle:endCycle]
	
		% Data
		if compareBy == 'R'
			y = gait.jointAngle([ gait.RightInitialContact(i) : gait.RightInitialContact(i + 1) ], 51);
			% All Data
			all_data = gait.jointAngle([ gait.RightInitialContact(i) : gait.RightInitialContact(i + 1) ], :);
			
		else
			y = gait.jointAngle([ gait.LeftInitialContact(i) : gait.LeftInitialContact(i + 1) ], 63);
			% All Data
			all_data = gait.jointAngle([ gait.LeftInitialContact(i) : gait.LeftInitialContact(i + 1) ], :);
		end
		
		% Resample
		y_resampled = resample(y, sampleRate, length(y));
		
		% all resample
		all_data_resampled = resample(all_data, sampleRate, size(all_data, 1));
		
		
		% Push Resample Data Into Array, Prepare For Median Caulcation
		medianData = [medianData y_resampled]
		
		all_median_data{i-startCycle+1} = all_data_resampled
		
		% Legend
		h(i - startCycle + 1) = plot([1:sampleRate], y_resampled);
		s{i - startCycle + 1} = sprintf('Cycle %d', i);
		
	end
	
	medianData = median(medianData ,2)
	h(end+1) = plot([1:sampleRate], medianData(:,1));
	s{end+ 1} = sprintf('Median');
	
	gait.MedianGait.allMedianData = all_median_data
	gait.MedianGait.medianData = medianData
	gait.MedianGait.mean = mean(medianData)
	gait.MedianGait.median = median(medianData)
	gait.MedianGait.std = std(medianData)
	gait.MedianGait.percentile95 = prctile(medianData(:,1), 95)
	gait.MedianGait.percentile5 = prctile(medianData(:,1), 5)
	
	legend(h, s)
	
	hold off
    
end

