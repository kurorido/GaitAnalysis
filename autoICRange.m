validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end

	ROOT_DIR = strcat('J:\Roliroli\S',number,'\IC-Time-Validated\');
	OUT_DIR = strcat('J:\Roliroli\S', number,'\IC-Range\');
	mkdir(OUT_DIR);
	autoRange;
	
end