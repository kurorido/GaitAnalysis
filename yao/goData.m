allCycleData = [];

% 101 x 66
allMedianCycleData = [];
allMeanCycleData = [];
allStdCycleData = [];

% 1 x 66
% max
% min
% area...
allMeanCycleDataMax = [];
allMeanCycleDataMin = [];
allMeanCycleDataPercentile95 = [];
allMeanCycleDataPercentile5 = [];
allMeanCycleDataArea = [];
allMeanCycleDataTimeToPeak = [];
allMeanCycleDataTimeToValley = [];
allStdCycleDataMean = [];
allMedianCycleDataMedian = [];
allMeanCycleDataMean = [];
allMeanCycleDataMedian = [];
allMeanCycleDataStd = [];

for i = 1 : size(gait.jointAngle, 2)

	tmpCycleData = [];
	
	if(~stair)
	
		for j = startContact : 2 : endContact
		
			s = IC_TIMES(j);
			e = IC_TIMES(j+2);
			
			target = gait.jointAngle(s:e, i);
			target = resample(target, 101, length(target));
			tmpCycleData = [tmpCycleData target];
			
		end
	else
		cylcesToPlot = [3,4,7,8];
		cycle = 1;
		for j = 1 : length(IC_TIMES) - 1
		
			s = IC_TIMES(j);
			e = IC_TIMES(j+1);
			
			target = gait.jointAngle(s:e, i);
			target = resample(target, 101, length(target));
			tmpCycleData = [tmpCycleData target];
		end
	end
	
	allCycleData{i} = tmpCycleData; % Save all cycles into a cell
	
	tmpMedianCycle = median(tmpCycleData, 2); % median all cycles into a cycle
	tmpMeanCycle = mean(tmpCycleData, 2); % mean all cycles into a cycle
	tmpStdCycle = std(tmpCycleData, 0, 2); % std all cycles into a cycle
	
	% for a cycle...each contain a normalized gait cycle (101 x 66)
	allMedianCycleData = [allMedianCycleData tmpMedianCycle]; % each joint have a median
	allMeanCycleData = [allMeanCycleData tmpMeanCycle]; % each joint have a mean
	allStdCycleData = [allStdCycleData tmpStdCycle]; % each joint have a std
	
	[v, k] = max(tmpMeanCycle);
	allMeanCycleDataMax = [allMeanCycleDataMax v];
	allMeanCycleDataTimeToPeak = [allMeanCycleDataTimeToPeak k];
	
	[v, k] = min(tmpMeanCycle);
	allMeanCycleDataMin = [allMeanCycleDataMin v];
	allMeanCycleDataTimeToValley = [allMeanCycleDataTimeToValley k];
	
	allMeanCycleDataPercentile95 = [allMeanCycleDataPercentile95  prctile(tmpMeanCycle , 95)];
	allMeanCycleDataPercentile5 = [allMeanCycleDataPercentile5 prctile(tmpMeanCycle, 5)];
	allMeanCycleDataArea = [allMeanCycleDataArea trapz( [1:101] , abs(tmpMeanCycle))];	
	
	allStdCycleDataMean = [allStdCycleDataMean mean(tmpStdCycle)];
	allMeanCycleDataMean = [allMeanCycleDataMean mean(tmpMeanCycle)];
	allMedianCycleDataMedian = [allMedianCycleDataMedian mean(tmpMedianCycle)];
	allMeanCycleDataMedian = [allMeanCycleDataMedian median(tmpMeanCycle)];
	allMeanCycleDataStd = [allMeanCycleDataStd std(tmpMeanCycle)];
	
end

d = {'Joint', 'Parameter', 'Mean', 'Median', 'STDEV', 'P5', 'P95', 'Max','Min','TimeToPeak','Area', 'TimeToValley','STD_MEAN'};
d(2,:) = {'Ankle', 'X', allMeanCycleDataMean(ankleX), allMedianCycleData(ankleX), allMeanCycleDataStd(ankleX), allMeanCycleDataPercentile5(ankleX), allMeanCycleDataPercentile95(ankleX), allMeanCycleDataMax(ankleX), allMeanCycleDataMin(ankleX), allMeanCycleDataTimeToPeak(ankleX), allMeanCycleDataArea(ankleX),  allMeanCycleDataTimeToValley(ankleX), allStdCycleDataMean(ankleX)};
d(3,:) = {'Ankle', 'Y', allMeanCycleDataMean(ankleY), allMedianCycleData(ankleY), allMeanCycleDataStd(ankleY), allMeanCycleDataPercentile5(ankleY), allMeanCycleDataPercentile95(ankleY), allMeanCycleDataMax(ankleY), allMeanCycleDataMin(ankleY), allMeanCycleDataTimeToPeak(ankleY), allMeanCycleDataArea(ankleY), allMeanCycleDataTimeToValley(ankleY), allStdCycleDataMean(ankleY)};
d(4,:) = {'Ankle', 'Z', allMeanCycleDataMean(ankleZ), allMedianCycleData(ankleZ), allMeanCycleDataStd(ankleZ), allMeanCycleDataPercentile5(ankleZ), allMeanCycleDataPercentile95(ankleZ), allMeanCycleDataMax(ankleZ), allMeanCycleDataMin(ankleZ), allMeanCycleDataTimeToPeak(ankleZ), allMeanCycleDataArea(ankleZ), allMeanCycleDataTimeToValley(ankleZ), allStdCycleDataMean(ankleZ)};
d(5,:) = {'Knee', 'X', allMeanCycleDataMean(kneeX), allMedianCycleData(kneeX), allMeanCycleDataStd(kneeX), allMeanCycleDataPercentile5(kneeX), allMeanCycleDataPercentile95(kneeX), allMeanCycleDataMax(kneeX), allMeanCycleDataMin(kneeX), allMeanCycleDataTimeToPeak(kneeX), allMeanCycleDataArea(kneeX), allMeanCycleDataTimeToValley(kneeX), allStdCycleDataMean(kneeX)};
d(6,:) = {'Knee', 'Y', allMeanCycleDataMean(kneeY), allMedianCycleData(kneeY), allMeanCycleDataStd(kneeY), allMeanCycleDataPercentile5(kneeY), allMeanCycleDataPercentile95(kneeY), allMeanCycleDataMax(kneeY), allMeanCycleDataMin(kneeY), allMeanCycleDataTimeToPeak(kneeY), allMeanCycleDataArea(kneeY), allMeanCycleDataTimeToValley(kneeY), allStdCycleDataMean(kneeY)};
d(7,:) = {'Knee', 'Z', allMeanCycleDataMean(kneeZ), allMedianCycleData(kneeZ), allMeanCycleDataStd(kneeZ), allMeanCycleDataPercentile5(kneeZ), allMeanCycleDataPercentile95(kneeZ), allMeanCycleDataMax(kneeZ), allMeanCycleDataMin(kneeZ), allMeanCycleDataTimeToPeak(kneeZ), allMeanCycleDataArea(kneeZ), allMeanCycleDataTimeToValley(kneeZ), allStdCycleDataMean(kneeZ)};
d(8,:) = {'Hip', 'X', allMeanCycleDataMean(hipX), allMedianCycleData(hipX), allMeanCycleDataStd(hipX), allMeanCycleDataPercentile5(hipX), allMeanCycleDataPercentile95(hipX), allMeanCycleDataMax(hipX), allMeanCycleDataMin(hipX), allMeanCycleDataTimeToPeak(hipX), allMeanCycleDataArea(hipX), allMeanCycleDataTimeToValley(hipX), allStdCycleDataMean(hipX)};
d(9,:) = {'Hip', 'Y', allMeanCycleDataMean(hipY), allMedianCycleData(hipY), allMeanCycleDataStd(hipY), allMeanCycleDataPercentile5(hipY), allMeanCycleDataPercentile95(hipY), allMeanCycleDataMax(hipY), allMeanCycleDataMin(hipY), allMeanCycleDataTimeToPeak(hipY), allMeanCycleDataArea(hipY), allMeanCycleDataTimeToValley(hipY), allStdCycleDataMean(hipY)};
d(10,:) = {'Hip', 'Z', allMeanCycleDataMean(hipZ), allMedianCycleData(hipZ), allMeanCycleDataStd(hipZ), allMeanCycleDataPercentile5(hipZ), allMeanCycleDataPercentile95(hipZ), allMeanCycleDataMax(hipZ), allMeanCycleDataMin(hipZ), allMeanCycleDataTimeToPeak(hipZ), allMeanCycleDataArea(hipZ), allMeanCycleDataTimeToValley(hipZ), allStdCycleDataMean(hipZ)}	;
d(11,:) = {'C7Shoulder', 'X', allMeanCycleDataMean(c7ShoulderX), allMedianCycleData(c7ShoulderX), allMeanCycleDataStd(c7ShoulderX), allMeanCycleDataPercentile5(c7ShoulderX), allMeanCycleDataPercentile95(c7ShoulderX), allMeanCycleDataMax(c7ShoulderX), allMeanCycleDataMin(c7ShoulderX), allMeanCycleDataTimeToPeak(c7ShoulderX), allMeanCycleDataArea(c7ShoulderX), allMeanCycleDataTimeToValley(c7ShoulderX), allStdCycleDataMean(c7ShoulderX)};
d(12,:) = {'C7Shoulder', 'Y', allMeanCycleDataMean(c7ShoulderY), allMedianCycleData(c7ShoulderY), allMeanCycleDataStd(c7ShoulderY), allMeanCycleDataPercentile5(c7ShoulderY), allMeanCycleDataPercentile95(c7ShoulderY), allMeanCycleDataMax(c7ShoulderY), allMeanCycleDataMin(c7ShoulderY), allMeanCycleDataTimeToPeak(c7ShoulderY), allMeanCycleDataArea(c7ShoulderY), allMeanCycleDataTimeToValley(c7ShoulderY), allStdCycleDataMean(c7ShoulderY)};
d(13,:) = {'C7Shoulder', 'Z', allMeanCycleDataMean(c7ShoulderZ), allMedianCycleData(c7ShoulderZ), allMeanCycleDataStd(c7ShoulderZ), allMeanCycleDataPercentile5(c7ShoulderZ), allMeanCycleDataPercentile95(c7ShoulderZ), allMeanCycleDataMax(c7ShoulderZ), allMeanCycleDataMin(c7ShoulderZ), allMeanCycleDataTimeToPeak(c7ShoulderZ), allMeanCycleDataArea(c7ShoulderZ), allMeanCycleDataTimeToValley(c7ShoulderZ), allStdCycleDataMean(c7ShoulderZ)}	;
d(14,:) = {'Shoulder', 'X', allMeanCycleDataMean(shoulderX), allMedianCycleData(shoulderX), allMeanCycleDataStd(shoulderX), allMeanCycleDataPercentile5(shoulderX), allMeanCycleDataPercentile95(shoulderX), allMeanCycleDataMax(shoulderX), allMeanCycleDataMin(shoulderX), allMeanCycleDataTimeToPeak(shoulderX), allMeanCycleDataArea(shoulderX), allMeanCycleDataTimeToValley(shoulderX), allStdCycleDataMean(shoulderX)};
d(15,:) = {'Shoulder', 'Y', allMeanCycleDataMean(shoulderY), allMedianCycleData(shoulderY), allMeanCycleDataStd(shoulderY), allMeanCycleDataPercentile5(shoulderY), allMeanCycleDataPercentile95(shoulderY), allMeanCycleDataMax(shoulderY), allMeanCycleDataMin(shoulderY), allMeanCycleDataTimeToPeak(shoulderY), allMeanCycleDataArea(shoulderY), allMeanCycleDataTimeToValley(shoulderY), allStdCycleDataMean(shoulderY)};
d(16,:) = {'Shoulder', 'Z', allMeanCycleDataMean(shoulderZ), allMedianCycleData(shoulderZ), allMeanCycleDataStd(shoulderZ), allMeanCycleDataPercentile5(shoulderZ), allMeanCycleDataPercentile95(shoulderZ), allMeanCycleDataMax(shoulderZ), allMeanCycleDataMin(shoulderZ), allMeanCycleDataTimeToPeak(shoulderZ), allMeanCycleDataArea(shoulderZ), allMeanCycleDataTimeToValley(shoulderZ), allStdCycleDataMean(shoulderZ)}	;
d(17,:) = {'L5S1', 'X', allMeanCycleDataMean(l5s1X), allMedianCycleData(l5s1X), allMeanCycleDataStd(l5s1X), allMeanCycleDataPercentile5(l5s1X), allMeanCycleDataPercentile95(l5s1X), allMeanCycleDataMax(l5s1X), allMeanCycleDataMin(l5s1X), allMeanCycleDataTimeToPeak(l5s1X), allMeanCycleDataArea(l5s1X), allMeanCycleDataTimeToValley(l5s1X), allStdCycleDataMean(l5s1X)};
d(18,:) = {'L5S1', 'Y', allMeanCycleDataMean(l5s1Y), allMedianCycleData(l5s1Y), allMeanCycleDataStd(l5s1Y), allMeanCycleDataPercentile5(l5s1Y), allMeanCycleDataPercentile95(l5s1Y), allMeanCycleDataMax(l5s1Y), allMeanCycleDataMin(l5s1Y), allMeanCycleDataTimeToPeak(l5s1Y), allMeanCycleDataArea(l5s1Y), allMeanCycleDataTimeToValley(l5s1Y), allStdCycleDataMean(l5s1Y)};
d(19,:) = {'L5S1', 'Z', allMeanCycleDataMean(l5s1Z), allMedianCycleData(l5s1Z), allMeanCycleDataStd(l5s1Z), allMeanCycleDataPercentile5(l5s1Z), allMeanCycleDataPercentile95(l5s1Z), allMeanCycleDataMax(l5s1Z), allMeanCycleDataMin(l5s1Z), allMeanCycleDataTimeToPeak(l5s1Z), allMeanCycleDataArea(l5s1Z), allMeanCycleDataTimeToValley(l5s1Z), allStdCycleDataMean(l5s1Z)};

xlswrite(strcat(DATA_DIR, '\result.xls'), d, 'MVN-Part');
xlswrite(strcat(DATA_DIR, '\result.xls'), num2cell(allMeanCycleData), 'MVN-Mean');	
xlswrite(strcat(DATA_DIR, '\result.xls'), num2cell(allStdCycleData), 'MVN-STD');
xlswrite(strcat(DATA_DIR, '\result.xls'), num2cell(allMedianCycleData), 'MVN-Median');
% C7Shoulder Angle X,Y,Z
% Right Shoulder Angle X,Y,Z
% L5S1 Angle X,Y,Z
% Ankle Angle X,Y,Z
% Hip Angle X,Y,Z
% Knee Angle X,Y,Z
% Foot Angle X,Y,Z

plotCycle(allCycleData, 'Hip-X', hipX, DATA_DIR);
plotCycle(allCycleData, 'Hip-Y', hipY, DATA_DIR);
plotCycle(allCycleData, 'Hip-Z', hipZ, DATA_DIR);
plotCycle(allCycleData, 'Knee-X', kneeX, DATA_DIR);
plotCycle(allCycleData, 'Knee-Y', kneeY, DATA_DIR);
plotCycle(allCycleData, 'Knee-Z', kneeZ, DATA_DIR);
close all;
plotCycle(allCycleData, 'Ankle-X', ankleX, DATA_DIR);
plotCycle(allCycleData, 'Ankle-Y', ankleY, DATA_DIR);
plotCycle(allCycleData, 'Ankle-Z', ankleZ, DATA_DIR);
close all;
plotCycle(allCycleData, 'Shoulder-X', shoulderX, DATA_DIR);
plotCycle(allCycleData, 'Shoulder-Y', shoulderY, DATA_DIR);
plotCycle(allCycleData, 'Shoulder-Z', shoulderZ, DATA_DIR);
plotCycle(allCycleData, 'C7Shoulder-X', c7ShoulderX, DATA_DIR);
plotCycle(allCycleData, 'C7Shoulder-Y', c7ShoulderY, DATA_DIR);
plotCycle(allCycleData, 'C7Shoulder-Z', c7ShoulderZ, DATA_DIR);
close all;
plotCycle(allCycleData, 'L5S1-X', l5s1X, DATA_DIR);
plotCycle(allCycleData, 'L5S1-Y', l5s1Y, DATA_DIR);
plotCycle(allCycleData, 'L5S1-Z', l5s1Z, DATA_DIR);
close all;
	
% Plot all cycle in one and save
plotAllInOne(allCycleData, 'Hip-X', hipX, DATA_DIR);
plotAllInOne(allCycleData, 'Hip-Y', hipY, DATA_DIR);
plotAllInOne(allCycleData, 'Hip-Z', hipZ, DATA_DIR);
plotAllInOne(allCycleData, 'Knee-X', kneeX, DATA_DIR);
plotAllInOne(allCycleData, 'Knee-Y', kneeY, DATA_DIR);
plotAllInOne(allCycleData, 'Knee-Z', kneeZ, DATA_DIR);
plotAllInOne(allCycleData, 'Ankle-X', ankleX, DATA_DIR);
plotAllInOne(allCycleData, 'Ankle-Y', ankleY, DATA_DIR);
plotAllInOne(allCycleData, 'Ankle-Z', ankleZ, DATA_DIR);
plotAllInOne(allCycleData, 'Shoulder-X', shoulderX, DATA_DIR);
plotAllInOne(allCycleData, 'Shoulder-Y', shoulderY, DATA_DIR);
plotAllInOne(allCycleData, 'Shoulder-Z', shoulderZ, DATA_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-X', c7ShoulderX, DATA_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-Y', c7ShoulderY, DATA_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-Z', c7ShoulderZ, DATA_DIR);
plotAllInOne(allCycleData, 'L5S1-X', l5s1X, DATA_DIR);
plotAllInOne(allCycleData, 'L5S1-Y', l5s1Y, DATA_DIR);
plotAllInOne(allCycleData, 'L5S1-Z', l5s1Z, DATA_DIR);	
close all;


%figure('name', 'Mean-Cycle');
%meanCycle = mean(cycleData, 2);
%hold on;
%axis([0 101 min(meanCycle)*1.5 max(meanCycle)*1.5]);
%plot(1:101, meanCycle);
%
%figure('name', 'Median-Cycle');
%hold on;
%medianCycle = median(cycleData, 2);
%axis([0 101 min(medianCycle)*1.5 max(medianCycle)*1.5]);
%plot(1:101, medianCycle);
%
%% plot all cycle in one
%figure('name', 'All-Cycle');
%for i = 1 : length(cycleData)
%	plot(1:length(cycleData), cycleData);	
%end
%plot(1:101, meanCycle);