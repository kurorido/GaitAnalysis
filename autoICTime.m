TEST_CASE_FILE = strcat(ROOT_DIR, 'autoSVMBuild.xlsx');

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

fprintf('Start Initial Contact Detection (Simple Method)...\n');

for i = 1:size(TEST_CASE_LIST, 1)
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	
	fprintf('Running Test Case %s \n', MVN_FILE_NAME);
	
	eventTimes = parseGAITRiteEventTime(START_TIME, GAITRITE_FILE_NAME);
	OUT_FILE_NAME = strcat(ROOT_DIR, '/IC-Time/GAITRiteTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, eventTimes.ICs);
	
	%%%%%% Load Gait Information
	load(MVN_FILE_NAME);
	END_TIME = size(gait.acceleration, 1);
	
	%%%%%%% Prepare feature arrays & load signal & filter them here!
	normalize = false;
	FeatureInit;
	
	%%%%%% Run algorithm and save result
	draw = false;
	runAlgorithmForIC;
	
	fprintf('Finish Test Case %s \n', MVN_FILE_NAME);
	
	
end

fprintf('End Initial Contact Detection (Simple Method) \n');