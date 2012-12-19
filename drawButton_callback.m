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
		%if compareBy == 'R'
		%	y = gait.jointAngle([ gait.RightInitialContact(i) : gait.RightInitialContact(i + 1) ], 51);
			% All Data
		%	all_data = gait.jointAngle([ gait.RightInitialContact(i) : gait.RightInitialContact(i + 1) ], :);
			
		%else
			y = gait.jointAngle([ gait.LeftInitialContact(i) : gait.LeftInitialContact(i + 1) ], 63);
			% All Data
			all_data = gait.jointAngle([ gait.LeftInitialContact(i) : gait.LeftInitialContact(i + 1) ], :);
		%end
		
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
	
	gait.MedianGait.allData = []
	gait.MedianGait.allData = all_median_data
	
	for i = [1:66]
		
		tmpCycleValue = []
		
		for j = [1:length(gait.MedianGait.allData)]
		
			tmpData = gait.MedianGait.allData{j}
			
			tmpCycleValue(:, j) = tmpData(:, i)
			
		end
		
		tmpMedianCycleValue = median(tmpCycleValue, 2)
		tmpStdCycleValue = std(tmpCycleValue, 0, 2)
		tmpMeanCycleValue = mean(tmpCycleValue, 2)
		
		result_median_data(:, i) = tmpMedianCycleValue
		result_std_data(:, i) = tmpStdCycleValue
		result_mean_data(:, i) = tmpMeanCycleValue
	end
	
	gait.MedianGait.result_std_data = result_std_data;
	gait.MedianGait.all_median_data = result_median_data;
	gait.MedianGait.result_mean_data = result_mean_data;
	
	gait.MedianGait.medianData = medianData
	
	gait.MedianGait.mean = []
	gait.MedianGait.median = []
	gait.MedianGait.max = []
	gait.MedianGait.min = []
	gait.MedianGait.std = []
	gait.MedianGait.area = []
	gait.MedianGait.percentile95 = []
	gait.MedianGait.percentile5 = []
	gait.MedianGait.timetoPeak = []
	
	for i = [1:66]
		gait.MedianGait.mean = [gait.MedianGait.mean mean(result_median_data(:,i))]
		gait.MedianGait.median = [gait.MedianGait.median median(result_median_data(:,i))]
		[v, k] = max(result_median_data(:,i))
		gait.MedianGait.max = [gait.MedianGait.max v]
		gait.MedianGait.timetoPeak = [gait.MedianGait.timetoPeak k]
		gait.MedianGait.min = [gait.MedianGait.min min(result_median_data(:,i))]
		gait.MedianGait.std = [gait.MedianGait.std std(result_median_data(:,i))]
		gait.MedianGait.percentile95 = [gait.MedianGait.percentile95 prctile(result_median_data(:,i), 95)]
		gait.MedianGait.percentile5 = [gait.MedianGait.percentile5 prctile(result_median_data(:,i), 5)]
		gait.MedianGait.area = [gait.MedianGait.area trapz( [1:100] , abs(result_median_data(:,i)))]
	end
	
	d = {'Joint', 'Parameter', 'Mean', 'Median', 'STDEV', 'P10', 'P90', 'Max','Min','TimeToPeak','Area'}
	%d = [d ; 'RightAnkle', 'X', gait.MedianGait.mean(49), gait.MedianGait.median(49), gait.MedianGait.std(49), gait.MedianGait.percentile5(49), gait.MedianGait.percentile95(49) ]
	%d = [d ; 'RightAnkle', 'Y', gait.MedianGait.mean(50), gait.MedianGait.median(50), gait.MedianGait.std(50), gait.MedianGait.percentile5(50), gait.MedianGait.percentile95(50) ]
	%d = [d ; 'RightAnkle', 'Z', gait.MedianGait.mean(51), gait.MedianGait.median(51), gait.MedianGait.std(51), gait.MedianGait.percentile5(51), gait.MedianGait.percentile95(51) ]	
	d(2,:) = {'LeftAnkle', 'X', gait.MedianGait.mean(61), gait.MedianGait.median(61), gait.MedianGait.std(61), gait.MedianGait.percentile5(61), gait.MedianGait.percentile95(61), gait.MedianGait.max(61), gait.MedianGait.min(61), gait.MedianGait.timetoPeak(61), gait.MedianGait.area(61) }
	d(3,:) = {'LeftAnkle', 'Y', gait.MedianGait.mean(62), gait.MedianGait.median(62), gait.MedianGait.std(62), gait.MedianGait.percentile5(62), gait.MedianGait.percentile95(62), gait.MedianGait.max(62), gait.MedianGait.min(62), gait.MedianGait.timetoPeak(62), gait.MedianGait.area(62) }
	d(4,:) = {'LeftAnkle', 'Z', gait.MedianGait.mean(63), gait.MedianGait.median(63), gait.MedianGait.std(63), gait.MedianGait.percentile5(63), gait.MedianGait.percentile95(63), gait.MedianGait.max(63), gait.MedianGait.min(63), gait.MedianGait.timetoPeak(63), gait.MedianGait.area(63) }
	d(5,:) = {'LeftKnee', 'X', gait.MedianGait.mean(58), gait.MedianGait.median(58), gait.MedianGait.std(58), gait.MedianGait.percentile5(58), gait.MedianGait.percentile95(58), gait.MedianGait.max(58), gait.MedianGait.min(58), gait.MedianGait.timetoPeak(58), gait.MedianGait.area(58) }
	d(6,:) = {'LeftKnee', 'Y', gait.MedianGait.mean(59), gait.MedianGait.median(59), gait.MedianGait.std(59), gait.MedianGait.percentile5(59), gait.MedianGait.percentile95(59), gait.MedianGait.max(59), gait.MedianGait.min(59), gait.MedianGait.timetoPeak(59), gait.MedianGait.area(59) }
	d(7,:) = {'LeftKnee', 'Z', gait.MedianGait.mean(60), gait.MedianGait.median(60), gait.MedianGait.std(60), gait.MedianGait.percentile5(60), gait.MedianGait.percentile95(60), gait.MedianGait.max(60), gait.MedianGait.min(60), gait.MedianGait.timetoPeak(60), gait.MedianGait.area(60) }
	d(8,:) = {'LeftHip', 'X', gait.MedianGait.mean(55), gait.MedianGait.median(55), gait.MedianGait.std(55), gait.MedianGait.percentile5(55), gait.MedianGait.percentile95(55), gait.MedianGait.max(55), gait.MedianGait.min(55), gait.MedianGait.timetoPeak(55), gait.MedianGait.area(55) }
	d(9,:) = {'LeftHip', 'Y', gait.MedianGait.mean(56), gait.MedianGait.median(56), gait.MedianGait.std(56), gait.MedianGait.percentile5(56), gait.MedianGait.percentile95(56), gait.MedianGait.max(56), gait.MedianGait.min(56), gait.MedianGait.timetoPeak(56), gait.MedianGait.area(56) }
	d(10,:) = {'LeftHip', 'Z', gait.MedianGait.mean(57), gait.MedianGait.median(57), gait.MedianGait.std(57), gait.MedianGait.percentile5(57), gait.MedianGait.percentile95(57), gait.MedianGait.max(57), gait.MedianGait.min(57), gait.MedianGait.timetoPeak(57), gait.MedianGait.area(57) }	
	xlswrite(strcat(gait.id ,'.xls'), d, 'MVN-Part');
	xlswrite(strcat(gait.id ,'.xls'), num2cell(gait.MedianGait.all_median_data), 'MVN-All');	
	
	%gait.MedianGait.mean = mean(result_median_data, 2)
	%gait.MedianGait.median = median(result_median_data, 2)
	%gait.MedianGait.std = std(result_median_data, 2)
	%gait.MedianGait.percentile95 = prctile(medianData(:,1), 95)
	%gait.MedianGait.percentile5 = prctile(medianData(:,1), 5)
	
	legend(h, s)
	
	hold off
    
end

