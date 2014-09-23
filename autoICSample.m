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

	ROOT_DIR = strcat('J:\Roliroli\S',number,'\');
	RANGE_DIR = strcat(ROOT_DIR, 'IC-Range\');
	TIME_DIR = strcat(ROOT_DIR, 'IC-Time-Validated\');
	TEST_CASE_FILE = strcat('J:\Roliroli\S', number,'\autoSVMBuild.xlsx');
	COMBINATION_DIR = strcat(ROOT_DIR, 'IC-SVR\Combination-', int2str(Combination), '\');
	mkdir(COMBINATION_DIR);
	OUT_FILE_NAME = strcat(COMBINATION_DIR, 'Combination-', int2str(Combination),'.txt');
	fid = fopen(OUT_FILE_NAME,'w');
	[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
	
	anthropometry = load(strcat(ROOT_DIR, 'anthropometry.txt'));

	for i = 1:30

		
		MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
		load(MVN_FILE_NAME);
		END_TIME = size(gait.acceleration, 1);
		
		normalize = false;
		FeatureInit;
		
		GAITRiteTimes = load(strcat(TIME_DIR,'GAITRiteTime-', int2str(i), '.txt'));
		
		% Load Range File
		RANGE_FILE = strcat(RANGE_DIR, 'Range-', int2str(i), '.txt');
		events = load(RANGE_FILE);		

		for j = 1 : size(events, 1)
	
			rangeStart = events(j, 1);
			rangeEnd = events(j, 2);
		
			for k = rangeStart : rangeEnd
				
				mutiplier = 1;
				
				if(Combination == 1)
					% Initial Contact (Combination 1) - Rank (also consider joint ankle)
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
					fprintf(fid, '4:%.3f ', jRightBallFoot_Z(k));
					fprintf(fid, '5:%.3f ', jLeftBallFoot_Z(k));
					fprintf(fid, '6:%.3f ', Acceleration_RightLowerLeg_Z(k));
					fprintf(fid, '7:%.3f ', Acceleration_LeftLowerLeg_Z(k));
					fprintf(fid, '8:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '9:%.3f\r\n', k-rangeStart+1);
				end
				
				
				if(Combination == 2)
					% Initial Contact (Combination 2) - Rank (no joint ankle)
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
					fprintf(fid, '4:%.3f ', Acceleration_RightLowerLeg_Z(k));
					fprintf(fid, '5:%.3f ', Acceleration_LeftLowerLeg_Z(k));
					fprintf(fid, '6:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '7:%.3f\r\n', k-rangeStart+1);
				end
				
				if(Combination == 3)
					% Initial Contact (Combination 3) - Remove Jerk
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
					fprintf(fid, '4:%.3f ', Acceleration_RightLowerLeg_Z(k));
					fprintf(fid, '5:%.3f ', Acceleration_LeftLowerLeg_Z(k));
					fprintf(fid, '6:%.3f\r\n', k-rangeStart+1);
				end
				
				if(Combination == 4)
					% Initial Contact (Combination 4) - Just a test...
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f\r\n', k-rangeStart+1);
				end
				
				if(Combination == 5)
					% Initial Contact (Combination 5) - Rank (also consider joint ankle) and Additional
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
					fprintf(fid, '4:%.3f ', jRightBallFoot_Z(k));
					fprintf(fid, '5:%.3f ', jLeftBallFoot_Z(k));
					fprintf(fid, '6:%.3f ', Acceleration_RightLowerLeg_Z(k));
					fprintf(fid, '7:%.3f ', Acceleration_LeftLowerLeg_Z(k));
					fprintf(fid, '8:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '9:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '10:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '11:%.3f\r\n', k-rangeStart+1);
				end	

				if(Combination == 6)
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
					fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
					fprintf(fid, '4:%.3f ', jRightBallFoot_Z(k));
					fprintf(fid, '5:%.3f ', jLeftBallFoot_Z(k));
					fprintf(fid, '6:%.3f ', Acceleration_RightLowerLeg_Z(k));
					fprintf(fid, '7:%.3f ', Acceleration_LeftLowerLeg_Z(k));
					fprintf(fid, '8:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '9:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '10:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '11:%.3f ', anthropometry(1));
					fprintf(fid, '12:%.3f ', anthropometry(2));
					fprintf(fid, '13:%.3f ', anthropometry(4));
					fprintf(fid, '14:%.3f ', anthropometry(5));
					fprintf(fid, '15:%.3f ', anthropometry(6));
					fprintf(fid, '16:%.3f ', anthropometry(7));
					fprintf(fid, '17:%.3f ', anthropometry(8));
					fprintf(fid, '18:%.3f ', anthropometry(9));
					fprintf(fid, '19:%.3f ', anthropometry(10));
					fprintf(fid, '20:%.3f\r\n', k-rangeStart+1);
				end
			end
		end
	end
	fclose(fid);
	fclose all;
end