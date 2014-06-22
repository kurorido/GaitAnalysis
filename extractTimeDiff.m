% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx
% 20140327.xlsx

TEST_CASE_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\testcase\20140327-new.xlsx';
OUT_FILE_NAME = '..\20140327-new-times.txt';

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
fid = fopen(OUT_FILE_NAME,'w');

fprintf('Start \n');

for i = 1:size(TEST_CASE_LIST, 1)

	fprintf('Running Test Case %d \n', i);
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	% START_TIME = TEST_CASE_LIST{i, 3};
	
	fprintf(fid ,'%s \n', MVN_FILE_NAME);
	fprintf(fid ,'%s \n', GAITRITE_FILE_NAME);

	% Load GaitRite Temporal
	diffs = timeDiff(0, GAITRITE_FILE_NAME);
	
	for i = 1:length(diffs)
		fprintf(fid ,'%d ', diffs(i));
	end
	
	fprintf(fid ,'\n');
	fprintf(fid ,'\n');
end

if fid ~= -1
  fclose(fid);
end

fprintf('Done \n');