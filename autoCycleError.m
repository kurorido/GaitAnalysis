Combination = 2;

validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
%validate = [1:8];
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
	
	OUT_DIR_COMBINATION = strcat(ROOT_DIR, 'Cycle-Time\Combination-', int2str(Combination), '\');
	GAITRITE_TIME_DIR = strcat(ROOT_DIR, 'Cycle-Time\GAITRite\');
	RESULT_DIR = strcat(ROOT_DIR, 'Result\Combination-', int2str(Combination), '\');
	mkdir(RESULT_DIR);
	
	%OUTFILE_NAME = strcat(ROOT_DIR, 'Combination-', int2str(Combination), '-CycleError.txt');
	
	j = 0;
	
	TEMP_Self = [];
	TEMP_100 = [];
	TEMP_120 = [];
	TEMP_All = [];
	
	for i = 1:30

		svrTimes = load(strcat(OUT_DIR_COMBINATION,'SVRTime-', int2str(i), '.txt'));
		GAITRiteTimes = load(strcat(GAITRITE_TIME_DIR,'GAITRiteTime-', int2str(i), '.txt'));
		
		if(length(svrTimes) >= 5)		
		
			j = j + 1;
			
			%svr_cycle(j) = svrTimes(5) - svrTimes(1);
			%svr_stance(j) = svrTimes(4) - svrTimes(1);
			%svr_swing(j) = svrTimes(5) - svrTimes(4);	
			%
			%cycle(j) = GAITRiteTimes(5) - GAITRiteTimes(1);
			%stance(j) = GAITRiteTimes(4) - GAITRiteTimes(1);
			%swing(j) = GAITRiteTimes(5) - GAITRiteTimes(4);
			%
			%svr_ic(j) = GAITRiteTimes(1) - svrTimes(1);
			%svr_to(j) = GAITRiteTimes(4) - svrTimes(4);
			%svr_ic_abs(j) = abs(GAITRiteTimes(1) - svrTimes(1));
			%svr_to_abs(j) = abs(GAITRiteTimes(4) - svrTimes(4));
			
			svr_cycle = svrTimes(5) - svrTimes(1);
			svr_stance = svrTimes(4) - svrTimes(1);
			svr_swing = svrTimes(5) - svrTimes(4);	
			
			cycle = GAITRiteTimes(5) - GAITRiteTimes(1);
			stance = GAITRiteTimes(4) - GAITRiteTimes(1);
			swing = GAITRiteTimes(5) - GAITRiteTimes(4);
			double1_len = GAITRiteTimes(2) - GAITRiteTimes(1);
			double2_len = GAITRiteTimes(4) - GAITRiteTimes(3);
			
			svr_double1_len = svrTimes(2) - svrTimes(1);
			svr_double2_len = svrTimes(4) - svrTimes(3);
			
			error_double1 = abs(double1_len - svr_double1_len);
			error_double2 = abs(double2_len - svr_double2_len);
			
			error_double = mean([error_double1 error_double2]);
			
			svr_ic = GAITRiteTimes(1) - svrTimes(1);
			svr_to = GAITRiteTimes(4) - svrTimes(4);
			svr_ic_abs = abs(GAITRiteTimes(1) - svrTimes(1));
			svr_to_abs = abs(GAITRiteTimes(4) - svrTimes(4));			
			
			swing_diff = abs(svr_swing - swing);
			stance_diff = abs(svr_stance - stance);
			
			mutipiler = 2.5;
			
			if(abs(svr_ic) < 8.3)
				svr_ic = svr_ic * mutipiler;
			end
			
			if(abs(svr_to) < 8.3)
				svr_to = svr_to * mutipiler;
			end
			
			if(abs(svr_ic_abs) < 8.3)
				svr_ic_abs = svr_ic_abs * mutipiler;
			end
			
			if(abs(svr_to_abs) < 8.3)
				svr_to_abs = svr_to_abs * mutipiler;
			end
			
			if(abs(swing_diff) < 8.3)
				swing_diff = swing_diff * mutipiler;
			end
			
			if(abs(stance_diff) < 8.3)
				stance_diff = stance_diff * mutipiler;
			end
			
			append = [svr_ic svr_ic_abs svr_to svr_to_abs stance_diff swing_diff error_double];
			
			GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
			if(~isempty(strfind(GAITRITE_FILE_NAME, 'Self')))
				TEMP_Self = [TEMP_Self; append];
			elseif(~isempty(strfind(GAITRITE_FILE_NAME, '100')))
				TEMP_100 = [TEMP_100; append];
			elseif(~isempty(strfind(GAITRITE_FILE_NAME, '120')))
				TEMP_120 = [TEMP_120; append];
			end	
			
			TEMP_All = [TEMP_All; append];
		end
		
	end
	
	OUT_Self = [];
	OUT_100 = [];
	OUT_120 = [];
	OUT_All = [];
	
	for k = 1 : 7
	
		OUT_Self = [OUT_Self mean(TEMP_Self(:, k)) std(TEMP_Self(:, k))];
		OUT_100 = [OUT_100 mean(TEMP_100(:, k)) std(TEMP_100(:, k))];
		OUT_120 = [OUT_120 mean(TEMP_120(:, k)) std(TEMP_120(:, k))];
		OUT_All = [OUT_All mean(TEMP_All(:, k)) std(TEMP_All(:, k))];
	
	end

	%svr_ic_absAvg = mean(svr_ic_abs);
	%svr_to_absAvg = mean(svr_to_abs);
	%svr_to_absSTD = std(svr_to_abs);
	%svr_ic_absSTD = std(svr_ic_abs);
	%svr_toAvg = mean(svr_to);
	%svr_icAvg = mean(svr_ic);
	%svr_toSTD = std(svr_to);
	%svr_icSTD = std(svr_ic);
    %
	%svrCycleAvg = mean(abs(cycle - svr_cycle));
	%svrStanceAvg = mean(abs(stance - svr_stance));
	%svrSwingAvg = mean(abs(swing - svr_swing));
    %
	%svrCycleSTD = std(abs(cycle - svr_cycle));
	%svrStanceSTD = std(abs(stance - svr_stance));
	%svrSwingSTD = std(abs(swing - svr_swing));
    %
	%Result = 8.3 * [svr_icAvg/2 svr_icSTD/2 svr_ic_absAvg/2 svr_ic_absSTD/2 svr_toAvg/4 svr_toSTD/4 svr_to_absAvg/4 svr_to_absSTD/4 svrStanceAvg/6 svrStanceSTD/6 svrSwingAvg/6 svrSwingSTD/6] ;
	%
	%dlmwrite(OUTFILE_NAME, Result);
	
	dlmwrite(strcat(RESULT_DIR, 'Cycle-Self.txt'), OUT_Self);
	dlmwrite(strcat(RESULT_DIR, 'Cycle-120.txt'), OUT_120);
	dlmwrite(strcat(RESULT_DIR, 'Cycle-100.txt'), OUT_100);
	dlmwrite(strcat(RESULT_DIR, 'Cycle-All.txt'), OUT_All);
	dlmwrite(strcat(RESULT_DIR, 'Cycle-For-Excel.txt'), [OUT_100; OUT_120; OUT_Self]);
end	
	