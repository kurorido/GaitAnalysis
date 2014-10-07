%mode = 2;
%cycles = [3,4,5];

OUT_DIR = strcat(DATA_DIR, '\', modeArr{mode});
mkdir(OUT_DIR);

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
allRatioOfVar = [];

for i = 1 : size(gait.jointAngle, 2)

	tmpCycleData = [];
	
	for cc = cycles
		
		if(mode == wholeCycle)
			j = 2 * cc - 1;
			startIC = IC_TIMES(j);
			endIC = IC_TIMES(j+2);
			target = gait.jointAngle(startIC:endIC, i);
		elseif(mode == doubleSupportOne)
			j = 2 * cc - 1;
			startIC = IC_TIMES(j);
			firstTO = TO_TIMES(j);
			target = gait.jointAngle(startIC:firstTO, i);	
		elseif(mode == stancePhase)
			j = 2 * cc - 1;
			firstTO = TO_TIMES(j);
			middleIC = IC_TIMES(j+1);			
			target = gait.jointAngle(firstTO:middleIC, i);
		elseif(mode == doubleSupportTwo)
			j = 2 * cc - 1;
			middleIC = IC_TIMES(j+1);
			secondTO = TO_TIMES(j+1);			
			target = gait.jointAngle(middleIC:secondTO, i);
		elseif(mode == swingPhase)
			j = 2 * cc - 1;
			secondTO = TO_TIMES(j+1);
			endIC = IC_TIMES(j+2);
			target = gait.jointAngle(secondTO:endIC, i);
		elseif(mode == stair)
			j = cc;
			startIC = IC_TIMES(j);
			endIC = IC_TIMES(j+1);
			target = gait.jointAngle(startIC:endIC, i);	
		end
		
		target = resample(target, 101, length(target));
		tmpCycleData = [tmpCycleData target];				
		
	end
	
	allCycleData{i} = tmpCycleData;
	
	tmpMedianCycle = median(tmpCycleData, 2); % median all cycles into a cycle
	tmpMeanCycle = mean(tmpCycleData, 2); % mean all cycles into a cycle
	tmpStdCycle = std(tmpCycleData, 0, 1); % std each cycle individually
	
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

	tmpMean = mean(tmpCycleData, 1); % mean each cycle individually
	minMean = min(tmpMean);
	maxMean = max(tmpMean);	
	rv = mean(tmpStdCycle) / (maxMean - minMean);
	allRatioOfVar = [allRatioOfVar rv];
	
end

segmentTexts = {'Ankle', 'Knee', 'Hip', 'C7Shoulder', 'Shoulder', 'L5S1'};
segmenetsIDs = [ankleX, ankleY, ankleZ, kneeX, kneeY, kneeZ, hipX, hipY, hipZ, c7ShoulderX, c7ShoulderY, c7ShoulderZ, shoulderX, shoulderY, shoulderZ, l5s1X, l5s1Y, l5s1Z];
directionTexts = {'Y', 'Z', 'X'};

d = {'Joint', 'Parameter', 'Mean', 'Median', 'STDEV', 'P5', 'P95', 'Max','Min','TimeToPeak','Area', 'TimeToValley','STD_MEAN', 'Ratio of Variability'};

rowPos = 1;
segPos = 1;
for segement = segmenetsIDs

	d(rowPos + 1, 1) = segmentTexts(segPos);
	d(rowPos + 1, 2) = directionTexts(mod(rowPos, 3) + 1);
	d(rowPos + 1, 3) = { allMeanCycleDataMean(segement) };
	d(rowPos + 1, 4) = { allMedianCycleData(segement) };
	d(rowPos + 1, 5) = { allMeanCycleDataStd(segement) };
	d(rowPos + 1, 6) = { allMeanCycleDataPercentile5(segement) };
	d(rowPos + 1, 7) = { allMeanCycleDataPercentile95(segement) };
	d(rowPos + 1, 8) = { allMeanCycleDataMax(segement) };
	d(rowPos + 1, 9) = { allMeanCycleDataMin(segement) };
	d(rowPos + 1, 10) = { allMeanCycleDataTimeToPeak(segement) };
	d(rowPos + 1, 11) = { allMeanCycleDataArea(segement) };
	d(rowPos + 1, 12) = { allMeanCycleDataTimeToValley(segement) };
	d(rowPos + 1, 13) = { allStdCycleDataMean(segement) };
	d(rowPos + 1, 14) = { allRatioOfVar(segement) };
	
	% Next Segments?
	if mod(rowPos, 3) == 0
		segPos = segPos + 1;
	end	
	
	rowPos = rowPos + 1;

end


%d(2,:) = {'Ankle', 'X', allMeanCycleDataMean(ankleX), allMedianCycleData(ankleX), allMeanCycleDataStd(ankleX), allMeanCycleDataPercentile5(ankleX), allMeanCycleDataPercentile95(ankleX), allMeanCycleDataMax(ankleX), allMeanCycleDataMin(ankleX), allMeanCycleDataTimeToPeak(ankleX), allMeanCycleDataArea(ankleX),  allMeanCycleDataTimeToValley(ankleX), allStdCycleDataMean(ankleX), allRatioOfVar(ankleX)};
%d(3,:) = {'Ankle', 'Y', allMeanCycleDataMean(ankleY), allMedianCycleData(ankleY), allMeanCycleDataStd(ankleY), allMeanCycleDataPercentile5(ankleY), allMeanCycleDataPercentile95(ankleY), allMeanCycleDataMax(ankleY), allMeanCycleDataMin(ankleY), allMeanCycleDataTimeToPeak(ankleY), allMeanCycleDataArea(ankleY), allMeanCycleDataTimeToValley(ankleY), allStdCycleDataMean(ankleY), allRatioOfVar(ankleY)};
%d(4,:) = {'Ankle', 'Z', allMeanCycleDataMean(ankleZ), allMedianCycleData(ankleZ), allMeanCycleDataStd(ankleZ), allMeanCycleDataPercentile5(ankleZ), allMeanCycleDataPercentile95(ankleZ), allMeanCycleDataMax(ankleZ), allMeanCycleDataMin(ankleZ), allMeanCycleDataTimeToPeak(ankleZ), allMeanCycleDataArea(ankleZ), allMeanCycleDataTimeToValley(ankleZ), allStdCycleDataMean(ankleZ), allRatioOfVar(ankleZ)};
%d(5,:) = {'Knee', 'X', allMeanCycleDataMean(kneeX), allMedianCycleData(kneeX), allMeanCycleDataStd(kneeX), allMeanCycleDataPercentile5(kneeX), allMeanCycleDataPercentile95(kneeX), allMeanCycleDataMax(kneeX), allMeanCycleDataMin(kneeX), allMeanCycleDataTimeToPeak(kneeX), allMeanCycleDataArea(kneeX), allMeanCycleDataTimeToValley(kneeX), allStdCycleDataMean(kneeX), allRatioOfVar(kneeX)};
%d(6,:) = {'Knee', 'Y', allMeanCycleDataMean(kneeY), allMedianCycleData(kneeY), allMeanCycleDataStd(kneeY), allMeanCycleDataPercentile5(kneeY), allMeanCycleDataPercentile95(kneeY), allMeanCycleDataMax(kneeY), allMeanCycleDataMin(kneeY), allMeanCycleDataTimeToPeak(kneeY), allMeanCycleDataArea(kneeY), allMeanCycleDataTimeToValley(kneeY), allStdCycleDataMean(kneeY), allRatioOfVar(kneeY)};
%d(7,:) = {'Knee', 'Z', allMeanCycleDataMean(kneeZ), allMedianCycleData(kneeZ), allMeanCycleDataStd(kneeZ), allMeanCycleDataPercentile5(kneeZ), allMeanCycleDataPercentile95(kneeZ), allMeanCycleDataMax(kneeZ), allMeanCycleDataMin(kneeZ), allMeanCycleDataTimeToPeak(kneeZ), allMeanCycleDataArea(kneeZ), allMeanCycleDataTimeToValley(kneeZ), allStdCycleDataMean(kneeZ), allRatioOfVar(kneeZ)};
%d(8,:) = {'Hip', 'X', allMeanCycleDataMean(hipX), allMedianCycleData(hipX), allMeanCycleDataStd(hipX), allMeanCycleDataPercentile5(hipX), allMeanCycleDataPercentile95(hipX), allMeanCycleDataMax(hipX), allMeanCycleDataMin(hipX), allMeanCycleDataTimeToPeak(hipX), allMeanCycleDataArea(hipX), allMeanCycleDataTimeToValley(hipX), allStdCycleDataMean(hipX), allRatioOfVar(hipX)};
%d(9,:) = {'Hip', 'Y', allMeanCycleDataMean(hipY), allMedianCycleData(hipY), allMeanCycleDataStd(hipY), allMeanCycleDataPercentile5(hipY), allMeanCycleDataPercentile95(hipY), allMeanCycleDataMax(hipY), allMeanCycleDataMin(hipY), allMeanCycleDataTimeToPeak(hipY), allMeanCycleDataArea(hipY), allMeanCycleDataTimeToValley(hipY), allStdCycleDataMean(hipY), allRatioOfVar(hipY)};
%d(10,:) = {'Hip', 'Z', allMeanCycleDataMean(hipZ), allMedianCycleData(hipZ), allMeanCycleDataStd(hipZ), allMeanCycleDataPercentile5(hipZ), allMeanCycleDataPercentile95(hipZ), allMeanCycleDataMax(hipZ), allMeanCycleDataMin(hipZ), allMeanCycleDataTimeToPeak(hipZ), allMeanCycleDataArea(hipZ), allMeanCycleDataTimeToValley(hipZ), allStdCycleDataMean(hipZ), allRatioOfVar(hipZ)}	;
%d(11,:) = {'C7Shoulder', 'X', allMeanCycleDataMean(c7ShoulderX), allMedianCycleData(c7ShoulderX), allMeanCycleDataStd(c7ShoulderX), allMeanCycleDataPercentile5(c7ShoulderX), allMeanCycleDataPercentile95(c7ShoulderX), allMeanCycleDataMax(c7ShoulderX), allMeanCycleDataMin(c7ShoulderX), allMeanCycleDataTimeToPeak(c7ShoulderX), allMeanCycleDataArea(c7ShoulderX), allMeanCycleDataTimeToValley(c7ShoulderX), allStdCycleDataMean(c7ShoulderX)};
%d(12,:) = {'C7Shoulder', 'Y', allMeanCycleDataMean(c7ShoulderY), allMedianCycleData(c7ShoulderY), allMeanCycleDataStd(c7ShoulderY), allMeanCycleDataPercentile5(c7ShoulderY), allMeanCycleDataPercentile95(c7ShoulderY), allMeanCycleDataMax(c7ShoulderY), allMeanCycleDataMin(c7ShoulderY), allMeanCycleDataTimeToPeak(c7ShoulderY), allMeanCycleDataArea(c7ShoulderY), allMeanCycleDataTimeToValley(c7ShoulderY), allStdCycleDataMean(c7ShoulderY)};
%d(13,:) = {'C7Shoulder', 'Z', allMeanCycleDataMean(c7ShoulderZ), allMedianCycleData(c7ShoulderZ), allMeanCycleDataStd(c7ShoulderZ), allMeanCycleDataPercentile5(c7ShoulderZ), allMeanCycleDataPercentile95(c7ShoulderZ), allMeanCycleDataMax(c7ShoulderZ), allMeanCycleDataMin(c7ShoulderZ), allMeanCycleDataTimeToPeak(c7ShoulderZ), allMeanCycleDataArea(c7ShoulderZ), allMeanCycleDataTimeToValley(c7ShoulderZ), allStdCycleDataMean(c7ShoulderZ)}	;
%d(14,:) = {'Shoulder', 'X', allMeanCycleDataMean(shoulderX), allMedianCycleData(shoulderX), allMeanCycleDataStd(shoulderX), allMeanCycleDataPercentile5(shoulderX), allMeanCycleDataPercentile95(shoulderX), allMeanCycleDataMax(shoulderX), allMeanCycleDataMin(shoulderX), allMeanCycleDataTimeToPeak(shoulderX), allMeanCycleDataArea(shoulderX), allMeanCycleDataTimeToValley(shoulderX), allStdCycleDataMean(shoulderX)};
%d(15,:) = {'Shoulder', 'Y', allMeanCycleDataMean(shoulderY), allMedianCycleData(shoulderY), allMeanCycleDataStd(shoulderY), allMeanCycleDataPercentile5(shoulderY), allMeanCycleDataPercentile95(shoulderY), allMeanCycleDataMax(shoulderY), allMeanCycleDataMin(shoulderY), allMeanCycleDataTimeToPeak(shoulderY), allMeanCycleDataArea(shoulderY), allMeanCycleDataTimeToValley(shoulderY), allStdCycleDataMean(shoulderY)};
%d(16,:) = {'Shoulder', 'Z', allMeanCycleDataMean(shoulderZ), allMedianCycleData(shoulderZ), allMeanCycleDataStd(shoulderZ), allMeanCycleDataPercentile5(shoulderZ), allMeanCycleDataPercentile95(shoulderZ), allMeanCycleDataMax(shoulderZ), allMeanCycleDataMin(shoulderZ), allMeanCycleDataTimeToPeak(shoulderZ), allMeanCycleDataArea(shoulderZ), allMeanCycleDataTimeToValley(shoulderZ), allStdCycleDataMean(shoulderZ)}	;
%d(17,:) = {'L5S1', 'X', allMeanCycleDataMean(l5s1X), allMedianCycleData(l5s1X), allMeanCycleDataStd(l5s1X), allMeanCycleDataPercentile5(l5s1X), allMeanCycleDataPercentile95(l5s1X), allMeanCycleDataMax(l5s1X), allMeanCycleDataMin(l5s1X), allMeanCycleDataTimeToPeak(l5s1X), allMeanCycleDataArea(l5s1X), allMeanCycleDataTimeToValley(l5s1X), allStdCycleDataMean(l5s1X)};
%d(18,:) = {'L5S1', 'Y', allMeanCycleDataMean(l5s1Y), allMedianCycleData(l5s1Y), allMeanCycleDataStd(l5s1Y), allMeanCycleDataPercentile5(l5s1Y), allMeanCycleDataPercentile95(l5s1Y), allMeanCycleDataMax(l5s1Y), allMeanCycleDataMin(l5s1Y), allMeanCycleDataTimeToPeak(l5s1Y), allMeanCycleDataArea(l5s1Y), allMeanCycleDataTimeToValley(l5s1Y), allStdCycleDataMean(l5s1Y)};
%d(19,:) = {'L5S1', 'Z', allMeanCycleDataMean(l5s1Z), allMedianCycleData(l5s1Z), allMeanCycleDataStd(l5s1Z), allMeanCycleDataPercentile5(l5s1Z), allMeanCycleDataPercentile95(l5s1Z), allMeanCycleDataMax(l5s1Z), allMeanCycleDataMin(l5s1Z), allMeanCycleDataTimeToPeak(l5s1Z), allMeanCycleDataArea(l5s1Z), allMeanCycleDataTimeToValley(l5s1Z), allStdCycleDataMean(l5s1Z)};

xlswrite(strcat(OUT_DIR, '\result.xls'), d, 'MVN-Part');
xlswrite(strcat(OUT_DIR, '\result.xls'), num2cell(allMeanCycleData), 'MVN-Mean');	
%xlswrite(strcat(OUT_DIR, '\result.xls'), num2cell(allStdCycleData), 'MVN-STD');
xlswrite(strcat(OUT_DIR, '\result.xls'), num2cell(allMedianCycleData), 'MVN-Median');
% C7Shoulder Angle X,Y,Z
% Right Shoulder Angle X,Y,Z
% L5S1 Angle X,Y,Z
% Ankle Angle X,Y,Z
% Hip Angle X,Y,Z
% Knee Angle X,Y,Z
% Foot Angle X,Y,Z

plotCycle(allCycleData, 'Hip-X', hipX, OUT_DIR);
plotCycle(allCycleData, 'Hip-Y', hipY, OUT_DIR);
plotCycle(allCycleData, 'Hip-Z', hipZ, OUT_DIR);
plotCycle(allCycleData, 'Knee-X', kneeX, OUT_DIR);
plotCycle(allCycleData, 'Knee-Y', kneeY, OUT_DIR);
plotCycle(allCycleData, 'Knee-Z', kneeZ, OUT_DIR);
close all;
plotCycle(allCycleData, 'Ankle-X', ankleX, OUT_DIR);
plotCycle(allCycleData, 'Ankle-Y', ankleY, OUT_DIR);
plotCycle(allCycleData, 'Ankle-Z', ankleZ, OUT_DIR);
close all;
plotCycle(allCycleData, 'Shoulder-X', shoulderX, OUT_DIR);
plotCycle(allCycleData, 'Shoulder-Y', shoulderY, OUT_DIR);
plotCycle(allCycleData, 'Shoulder-Z', shoulderZ, OUT_DIR);
plotCycle(allCycleData, 'C7Shoulder-X', c7ShoulderX, OUT_DIR);
plotCycle(allCycleData, 'C7Shoulder-Y', c7ShoulderY, OUT_DIR);
plotCycle(allCycleData, 'C7Shoulder-Z', c7ShoulderZ, OUT_DIR);
close all;
plotCycle(allCycleData, 'L5S1-X', l5s1X, OUT_DIR);
plotCycle(allCycleData, 'L5S1-Y', l5s1Y, OUT_DIR);
plotCycle(allCycleData, 'L5S1-Z', l5s1Z, OUT_DIR);
close all;
	
% Plot all cycle in one and save
plotAllInOne(allCycleData, 'Hip-X', hipX, OUT_DIR);
plotAllInOne(allCycleData, 'Hip-Y', hipY, OUT_DIR);
plotAllInOne(allCycleData, 'Hip-Z', hipZ, OUT_DIR);
plotAllInOne(allCycleData, 'Knee-X', kneeX, OUT_DIR);
plotAllInOne(allCycleData, 'Knee-Y', kneeY, OUT_DIR);
plotAllInOne(allCycleData, 'Knee-Z', kneeZ, OUT_DIR);
plotAllInOne(allCycleData, 'Ankle-X', ankleX, OUT_DIR);
plotAllInOne(allCycleData, 'Ankle-Y', ankleY, OUT_DIR);
plotAllInOne(allCycleData, 'Ankle-Z', ankleZ, OUT_DIR);
plotAllInOne(allCycleData, 'Shoulder-X', shoulderX, OUT_DIR);
plotAllInOne(allCycleData, 'Shoulder-Y', shoulderY, OUT_DIR);
plotAllInOne(allCycleData, 'Shoulder-Z', shoulderZ, OUT_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-X', c7ShoulderX, OUT_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-Y', c7ShoulderY, OUT_DIR);
plotAllInOne(allCycleData, 'C7Shoulder-Z', c7ShoulderZ, OUT_DIR);
plotAllInOne(allCycleData, 'L5S1-X', l5s1X, OUT_DIR);
plotAllInOne(allCycleData, 'L5S1-Y', l5s1Y, OUT_DIR);
plotAllInOne(allCycleData, 'L5S1-Z', l5s1Z, OUT_DIR);	
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