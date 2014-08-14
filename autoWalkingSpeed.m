Combination = 1;
validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];

for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end
	
	ROOT_DIR = strcat('J:\Roliroli\S', number, '\');
	TEST_CASE_FILE = strcat(ROOT_DIR,'autoSVMBuild.xlsx');
	[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);	
	COMBINATION_TIME_DIR = strcat(ROOT_DIR, 'Cycle-Time\Combination-', int2str(Combination), '\');
	
	OUT_DIR = strcat(ROOT_DIR, 'Walking-Speed\Combination-', int2str(Combination), '\');
	mkdir(OUT_DIR);
	
	OUT_Self = [];
	OUT_100 = [];
	OUT_120 = [];
	OUT_All = [];

	for i = 1 : 30
	
		svrTimes = load(strcat(COMBINATION_TIME_DIR, 'SVRTime-', int2str(i), '.txt'));
	
		MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
		GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};

		START_TIME = TEST_CASE_LIST{i, 3};
		load(MVN_FILE_NAME);
		
		if(length(svrTimes) >= 5)
			END_TIME = svrTimes(5);
			
			leftP = gait.position(START_TIME:END_TIME, 64);
			rightP = gait.position(START_TIME:END_TIME, 52);
			
			if(leftP(end) > rightP(end))
				vector = leftP;
			else
				vector = rightP;
			end
			
			s = vector(1);
			e = vector(end);
			speed = abs(e - s) / ((END_TIME - START_TIME + 1) * 0.008);
			%OUT = [OUT ; speed];
		else
			speed = -1;
			%OUT = [OUT ; -1];
		end

		if(~isempty(strfind(GAITRITE_FILE_NAME, 'Self')))
			OUT_Self = [OUT_Self; speed];
		elseif(~isempty(strfind(GAITRITE_FILE_NAME, '100')))
			OUT_100 = [OUT_100; speed];
		elseif(~isempty(strfind(GAITRITE_FILE_NAME, '120')))
			OUT_120 = [OUT_120; speed];
		end
		
		OUT_All = [OUT_All ; speed];

	end
	
	dlmwrite(strcat(OUT_DIR, 'WalkingSpeed-Self.txt'), OUT_Self);
	dlmwrite(strcat(OUT_DIR, 'WalkingSpeed-100.txt'), OUT_100);
	dlmwrite(strcat(OUT_DIR, 'WalkingSpeed-120.txt'), OUT_120);
	dlmwrite(strcat(OUT_DIR, 'WalkingSpeed-All.txt'), OUT_All);
	
end