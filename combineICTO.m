Combination = 6;

%validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
validate = [1:8];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end
	
	ROOT_DIR = strcat('J:\Roliroli\S', number, '\');
	OUT_DIR_COMBINATION = strcat(ROOT_DIR, 'Cycle-Time\Combination-', int2str(Combination), '\');
	%OUT_DIR_GAITRITE = strcat(ROOT_DIR, 'Cycle-Time\GAITRite\');
	%mkdir(OUT_DIR_GAITRITE);
	mkdir(OUT_DIR_COMBINATION);

	TO_COMBINATION_TIME_DIR = strcat(ROOT_DIR, 'TO-SVR\Combination-', int2str(Combination), '\Time\');
	IC_COMBINATION_TIME_DIR = strcat(ROOT_DIR, 'IC-SVR\Combination-', int2str(Combination), '\Time\');
	
	TO_TIME_DIR = strcat(ROOT_DIR, 'TO-Time-Validated\');
	IC_TIME_DIR = strcat(ROOT_DIR, 'IC-Time-Validated\');
	
	for i = 1:30
		
		IC_SVRTimes = load(strcat(IC_COMBINATION_TIME_DIR, 'SVRTime-', int2str(i), '.txt'));
		TO_SVRTimes = load(strcat(TO_COMBINATION_TIME_DIR, 'SVRTime-', int2str(i), '.txt'));
		
		IC_SVRTimes = reshape(IC_SVRTimes,1, max(size(IC_SVRTimes, 1), size(IC_SVRTimes, 2)));
		
		%IC_gaitRiteTimes = load(strcat(IC_TIME_DIR,'GAITRiteTime-', int2str(i), '.txt'));
		%TO_gaitRiteTimes = load(strcat(TO_TIME_DIR,'GAITRiteTime-', int2str(i), '.txt'));
		%
		%IC_gaitRiteTimes = reshape(IC_gaitRiteTimes,1, max(size(IC_gaitRiteTimes, 1), size(IC_gaitRiteTimes, 2)));
		%TO_gaitRiteTimes = reshape(TO_gaitRiteTimes,1, max(size(TO_gaitRiteTimes, 1), size(TO_gaitRiteTimes, 2)));
		
		temp = [IC_SVRTimes TO_SVRTimes]; 
		temp = sort(temp, 'ascend');
		dlmwrite(strcat(OUT_DIR_COMBINATION, 'SVRTime-', int2str(i), '.txt'), temp);	
		
		%temp = [IC_gaitRiteTimes TO_gaitRiteTimes]; 
		%temp = sort(temp, 'ascend');
		%dlmwrite(strcat(OUT_DIR_GAITRITE, 'GAITRiteTime-', int2str(i), '.txt'), temp);		
		
	end
	
end