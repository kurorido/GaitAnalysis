TEST_CASE_FILE = 'autoMvnxToMatlab.xlsx';;
[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

for i = 1:size(TEST_CASE_LIST, 1)
	
	SUBJECT_NAME = TEST_CASE_LIST{i, 1};
			
	files = dir(strcat('J:\Roliroli\', SUBJECT_NAME, '\MVN Export\*.mvnx'));
	
	for j = 1 : length(files)
		
		if( j < 10 )
			number = strcat('0', int2str(j));
		else
			number = int2str(j);
		end
		
		FILENAME = strcat('J:\Roliroli\', SUBJECT_NAME, '\MVN Export\' , files(j).name);
		OUTFILENAME = strcat('J:\Roliroli\', SUBJECT_NAME,'\Matlab\', SUBJECT_NAME ,'-0' , number);
		
		if(files(j).bytes < 1024 * 1000) % 1024 KB
			NULL = [];
			save(OUTFILENAME, 'NULL');
			continue;
		end
		
		gait = loadGait(FILENAME);
		save(OUTFILENAME, 'gait');
		clear gait;
	end

end