ROOT_DIR = 'J:\Roliroli\S08\IC-Time-Indent\';
OUT_DIR = 'J:\Roliroli\S08\';
TEST_CASE_FILE = strcat('J:\Roliroli\S08\', 'autoSVMBuild.xlsx');

OUT_FILE_NAME = strcat(OUT_DIR, 'SVR-IC-Diff-Normalize.txt');
%OUT_FILE_NAME = strcat(OUT_DIR, 'IC-Correlation.txt');
fid = fopen(OUT_FILE_NAME,'w');

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

zeroCount = 0;
totalCount = 0;

for i = 1:30
	
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	load(MVN_FILE_NAME);
	END_TIME = size(gait.acceleration, 1);
	FeatureInitFragment;
	
	Temp = [];

	for j = 1 : length(GAITRiteTimes)
	
		Range = [pelvisTimes(j) tightTimes(j) shankTimes(j) footTimes(j)];
		
		Temp = [Temp ; min(Range) max(Range)];
					
		totalCount = totalCount + 1;
	
		for k = min(Range) : max(Range)
		
			if(GAITRiteTimes(j) == k)
				zeroCount = zeroCount + 1;
			end
			
			fprintf(fid,'%.2f 1:%.3f 2:%.3f 3:%.3f ', (GAITRiteTimes(j) - k) * 8.33, Acceleration_Pelvis_X(k), Acceleration_Pelvis_Y(k), Acceleration_RightUpperLeg_X(k));
			fprintf(fid,'4:%.3f 5:%.3f 6:%.3f', Acceleration_LeftUpperLeg_X(k), AngularVelocity_LeftLowerLeg_X(k), AngularVelocity_RightLowerLeg_X(k));
			fprintf(fid,'7:%.3f 8:%.3f\r\n', Acceleration_LeftFoot_X(k), Acceleration_RightFoot_X(k));
			
			fprintf(fid,'%.2f %.3f %.3f %.3f ', (GAITRiteTimes(j) - k) * 8.33, Acceleration_Pelvis_X(k), Acceleration_Pelvis_Y(k), Acceleration_RightUpperLeg_X(k));
			fprintf(fid,'%.3f %.3f %.3f', Acceleration_LeftUpperLeg_X(k), AngularVelocity_LeftLowerLeg_X(k), AngularVelocity_RightLowerLeg_X(k));
			fprintf(fid,'%.3f %.3f\r\n', Acceleration_LeftFoot_X(k), Acceleration_RightFoot_X(k));
			
			%fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k) * 8.33);
			%fprintf(fid, '%.3f ', Acceleration_Pelvis_X(k));
            %fprintf(fid, '%.3f ', Acceleration_Pelvis_Y(k));
            %fprintf(fid, '%.3f ', Acceleration_Pelvis_Z(k));
            %fprintf(fid, '%.3f ', AngularVelocity_Pelvis_X(k));
            %fprintf(fid, '%.3f ', AngularVelocity_Pelvis_Y(k));
            %fprintf(fid, '%.3f ', AngularVelocity_Pelvis_Z(k));
            %fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_X(k));
            %fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_Y(k));
            %fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_Z(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_X(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_Y(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_Z(k));
            %fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_X(k));
            %fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_Y(k));
            %fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_Z(k));
            %fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_X(k));
            %fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_Y(k));
            %fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_Z(k));
            %fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_X(k));
            %fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_Y(k));
            %fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_Z(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_X(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_Y(k));
            %fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_Z(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_X(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_Y(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_Z(k));
			%fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_X(k));
			%fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
			%fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_Z(k));
			%fprintf(fid, '%.3f ', Acceleration_RightFoot_X(k));
			%fprintf(fid, '%.3f ', Acceleration_RightFoot_Y(k));
			%fprintf(fid, '%.3f ', Acceleration_RightFoot_Z(k));
			%fprintf(fid, '%.3f ', AngularVelocity_RightFoot_X(k));
			%fprintf(fid, '%.3f ', AngularVelocity_RightFoot_Y(k));
			%fprintf(fid, '%.3f ', AngularVelocity_RightFoot_Z(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftFoot_X(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftFoot_Y(k));
			%fprintf(fid, '%.3f ', Acceleration_LeftFoot_Z(k));
			%fprintf(fid, '%.3f ', AngularVelocity_LeftFoot_X(k));
			%fprintf(fid, '%.3f ', AngularVelocity_LeftFoot_Y(k));
			%fprintf(fid, '%.3f\r\n', AngularVelocity_LeftFoot_Z(k));
			
		end
		
		% Write Current
		%fprintf(fid,'0 1:%2.3f 2:%2.3f 3:%2.3f ', Acceleration_Pelvis_X(GAITRiteTimes(j)), Acceleration_Pelvis_Y(GAITRiteTimes(j)), Acceleration_RightUpperLeg_X(GAITRiteTimes(j)));
		%fprintf(fid,'4:%2.3f 5:%2.3f 6:%2.3f', Acceleration_LeftUpperLeg_X(GAITRiteTimes(j)), AngularVelocity_LeftLowerLeg_X(GAITRiteTimes(j)), AngularVelocity_RightLowerLeg_X(GAITRiteTimes(j)));
		%fprintf(fid,'7:%2.3f 8:%2.3f\r\n', Acceleration_LeftFoot_X(GAITRiteTimes(j)), Acceleration_RightFoot_X(GAITRiteTimes(j)));
		%for forwardStep = 1 : 4
		%	fprintf(fid,'%2f 1:%2.3f 2:%2.3f 3:%2.3f ', 0 - (forwardStep * 8.3), Acceleration_Pelvis_X(GAITRiteTimes(j)+forwardStep), Acceleration_Pelvis_Y(GAITRiteTimes(j)+forwardStep), Acceleration_RightUpperLeg_X(GAITRiteTimes(j)+forwardStep));
		%	fprintf(fid,'4:%2.3f 5:%2.3f 6:%2.3f', Acceleration_LeftUpperLeg_X(GAITRiteTimes(j)+forwardStep), AngularVelocity_LeftLowerLeg_X(GAITRiteTimes(j)+forwardStep), AngularVelocity_RightLowerLeg_X(GAITRiteTimes(j)+forwardStep));
		%	fprintf(fid,'7:%2.3f 8:%2.3f\r\n', Acceleration_LeftFoot_X(GAITRiteTimes(j)+forwardStep), Acceleration_RightFoot_X(GAITRiteTimes(j)+forwardStep));
		%end
		%
		%for backwardStep = 1 : 4
		%	fprintf(fid,'%2f 1:%2.3f 2:%2.3f 3:%2.3f ', (backwardStep * 8.3), Acceleration_Pelvis_X(GAITRiteTimes(j)-backwardStep), Acceleration_Pelvis_Y(GAITRiteTimes(j)-backwardStep), Acceleration_RightUpperLeg_X(GAITRiteTimes(j)-backwardStep));
		%	fprintf(fid,'4:%2.3f 5:%2.3f 6:%2.3f', Acceleration_LeftUpperLeg_X(GAITRiteTimes(j)-backwardStep), AngularVelocity_LeftLowerLeg_X(GAITRiteTimes(j)-backwardStep), AngularVelocity_RightLowerLeg_X(GAITRiteTimes(j)-backwardStep));
		%	fprintf(fid,'7:%2.3f 8:%2.3f\r\n', Acceleration_LeftFoot_X(GAITRiteTimes(j)-backwardStep), Acceleration_RightFoot_X(GAITRiteTimes(j)-backwardStep));
		%end
		
	end
	
	dlmwrite(strcat(OUT_DIR, 'IC-Range-', int2str(i), '.txt'), Temp);
end
fclose(fid);
fclose all;

coverRate = zeroCount / totalCount;