OUT = [];
%validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
validate = [1:8, 12, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end
	
	TARGET_DIR = strcat('J:\Roliroli\S', number,'\IC-SVR\Combination-1\');
	FILE_NAME = strcat(TARGET_DIR, 'Combination-1.txt');
	
	f = fopen(FILE_NAME);             
	inter  = textscan(f, '%s','delimiter','\n');
	lines = inter{1,1};
	fclose(f);
	OUT = [OUT ; lines];
end

f = fopen('J:\Roliroli\Combination-1-All.txt', 'w');
for i = 1 : length(OUT)
	fprintf(f, '%s\n', OUT{i});
end
fclose(f);