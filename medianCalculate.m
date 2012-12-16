function [ gait ] = medianCalculate(gait, choose)

	sampleRate = 100;

	if gait.LeftInitialContact(1) < gait.RightInitialContact(1)
		compareBy = 'L'
	else
		compareBy = 'R'
	end
	
	f = figure(1)
	cla
	hold all
	medianData = []

	for i = [1:length(choose)]
		
		if compareBy == 'R'
			y = gait.jointAngle([ gait.RightInitialContact(choose(i)) : gait.RightInitialContact(choose(i) + 1) ], 51);
			all_data = gait.jointAngle([ gait.RightInitialContact(choose(i)) : gait.RightInitialContact(choose(i) + 1) ], :);
		else
			y = gait.jointAngle([ gait.LeftInitialContact(choose(i)) : gait.LeftInitialContact(choose(i) + 1) ], 63);
			all_data = gait.jointAngle([ gait.LeftInitialContact(choose(i)) : gait.LeftInitialContact(choose(i) + 1) ], :);
		end
		
		% Resample
		y_resampled = resample(y, sampleRate, length(y));

		% Push Resample Data Into Array, Prepare For Median Caulcation
		medianData = [medianData y_resampled]		
		
		% all resample
		all_data_resampled = resample(all_data, sampleRate, size(all_data, 1));
		
		all_median_data{i} = all_data_resampled
		
		h(i) = plot([1:sampleRate], y_resampled);
		s{i} = sprintf('Cycle %d', choose(i));
	
	end
	
	medianData = median(medianData ,2)
	h(end+1) = plot([1:sampleRate], medianData(:,1));
	s{end+ 1} = sprintf('Median');
	legend(h, s)
	hold off	
	
	gait.MedianGait.allMedianData = []
	gait.MedianGait.allMedianData = all_median_data
	
	for i = [1:66]
		
		tmpCycleValue = []
		
		for j = [1:length(all_median_data)]
		
			tmpData = all_median_data{j}
			
			tmpCycleValue(:, j) = tmpData(:, i)
			
		end
		
		tmpCycleValue = median(tmpCycleValue, 2)
		
		result_median_data(:, i) = tmpCycleValue
	
	end

	gait.MedianGait.all_median_data = result_median_data;
	
	gait.MedianGait.mean = []
	gait.MedianGait.median = []
	gait.MedianGait.max = []
	gait.MedianGait.min = []
	gait.MedianGait.std = []
	gait.MedianGait.area = []
	gait.MedianGait.percentile90 = []
	gait.MedianGait.percentile10 = []
	gait.MedianGait.timetoPeak = []
	
	for i = [1:66]
		gait.MedianGait.mean = [gait.MedianGait.mean mean(result_median_data(:,i))]
		gait.MedianGait.median = [gait.MedianGait.median median(result_median_data(:,i))]
		[v, k] = max(result_median_data(:,i))
		gait.MedianGait.max = [gait.MedianGait.max v]
		gait.MedianGait.timetoPeak = [gait.MedianGait.timetoPeak k]
		gait.MedianGait.min = [gait.MedianGait.min min(result_median_data(:,i))]
		gait.MedianGait.std = [gait.MedianGait.std std(result_median_data(:,i))]
		gait.MedianGait.percentile90 = [gait.MedianGait.percentile90 prctile(result_median_data(:,i), 90)]
		gait.MedianGait.percentile10 = [gait.MedianGait.percentile10 prctile(result_median_data(:,i), 10)]
		gait.MedianGait.area = [gait.MedianGait.area trapz( [1:100] , abs(result_median_data(:,i)))]
	end
	
	d = {'Joint', 'Parameter', 'Mean', 'Median', 'STDEV', 'P10', 'P90', 'Max','Min','TimeToPeak','Area'}
	%d = [d ; 'RightAnkle', 'X', gait.MedianGait.mean(49), gait.MedianGait.median(49), gait.MedianGait.std(49), gait.MedianGait.percentile10(49), gait.MedianGait.percentile90(49) ]
	%d = [d ; 'RightAnkle', 'Y', gait.MedianGait.mean(50), gait.MedianGait.median(50), gait.MedianGait.std(50), gait.MedianGait.percentile10(50), gait.MedianGait.percentile90(50) ]
	%d = [d ; 'RightAnkle', 'Z', gait.MedianGait.mean(51), gait.MedianGait.median(51), gait.MedianGait.std(51), gait.MedianGait.percentile10(51), gait.MedianGait.percentile90(51) ]	
	d(2,:) = {'LeftAnkle', 'X', gait.MedianGait.mean(61), gait.MedianGait.median(61), gait.MedianGait.std(61), gait.MedianGait.percentile10(61), gait.MedianGait.percentile90(61), gait.MedianGait.max(61), gait.MedianGait.min(61), gait.MedianGait.timetoPeak(61), gait.MedianGait.area(61) }
	d(3,:) = {'LeftAnkle', 'Y', gait.MedianGait.mean(62), gait.MedianGait.median(62), gait.MedianGait.std(62), gait.MedianGait.percentile10(62), gait.MedianGait.percentile90(62), gait.MedianGait.max(62), gait.MedianGait.min(62), gait.MedianGait.timetoPeak(62), gait.MedianGait.area(62) }
	d(4,:) = {'LeftAnkle', 'Z', gait.MedianGait.mean(63), gait.MedianGait.median(63), gait.MedianGait.std(63), gait.MedianGait.percentile10(63), gait.MedianGait.percentile90(63), gait.MedianGait.max(63), gait.MedianGait.min(63), gait.MedianGait.timetoPeak(63), gait.MedianGait.area(63) }
	d(5,:) = {'LeftKnee', 'X', gait.MedianGait.mean(58), gait.MedianGait.median(58), gait.MedianGait.std(58), gait.MedianGait.percentile10(58), gait.MedianGait.percentile90(58), gait.MedianGait.max(58), gait.MedianGait.min(58), gait.MedianGait.timetoPeak(58), gait.MedianGait.area(58) }
	d(6,:) = {'LeftKnee', 'Y', gait.MedianGait.mean(59), gait.MedianGait.median(59), gait.MedianGait.std(59), gait.MedianGait.percentile10(59), gait.MedianGait.percentile90(59), gait.MedianGait.max(59), gait.MedianGait.min(59), gait.MedianGait.timetoPeak(59), gait.MedianGait.area(59) }
	d(7,:) = {'LeftKnee', 'Z', gait.MedianGait.mean(60), gait.MedianGait.median(60), gait.MedianGait.std(60), gait.MedianGait.percentile10(60), gait.MedianGait.percentile90(60), gait.MedianGait.max(60), gait.MedianGait.min(60), gait.MedianGait.timetoPeak(60), gait.MedianGait.area(60) }
	d(8,:) = {'LeftHip', 'X', gait.MedianGait.mean(55), gait.MedianGait.median(55), gait.MedianGait.std(55), gait.MedianGait.percentile10(55), gait.MedianGait.percentile90(55), gait.MedianGait.max(55), gait.MedianGait.min(55), gait.MedianGait.timetoPeak(55), gait.MedianGait.area(55) }
	d(9,:) = {'LeftHip', 'Y', gait.MedianGait.mean(56), gait.MedianGait.median(56), gait.MedianGait.std(56), gait.MedianGait.percentile10(56), gait.MedianGait.percentile90(56), gait.MedianGait.max(56), gait.MedianGait.min(56), gait.MedianGait.timetoPeak(56), gait.MedianGait.area(56) }
	d(10,:) = {'LeftHip', 'Z', gait.MedianGait.mean(57), gait.MedianGait.median(57), gait.MedianGait.std(57), gait.MedianGait.percentile10(57), gait.MedianGait.percentile90(57), gait.MedianGait.max(57), gait.MedianGait.min(57), gait.MedianGait.timetoPeak(57), gait.MedianGait.area(57) }	
	xlswrite(strcat(gait.id ,'.xls'), d, 'MVN-Part');
	xlswrite(strcat(gait.id ,'.xls'), num2cell(gait.MedianGait.all_median_data), 'MVN-All');		

end