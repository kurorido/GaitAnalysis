PREDTOT_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\libsvm-3.17\tools\test.predict';
ROOT_DIR = 'J:\Roliroli\S08';

predictLabels = load(PREDTOT_FILE);

errors = [];
currentLen = 1;

for i = 1 : 30

	range = load(strcat(ROOT_DIR,'\TO-Range\TO-Range-', int2str(i), '.txt'));
	
	GAITRiteTimes = load(strcat(ROOT_DIR,'\TO-Time-Indent\','GAITRiteTime-', int2str(i), '.txt'));
	
	Time = [];
	
	for j = 1 : size(range, 1)
		START_TIME = range(j, 1);
		END_TIME = range(j, 2);
		
		len = END_TIME - START_TIME;
		
		predictSet = predictLabels(currentLen:currentLen+len);
	 	ind = find(abs(predictSet)==abs(min(predictSet)));
	 	ind = ind(1);
		
		error = (GAITRiteTimes(j) - START_TIME + ind);
	 	
	 	errors = [errors error];
		
		currentLen = currentLen + len + 1;
		
		t = START_TIME + ind;
		
		Time = [Time t];
	end

	dlmwrite(strcat(ROOT_DIR, '\SVRTime-', int2str(i), '.txt'), Time);
end
%range = 9;
%
%loop = length(predictLabels) / range;
%
%errors = [];
%
%for i = 1 : loop 
%
%	START = (i-1) * range + 1;
%	END = (i * range);
%
%	predictSet = predictLabels(START:END);
%	
%	ind = find(abs(predictSet)==abs(min(predictSet)));
%	ind = ind(1);
%	
%	if(ind == 1)
%		errors(i) = 0;
%	elseif(ind <= 4)
%		errors(i) = ind;
%	elseif(ind > 4)
%		errors(i) = ind - 4;
%	end
%	
%end

avgError = mean(errors) / 2;
avgAbsError = mean(abs(errors)) / 2;
stdError = std(errors) / 2;
stdAbsError = std(abs(errors)) / 2;