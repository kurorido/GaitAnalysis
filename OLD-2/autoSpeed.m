SUBJECT = 'S24';
ROOT_DIR = strcat('J:\Roliroli\',SUBJECT,'\');
IC_DIR = strcat('J:\Roliroli\',SUBJECT,'\IC-Time-Indent\');
TO_DIR = strcat('J:\Roliroli\',SUBJECT,'\TO-Time-Indent\');
TEST_CASE_FILE = strcat(ROOT_DIR, 'autoSVMBuild.xlsx');

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

OUT = [];
OUT_FILE_NAME = strcat(ROOT_DIR, 'Speeds.txt');

for i = 1:size(TEST_CASE_LIST, 1)

	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	load(MVN_FILE_NAME);
	vector = gait.centerOfMass(START_TIME:end, 1);
	s = vector(1);
	e = vector(end);
	speed = (e - s) / ((length(gait.centerOfMass) - START_TIME + 1) * 0.008);
	OUT = [OUT ; speed];

end

dlmwrite(OUT_FILE_NAME, OUT);