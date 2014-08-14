for i = 1:30
	
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	%tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	load(MVN_FILE_NAME);
	END_TIME = size(gait.acceleration, 1);
	FeatureInit;
	
	Temp = [];

	for j = 1 : length(GAITRiteTimes)
	
		%Range = [pelvisTimes(j) tightTimes(j) shankTimes(j) footTimes(j)];
		
		Range = [pelvisTimes(j) shankTimes(j) footTimes(j)];
		
		Temp = [Temp ; min(Range) max(Range)];
	
		for k = min(Range) : max(Range)
			
			fprintf(fid, '%.3f ', (GAITRiteTimes(j) - k));
			fprintf(fid, '%.3f ', Acceleration_Pelvis_X(k));
            fprintf(fid, '%.3f ', Acceleration_Pelvis_Y(k));
            fprintf(fid, '%.3f ', Acceleration_Pelvis_Z(k));
            fprintf(fid, '%.3f ', AngularVelocity_Pelvis_X(k));
            fprintf(fid, '%.3f ', AngularVelocity_Pelvis_Y(k));
            fprintf(fid, '%.3f ', AngularVelocity_Pelvis_Z(k));
            fprintf(fid, '%.3f ', Jerk_Pelvis_X(k));
            fprintf(fid, '%.3f ', Jerk_Pelvis_Y(k));
            fprintf(fid, '%.3f ', Jerk_Pelvis_Z(k));			
            fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_X(k));
            fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_Y(k));
            fprintf(fid, '%.3f ', Acceleration_RightUpperLeg_Z(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_X(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_Y(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightUpperLeg_Z(k));
            fprintf(fid, '%.3f ', Jerk_RightUpperLeg_X(k));
            fprintf(fid, '%.3f ', Jerk_RightUpperLeg_Y(k));
            fprintf(fid, '%.3f ', Jerk_RightUpperLeg_Z(k));			
            fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_X(k));
            fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_Y(k));
            fprintf(fid, '%.3f ', Acceleration_LeftUpperLeg_Z(k));
            fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_X(k));
            fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_Y(k));
            fprintf(fid, '%.3f ', AngularVelocity_LeftUpperLeg_Z(k));
            fprintf(fid, '%.3f ', Jerk_LeftUpperLeg_X(k));
            fprintf(fid, '%.3f ', Jerk_LeftUpperLeg_Y(k));
            fprintf(fid, '%.3f ', Jerk_LeftUpperLeg_Z(k));			
            fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_X(k));
            fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_Y(k));
            fprintf(fid, '%.3f ', Acceleration_RightLowerLeg_Z(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_X(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_Y(k));
            fprintf(fid, '%.3f ', AngularVelocity_RightLowerLeg_Z(k));
            fprintf(fid, '%.3f ', Jerk_RightLowerLeg_X(k));
            fprintf(fid, '%.3f ', Jerk_RightLowerLeg_Y(k));
            fprintf(fid, '%.3f ', Jerk_RightLowerLeg_Z(k));			
			fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_X(k));
			fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_Y(k));
			fprintf(fid, '%.3f ', Acceleration_LeftLowerLeg_Z(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_X(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftLowerLeg_Z(k));
			fprintf(fid, '%.3f ', Jerk_LeftLowerLeg_X(k));
			fprintf(fid, '%.3f ', Jerk_LeftLowerLeg_Y(k));
			fprintf(fid, '%.3f ', Jerk_LeftLowerLeg_Z(k));			
			fprintf(fid, '%.3f ', Acceleration_RightFoot_X(k));
			fprintf(fid, '%.3f ', Acceleration_RightFoot_Y(k));
			fprintf(fid, '%.3f ', Acceleration_RightFoot_Z(k));
			fprintf(fid, '%.3f ', AngularVelocity_RightFoot_X(k));
			fprintf(fid, '%.3f ', AngularVelocity_RightFoot_Y(k));
			fprintf(fid, '%.3f ', AngularVelocity_RightFoot_Z(k));
			fprintf(fid, '%.3f ', Jerk_RightFoot_X(k));
			fprintf(fid, '%.3f ', Jerk_RightFoot_Y(k));
			fprintf(fid, '%.3f ', Jerk_RightFoot_Z(k));			
			fprintf(fid, '%.3f ', Acceleration_LeftFoot_X(k));
			fprintf(fid, '%.3f ', Acceleration_LeftFoot_Y(k));
			fprintf(fid, '%.3f ', Acceleration_LeftFoot_Z(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftFoot_X(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftFoot_Y(k));
			fprintf(fid, '%.3f ', AngularVelocity_LeftFoot_Z(k));
			fprintf(fid, '%.3f ', Jerk_LeftFoot_X(k));
			fprintf(fid, '%.3f ', Jerk_LeftFoot_Y(k));
			fprintf(fid, '%.3f ', Jerk_LeftFoot_Z(k));
			fprintf(fid,'%.3f ', jL5S1_X(k));
			fprintf(fid,'%.3f ', jL5S1_Y(k));
			fprintf(fid,'%.3f ', jL5S1_Z(k));
			fprintf(fid,'%.3f ', jL4L3_X(k));
			fprintf(fid,'%.3f ', jL4L3_Y(k));
			fprintf(fid,'%.3f ', jL4L3_Z(k));
			fprintf(fid,'%.3f ', jL1T12_X(k));
			fprintf(fid,'%.3f ', jL1T12_Y(k));
			fprintf(fid,'%.3f ', jL1T12_Z(k));
			fprintf(fid,'%.3f ', jT9T8_X(k));
			fprintf(fid,'%.3f ', jT9T8_Y(k));
			fprintf(fid,'%.3f ', jT9T8_Z(k));
			fprintf(fid,'%.3f ', jT1C7_X(k));
			fprintf(fid,'%.3f ', jT1C7_Y(k));
			fprintf(fid,'%.3f ', jT1C7_Z(k));
			fprintf(fid,'%.3f ', jC1Head_X(k));
			fprintf(fid,'%.3f ', jC1Head_Y(k));
			fprintf(fid,'%.3f ', jC1Head_Z(k));
			fprintf(fid,'%.3f ', jRightC7Shoulder_X(k));
			fprintf(fid,'%.3f ', jRightC7Shoulder_Y(k));
			fprintf(fid,'%.3f ', jRightC7Shoulder_Z(k));
			fprintf(fid,'%.3f ', jRightShoulder_X(k));
			fprintf(fid,'%.3f ', jRightShoulder_Y(k));
			fprintf(fid,'%.3f ', jRightShoulder_Z(k));
			fprintf(fid,'%.3f ', jRightElbow_X(k));
			fprintf(fid,'%.3f ', jRightElbow_Y(k));
			fprintf(fid,'%.3f ', jRightElbow_Z(k));
			fprintf(fid,'%.3f ', jRightWrist_X(k));
			fprintf(fid,'%.3f ', jRightWrist_Y(k));
			fprintf(fid,'%.3f ', jRightWrist_Z(k));
			fprintf(fid,'%.3f ', jLeftC7Shoulder_X(k));
			fprintf(fid,'%.3f ', jLeftC7Shoulder_Y(k));
			fprintf(fid,'%.3f ', jLeftC7Shoulder_Z(k));
			fprintf(fid,'%.3f ', jLeftShoulder_X(k));
			fprintf(fid,'%.3f ', jLeftShoulder_Y(k));
			fprintf(fid,'%.3f ', jLeftShoulder_Z(k));
			fprintf(fid,'%.3f ', jLeftElbow_X(k));
			fprintf(fid,'%.3f ', jLeftElbow_Y(k));
			fprintf(fid,'%.3f ', jLeftElbow_Z(k));
			fprintf(fid,'%.3f ', jLeftWrist_X(k));
			fprintf(fid,'%.3f ', jLeftWrist_Y(k));
			fprintf(fid,'%.3f ', jLeftWrist_Z(k));
			fprintf(fid,'%.3f ', jRightHip_X(k));
			fprintf(fid,'%.3f ', jRightHip_Y(k));
			fprintf(fid,'%.3f ', jRightHip_Z(k));
			fprintf(fid,'%.3f ', jRightKnee_X(k));
			fprintf(fid,'%.3f ', jRightKnee_Y(k));
			fprintf(fid,'%.3f ', jRightKnee_Z(k));
			fprintf(fid,'%.3f ', jRightAnkle_X(k));
			fprintf(fid,'%.3f ', jRightAnkle_Y(k));
			fprintf(fid,'%.3f ', jRightAnkle_Z(k));
			fprintf(fid,'%.3f ', jRightBallFoot_X(k));
			fprintf(fid,'%.3f ', jRightBallFoot_Y(k));
			fprintf(fid,'%.3f ', jRightBallFoot_Z(k));
			fprintf(fid,'%.3f ', jLeftHip_X(k));
			fprintf(fid,'%.3f ', jLeftHip_Y(k));
			fprintf(fid,'%.3f ', jLeftHip_Z(k));
			fprintf(fid,'%.3f ', jLeftKnee_X(k));
			fprintf(fid,'%.3f ', jLeftKnee_Y(k));
			fprintf(fid,'%.3f ', jLeftKnee_Z(k));
			fprintf(fid,'%.3f ', jLeftAnkle_X(k));
			fprintf(fid,'%.3f ', jLeftAnkle_Y(k));
			fprintf(fid,'%.3f ', jLeftAnkle_Z(k));
			fprintf(fid,'%.3f ', jLeftBallFoot_X(k));
			fprintf(fid,'%.3f ', jLeftBallFoot_Y(k));
			fprintf(fid,'%.3f\r\n', jLeftBallFoot_Z(k));
		end
	end
end
fclose(fid);
fclose all;