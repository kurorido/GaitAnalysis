Combination = 5;

validate = [1:8, 12, 14:15, 17:20, 22, 24:27, 29];
for case_ind = 1 : length(validate)

	subjectNum = validate(case_ind);

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end

	ROOT_DIR = strcat('J:\Roliroli\S',number,'\');
	RANGE_DIR = strcat(ROOT_DIR, 'TO-Range\');
	TIME_DIR = strcat(ROOT_DIR, 'TO-Time-Validated\');
	TEST_CASE_FILE = strcat('J:\Roliroli\S', number,'\autoSVMBuild.xlsx');
	COMBINATION_DIR = strcat(ROOT_DIR, 'TO-SVR\Combination-', int2str(Combination), '\');
	mkdir(COMBINATION_DIR);
	OUT_FILE_NAME = strcat(COMBINATION_DIR, 'Combination-', int2str(Combination),'.txt');
	fid = fopen(OUT_FILE_NAME,'w');
	[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

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
					% Toe Off (Combination 1) - Rank (also consider joint ankle)
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '3:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '4:%.3f ', jLeftHip_Z(k));
					fprintf(fid, '5:%.3f ', jRightHip_Z(k));
					fprintf(fid, '6:%.3f ', Jerk_Pelvis_Y(k));
					fprintf(fid, '7:%.3f ', Acceleration_LeftFoot_Z(k));
					fprintf(fid, '8:%.3f ', Acceleration_RightFoot_Z(k));
					fprintf(fid, '9:%.3f\r\n', k-rangeStart+1);
				end
				
				
				if(Combination == 2)
					% Toe Off (Combination 2) - Rank (no joint ankle)
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '3:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '4:%.3f ', Jerk_Pelvis_Y(k));
					fprintf(fid, '5:%.3f ', Acceleration_LeftFoot_Z(k));
					fprintf(fid, '6:%.3f ', Acceleration_RightFoot_Z(k));
					fprintf(fid, '7:%.3f\r\n', k-rangeStart+1);					
				end
				
				if(Combination == 3)
					% Toe Off (Combination 3) - Remove Jerk
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '3:%.3f ', Acceleration_LeftFoot_Z(k));
					fprintf(fid, '4:%.3f ', Acceleration_RightFoot_Z(k));
					fprintf(fid, '5:%.3f\r\n', k-rangeStart+1);					
				end		

				if(Combination == 4)
					% Toe Off (Combination 4) - Just a test...
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '3:%.3f\r\n', k-rangeStart+1);					
				end

				if(Combination == 5)
					% Toe Off (Combination 5) - Rank (no joint ankle) same as Combination 2
					fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * mutiplier);
					fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
					fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
					fprintf(fid, '3:%.3f ', Jerk_Pelvis_Z(k));
					fprintf(fid, '4:%.3f ', Jerk_Pelvis_Y(k));
					fprintf(fid, '5:%.3f ', Acceleration_LeftFoot_Z(k));
					fprintf(fid, '6:%.3f ', Acceleration_RightFoot_Z(k));
					fprintf(fid, '7:%.3f\r\n', k-rangeStart+1);					
				end
			end
		end
	end
	fclose(fid);
	fclose all;
end