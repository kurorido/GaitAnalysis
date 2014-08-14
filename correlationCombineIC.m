OUT = [];
validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end
	
	CORRELATION_DIR = strcat('J:\Roliroli\S', number,'\Correlation\');
	FILE_NAME = strcat(CORRELATION_DIR, 'Correlation-IC.txt');
	tmp = load(FILE_NAME);
	
	OUT = [OUT ; tmp];
	
end

RESULT = [];

for i = 1 : 129
	ans = corrcoef(OUT(:,1), OUT(:, i+1));
	RESULT = [RESULT ans(1,2)];
end