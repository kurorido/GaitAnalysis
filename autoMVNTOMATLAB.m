TEST_CASE_FILE = 'AutoMVNtoMatlab.xlsx';
%TEST_CASE_FILE = 'test.xlsx';
[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

for i = 1:size(TEST_CASE_LIST, 1)
	
	SUBJECT_NAME = TEST_CASE_LIST{i, 1};
	FILE_COUNT = TEST_CASE_LIST{i, 2};
	
	for j = 1 : FILE_COUNT
		
		if( j < 10 )
			number = strcat('0', int2str(j));
		else
			number = int2str(j);
		end
		
		FILENAME = strcat('J:\Roliroli\', SUBJECT_NAME, '\MVN Export\', SUBJECT_NAME ,'-0',number, '_Suit 00131162.mvnx');
		OUTFILENAME = strcat('J:\Roliroli\', SUBJECT_NAME,'\Matlab\', SUBJECT_NAME ,'-0' ,number);
		
		fileInfo = dir(FILENAME);
		fileSize = fileInfo.bytes;
		
		if(fileSize < 1024 * 1000)
			continue;
		end
		
		gait = loadGait(FILENAME);
		save(OUTFILENAME, 'gait');
		clear gait;
	end

end