validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end

	ROOT_DIR = strcat('J:\Roliroli\S', number,'\IC-Time-Validated\');
	OUT_DIR = strcat('J:\Roliroli\S', number,'\IC-Time\');
	TEST_CASE_FILE = strcat('J:\Roliroli\S', number,'\autoSVMBuild.xlsx');
	OUT_FILE_NAME = strcat('J:\Roliroli\S', number, '\Correlation-IC.txt');
	fid = fopen(OUT_FILE_NAME,'w');
	[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
	
	%mkdir(OUT_DIR);
	normalize = false;
	correlationOut;
	
end