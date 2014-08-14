SVM_PREDICT_EXE = 'C:\Users\Ergolab2\Desktop\Roliroli\libsvm-3.17\windows\svm-predict.exe';
SVM_SCALE_EXE = 'C:\Users\Ergolab2\Desktop\Roliroli\libsvm-3.17\windows\svm-scale.exe';
SCALE_RANGE_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\libsvm-3.17\tools\range';
MODEL_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\libsvm-3.17\tools\train.scale.model';
Combination = 5;
%validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end
	
	ROOT_DIR = strcat('J:\Roliroli\S', number, '\');
	COMBINATION_DIR = strcat(ROOT_DIR, 'TO-SVR\Combination-', int2str(Combination), '\');
	PREDICT_FILE = strcat(COMBINATION_DIR, 'test.predict');	
	TEST_FILE = strcat(COMBINATION_DIR, 'Combination-', int2str(Combination), '.txt');	
	
	% Scale Test File to test.scale
	scale_command = sprintf('%s -r %s %s %s %s %s', SVM_SCALE_EXE, SCALE_RANGE_FILE, TEST_FILE, '>', strcat(COMBINATION_DIR, 'test.scale'));
	system(scale_command);
	
	% Run Predict
	predict_command = sprintf('%s %s %s %s', SVM_PREDICT_EXE, strcat(COMBINATION_DIR, 'test.scale'), MODEL_FILE, PREDICT_FILE );
	[status,cmdout] = system(predict_command);
	
	OUT_FILE_NAME = strcat(COMBINATION_DIR, 'predict_result.txt');
	fid = fopen(OUT_FILE_NAME,'w');
	fprintf(fid, '%s \n', cmdout);

	% Create DIR for Output
	mkdir(strcat(COMBINATION_DIR, 'Time\'));

	predictLabels = load(PREDICT_FILE);

	errors = [];
	currentLen = 1;

	for i = 1 : 30

		range = load(strcat(ROOT_DIR,'TO-Range\Range-', int2str(i), '.txt'));
		
		GAITRiteTimes = load(strcat(ROOT_DIR,'TO-Time-Validated\','GAITRiteTime-', int2str(i), '.txt'));
		
		Time = [];
		
		for j = 1 : size(range, 1)
			START_TIME = range(j, 1);
			END_TIME = range(j, 2);
			
			len = END_TIME - START_TIME;
			
			predictSet = predictLabels(currentLen:currentLen+len);
			ind = find(abs(predictSet)==abs(min(predictSet)));
			ind = ind(1);
			
			error = (GAITRiteTimes(j) - START_TIME - ind);
			
			errors = [errors error];
			
			currentLen = currentLen + len + 1;
			
			t = START_TIME + ind;
			
			Time = [Time t];
		end
		
		dlmwrite(strcat(COMBINATION_DIR, 'Time\SVRTime-', int2str(i), '.txt'), Time);
	end

	avgError = mean(errors) / 2;
	avgAbsError = mean(abs(errors)) / 2;
	stdError = std(errors) / 2;
	stdAbsError = std(abs(errors)) / 2;
	
	fprintf(fid, 'AvgError: %s \n', avgError);
	fprintf(fid, 'StdError: %s \n', stdError);
	fprintf(fid, 'avgAbsError: %s \n', avgAbsError);
	fprintf(fid, 'StdAbsError: %s \n', stdAbsError);
	fclose(fid);
end