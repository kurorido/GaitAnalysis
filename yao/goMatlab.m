TEST_CASE_FILE = 'autoMatlab.xlsx';;
[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

for i = 1:size(TEST_CASE_LIST, 1)
	
	FILE_PATH = TEST_CASE_LIST{i, 1};
	FILE_NAME = TEST_CASE_LIST{i, 2};
	
	%FILENAME = 'J:\YAO''s DATA\SchoolBag DATAbase\@MVN-3_part_MVNX\#L\sb-111001-1L\sb-111001-1L-000-1.mvnx';
	%OUTFILENAME = 'sb-111001-1L-000-1';	

	gait = loadGait(strcat(FILE_PATH, FILE_NAME, '.mvnx'));
	save(FILE_NAME, 'gait');

	clear gait;	
end



