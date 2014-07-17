% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx
% 20140327.xlsx
% extractTimeDiff

ROOT_DIR = 'J:\Roliroli\S04\';
TEST_CASE_FILE = strcat(ROOT_DIR, 'autoSVMBuild.xlsx');

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

fprintf('Start \n');

for i = 1:size(TEST_CASE_LIST, 1)

	fprintf('Running Test Case %d \n', i);
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	
	fprintf('Load MVN Info %s \n', MVN_FILE_NAME);
	eventTimes = calcEventTimeByGaitRite(START_TIME, GAITRITE_FILE_NAME);
	OUT_FILE_NAME = strcat(ROOT_DIR, 'GAITRiteTime-', int2str(i), '.txt');
	temp = [eventTimes.TOs eventTimes.ICs];
	temp = sort(temp, 'ascend');
	dlmwrite(OUT_FILE_NAME, eventTimes.TOs);
	%dlmwrite(OUT_FILE_NAME, eventTimes.ICs);
	%dlmwrite(OUT_FILE_NAME, temp);
	
	%%%%%% Load Gait Information
	load(MVN_FILE_NAME);
	END_TIME = size(gait.acceleration, 1);
	
	%%%%%%% Prepare feature arrays & load signal & filter them here!
	FeatureInitFragment;
	
	%%%%%% Run algorithm and save
	%algorithm;
	%algorithm2;
	toAlgorithm;
	
	fprintf('Finish Test Case %d \n', i);
	
	
end

fprintf('Done \n');
%fprintf('Event Lost Rate: %d \n', eventLostCount / totalEventCount);