% FeatureInitFragment.m
% Joint
jL5S1_X = gait.jointAngle(:, 1);
jL5S1_Y = gait.jointAngle(:, 2);
jL5S1_Z = gait.jointAngle(:, 3);
jL4L3_X = gait.jointAngle(:, 4);
jL4L3_Y = gait.jointAngle(:, 5);
jL4L3_Z = gait.jointAngle(:, 6);
jL1T12_X = gait.jointAngle(:, 7);
jL1T12_Y = gait.jointAngle(:, 8);
jL1T12_Z = gait.jointAngle(:, 9);
jT9T8_X = gait.jointAngle(:, 10);
jT9T8_Y = gait.jointAngle(:, 11);
jT9T8_Z = gait.jointAngle(:, 12);
jT1C7_X = gait.jointAngle(:, 13);
jT1C7_Y = gait.jointAngle(:, 14);
jT1C7_Z = gait.jointAngle(:, 15);
jC1Head_X = gait.jointAngle(:, 16);
jC1Head_Y = gait.jointAngle(:, 17);
jC1Head_Z = gait.jointAngle(:, 18);
jRightC7Shoulder_X = gait.jointAngle(:, 19);
jRightC7Shoulder_Y = gait.jointAngle(:, 20);
jRightC7Shoulder_Z = gait.jointAngle(:, 21);
jRightShoulder_X = gait.jointAngle(:, 22);
jRightShoulder_Y = gait.jointAngle(:, 23);
jRightShoulder_Z = gait.jointAngle(:, 24);
jRightElbow_X = gait.jointAngle(:, 25);
jRightElbow_Y = gait.jointAngle(:, 26);
jRightElbow_Z = gait.jointAngle(:, 27);
jRightWrist_X = gait.jointAngle(:, 28);
jRightWrist_Y = gait.jointAngle(:, 29);
jRightWrist_Z = gait.jointAngle(:, 30);
jLeftC7Shoulder_X = gait.jointAngle(:, 31);
jLeftC7Shoulder_Y = gait.jointAngle(:, 32);
jLeftC7Shoulder_Z = gait.jointAngle(:, 33);
jLeftShoulder_X = gait.jointAngle(:, 34);
jLeftShoulder_Y = gait.jointAngle(:, 35);
jLeftShoulder_Z = gait.jointAngle(:, 36);
jLeftElbow_X = gait.jointAngle(:, 37);
jLeftElbow_Y = gait.jointAngle(:, 38);
jLeftElbow_Z = gait.jointAngle(:, 39);
jLeftWrist_X = gait.jointAngle(:, 40);
jLeftWrist_Y = gait.jointAngle(:, 41);
jLeftWrist_Z = gait.jointAngle(:, 42);
jRightHip_X = gait.jointAngle(:, 43);
jRightHip_Y = gait.jointAngle(:, 44);
jRightHip_Z = gait.jointAngle(:, 45);
jRightKnee_X = gait.jointAngle(:, 46);
jRightKnee_Y = gait.jointAngle(:, 47);
jRightKnee_Z = gait.jointAngle(:, 48);
jRightAnkle_X = gait.jointAngle(:, 49);
jRightAnkle_Y = gait.jointAngle(:, 50);
jRightAnkle_Z = gait.jointAngle(:, 51);
jRightBallFoot_X = gait.jointAngle(:, 52);
jRightBallFoot_Y = gait.jointAngle(:, 53);
jRightBallFoot_Z = gait.jointAngle(:, 54);
jLeftHip_X = gait.jointAngle(:, 55);
jLeftHip_Y = gait.jointAngle(:, 56);
jLeftHip_Z = gait.jointAngle(:, 57);
jLeftKnee_X = gait.jointAngle(:, 58);
jLeftKnee_Y = gait.jointAngle(:, 59);
jLeftKnee_Z = gait.jointAngle(:, 60);
jLeftAnkle_X = gait.jointAngle(:, 61);
jLeftAnkle_Y = gait.jointAngle(:, 62);
jLeftAnkle_Z = gait.jointAngle(:, 63);
jLeftBallFoot_X = gait.jointAngle(:, 64);
jLeftBallFoot_Y = gait.jointAngle(:, 65);
jLeftBallFoot_Z = gait.jointAngle(:, 66);

Acceleration_L3_X = gait.acceleration(:, 7);
% Pelvis
Acceleration_Pelvis_X = gait.acceleration(:, 1);
Acceleration_Pelvis_Y = gait.acceleration(:, 2);
Acceleration_Pelvis_Z = gait.acceleration(:, 3);
AngularVelocity_Pelvis_X = gait.angularVelocity(:, 1);
AngularVelocity_Pelvis_Y = gait.angularVelocity(:, 2);
AngularVelocity_Pelvis_Z = gait.angularVelocity(:, 3);

% Right Upper Leg
Acceleration_RightUpperLeg_X = gait.acceleration(:, 46);
Acceleration_RightUpperLeg_Y = gait.acceleration(:, 47);
Acceleration_RightUpperLeg_Z = gait.acceleration(:, 48);
AngularVelocity_RightUpperLeg_X = gait.angularVelocity(:, 46);
AngularVelocity_RightUpperLeg_Y = gait.angularVelocity(:, 47);
AngularVelocity_RightUpperLeg_Z = gait.angularVelocity(:, 48);		

% Left Upper Leg
Acceleration_LeftUpperLeg_X = gait.acceleration(:, 58);
Acceleration_LeftUpperLeg_Y = gait.acceleration(:, 59);
Acceleration_LeftUpperLeg_Z = gait.acceleration(:, 60);
AngularVelocity_LeftUpperLeg_X = gait.angularVelocity(:, 58);
AngularVelocity_LeftUpperLeg_Y = gait.angularVelocity(:, 59);
AngularVelocity_LeftUpperLeg_Z = gait.angularVelocity(:, 60);			

% Right Lower Leg
Acceleration_RightLowerLeg_X = gait.acceleration(:, 49);
Acceleration_RightLowerLeg_Y = gait.acceleration(:, 50);
Acceleration_RightLowerLeg_Z = gait.acceleration(:, 51);
AngularVelocity_RightLowerLeg_X = gait.angularVelocity(:, 49);
AngularVelocity_RightLowerLeg_Y = gait.angularVelocity(:, 50);
AngularVelocity_RightLowerLeg_Z = gait.angularVelocity(:, 51);		

% Left Lower Leg
Acceleration_LeftLowerLeg_X = gait.acceleration(:, 61);
Acceleration_LeftLowerLeg_Y = gait.acceleration(:, 62);
Acceleration_LeftLowerLeg_Z = gait.acceleration(:, 63);	
AngularVelocity_LeftLowerLeg_X = gait.angularVelocity(:, 61);
AngularVelocity_LeftLowerLeg_Y = gait.angularVelocity(:, 62);
AngularVelocity_LeftLowerLeg_Z = gait.angularVelocity(:, 63);		

% Right Foot
Acceleration_RightFoot_X = gait.acceleration(:, 52);
Acceleration_RightFoot_Y = gait.acceleration(:, 53);
Acceleration_RightFoot_Z = gait.acceleration(:, 54);
AngularVelocity_RightFoot_X = gait.angularVelocity(:, 52);
AngularVelocity_RightFoot_Y = gait.angularVelocity(:, 53);
AngularVelocity_RightFoot_Z = gait.angularVelocity(:, 54);			

% Left Foot
Acceleration_LeftFoot_X = gait.acceleration(:, 64);
Acceleration_LeftFoot_Y = gait.acceleration(:, 65);
Acceleration_LeftFoot_Z = gait.acceleration(:, 66);
AngularVelocity_LeftFoot_X = gait.angularVelocity(:, 64);
AngularVelocity_LeftFoot_Y = gait.angularVelocity(:, 65);
AngularVelocity_LeftFoot_Z = gait.angularVelocity(:, 66);			
		
		
% Pelvis
Acceleration_Pelvis_X = filterTool(Acceleration_Pelvis_X);
Acceleration_Pelvis_Y = filterTool(Acceleration_Pelvis_Y);
Acceleration_Pelvis_Z = filterTool(Acceleration_Pelvis_Z);
AngularVelocity_Pelvis_X = filterTool(AngularVelocity_Pelvis_X);
AngularVelocity_Pelvis_Y = filterTool(AngularVelocity_Pelvis_Y);
AngularVelocity_Pelvis_Z = filterTool(AngularVelocity_Pelvis_Z);

Jerk_Pelvis_X = diff(Acceleration_Pelvis_X);
Jerk_Pelvis_Y = diff(Acceleration_Pelvis_Y);
Jerk_Pelvis_Z = diff(Acceleration_Pelvis_Z);

% Right Upper Leg
Acceleration_RightUpperLeg_X = filterTool(Acceleration_RightUpperLeg_X);
Acceleration_RightUpperLeg_Y = filterTool(Acceleration_RightUpperLeg_Y);
Acceleration_RightUpperLeg_Z = filterTool(Acceleration_RightUpperLeg_Z);
AngularVelocity_RightUpperLeg_X = filterTool(AngularVelocity_RightUpperLeg_X);
AngularVelocity_RightUpperLeg_Y = filterTool(AngularVelocity_RightUpperLeg_Y);
AngularVelocity_RightUpperLeg_Z = filterTool(AngularVelocity_RightUpperLeg_Z);

Jerk_RightUpperLeg_X = diff(Acceleration_RightUpperLeg_X);
Jerk_RightUpperLeg_Y = diff(Acceleration_RightUpperLeg_Y);
Jerk_RightUpperLeg_Z = diff(Acceleration_RightUpperLeg_Z);		

% Left Upper Leg
Acceleration_LeftUpperLeg_X = filterTool(Acceleration_LeftUpperLeg_X);
Acceleration_LeftUpperLeg_Y = filterTool(Acceleration_LeftUpperLeg_Y);
Acceleration_LeftUpperLeg_Z = filterTool(Acceleration_LeftUpperLeg_Z);
AngularVelocity_LeftUpperLeg_X = filterTool(AngularVelocity_LeftUpperLeg_X);
AngularVelocity_LeftUpperLeg_Y = filterTool(AngularVelocity_LeftUpperLeg_Y);
AngularVelocity_LeftUpperLeg_Z = filterTool(AngularVelocity_LeftUpperLeg_Z);

Jerk_LeftUpperLeg_X = diff(Acceleration_LeftUpperLeg_X);
Jerk_LeftUpperLeg_Y = diff(Acceleration_LeftUpperLeg_Y);
Jerk_LeftUpperLeg_Z = diff(Acceleration_LeftUpperLeg_Z);			

% Right Lower Leg
Acceleration_RightLowerLeg_X = filterTool(Acceleration_RightLowerLeg_X);
Acceleration_RightLowerLeg_Y = filterTool(Acceleration_RightLowerLeg_Y);
Acceleration_RightLowerLeg_Z = filterTool(Acceleration_RightLowerLeg_Z);
AngularVelocity_RightLowerLeg_X = filterTool(AngularVelocity_RightLowerLeg_X);
AngularVelocity_RightLowerLeg_Y = filterTool(AngularVelocity_RightLowerLeg_Y);
AngularVelocity_RightLowerLeg_Z = filterTool(AngularVelocity_RightLowerLeg_Z);	

Jerk_RightLowerLeg_X = diff(Acceleration_RightLowerLeg_X);
Jerk_RightLowerLeg_Y = diff(Acceleration_RightLowerLeg_Y);
Jerk_RightLowerLeg_Z = diff(Acceleration_RightLowerLeg_Z);

% Left Lower Leg
Acceleration_LeftLowerLeg_X = filterTool(Acceleration_LeftLowerLeg_X);
Acceleration_LeftLowerLeg_Y = filterTool(Acceleration_LeftLowerLeg_Y);
Acceleration_LeftLowerLeg_Z = filterTool(Acceleration_LeftLowerLeg_Z);	
AngularVelocity_LeftLowerLeg_X = filterTool(AngularVelocity_LeftLowerLeg_X);
AngularVelocity_LeftLowerLeg_Y = filterTool(AngularVelocity_LeftLowerLeg_Y);
AngularVelocity_LeftLowerLeg_Z = filterTool(AngularVelocity_LeftLowerLeg_Z);

Jerk_LeftLowerLeg_X = diff(Acceleration_LeftLowerLeg_X);
Jerk_LeftLowerLeg_Y = diff(Acceleration_LeftLowerLeg_Y);
Jerk_LeftLowerLeg_Z = diff(Acceleration_LeftLowerLeg_Z);

% Right Foot
Acceleration_RightFoot_X = filterTool(Acceleration_RightFoot_X);
Acceleration_RightFoot_Y = filterTool(Acceleration_RightFoot_Y);
Acceleration_RightFoot_Z = filterTool(Acceleration_RightFoot_Z);
AngularVelocity_RightFoot_X = filterTool(AngularVelocity_RightFoot_X);
AngularVelocity_RightFoot_Y = filterTool(AngularVelocity_RightFoot_Y);
AngularVelocity_RightFoot_Z = filterTool(AngularVelocity_RightFoot_Z);

Jerk_RightFoot_X = diff(Acceleration_RightFoot_X);
Jerk_RightFoot_Y = diff(Acceleration_RightFoot_Y);
Jerk_RightFoot_Z = diff(Acceleration_RightFoot_Z);		

% Left Foot
Acceleration_LeftFoot_X = filterTool(Acceleration_LeftFoot_X);
Acceleration_LeftFoot_Y = filterTool(Acceleration_LeftFoot_Y);
Acceleration_LeftFoot_Z = filterTool(Acceleration_LeftFoot_Z);
AngularVelocity_LeftFoot_X = filterTool(AngularVelocity_LeftFoot_X);
AngularVelocity_LeftFoot_Y = filterTool(AngularVelocity_LeftFoot_Y);
AngularVelocity_LeftFoot_Z = filterTool(AngularVelocity_LeftFoot_Z);

Jerk_LeftFoot_X = diff(Acceleration_LeftFoot_X);
Jerk_LeftFoot_Y = diff(Acceleration_LeftFoot_Y);
Jerk_LeftFoot_Z = diff(Acceleration_LeftFoot_Z);

	if(normalize)
	
		% Pelvis
		Acceleration_Pelvis_X = normalizeVector(Acceleration_Pelvis_X);
		Acceleration_Pelvis_Y = normalizeVector(Acceleration_Pelvis_Y);
		Acceleration_Pelvis_Z = normalizeVector(Acceleration_Pelvis_Z);
		
		AngularVelocity_Pelvis_X = normalizeVector(AngularVelocity_Pelvis_X);
		AngularVelocity_Pelvis_Y = normalizeVector(AngularVelocity_Pelvis_Y);
		AngularVelocity_Pelvis_Z = normalizeVector(AngularVelocity_Pelvis_Z);

		% Right Upper Leg
		Acceleration_RightUpperLeg_X = normalizeVector(Acceleration_RightUpperLeg_X);
		Acceleration_RightUpperLeg_Y = normalizeVector(Acceleration_RightUpperLeg_Y);
		Acceleration_RightUpperLeg_Z = normalizeVector(Acceleration_RightUpperLeg_Z);
		
		AngularVelocity_RightUpperLeg_X = normalizeVector(AngularVelocity_RightUpperLeg_X);
		AngularVelocity_RightUpperLeg_Y = normalizeVector(AngularVelocity_RightUpperLeg_Y);
		AngularVelocity_RightUpperLeg_Z = normalizeVector(AngularVelocity_RightUpperLeg_Z);		
		
		% Left Upper Leg
		Acceleration_LeftUpperLeg_X = normalizeVector(Acceleration_LeftUpperLeg_X);
		Acceleration_LeftUpperLeg_Y = normalizeVector(Acceleration_LeftUpperLeg_Y);
		Acceleration_LeftUpperLeg_Z = normalizeVector(Acceleration_LeftUpperLeg_Z);

		AngularVelocity_LeftUpperLeg_X = normalizeVector(AngularVelocity_LeftUpperLeg_X);
		AngularVelocity_LeftUpperLeg_Y = normalizeVector(AngularVelocity_LeftUpperLeg_Y);
		AngularVelocity_LeftUpperLeg_Z = normalizeVector(AngularVelocity_LeftUpperLeg_Z);			
		
		% Right Lower Leg
		Acceleration_RightLowerLeg_X = normalizeVector(Acceleration_RightLowerLeg_X);
		Acceleration_RightLowerLeg_Y = normalizeVector(Acceleration_RightLowerLeg_Y);
		Acceleration_RightLowerLeg_Z = normalizeVector(Acceleration_RightLowerLeg_Z);
		
		AngularVelocity_RightLowerLeg_X = normalizeVector(AngularVelocity_RightLowerLeg_X);
		AngularVelocity_RightLowerLeg_Y = normalizeVector(AngularVelocity_RightLowerLeg_Y);
		AngularVelocity_RightLowerLeg_Z = normalizeVector(AngularVelocity_RightLowerLeg_Z);		
		
		% Left Lower Leg
		Acceleration_LeftLowerLeg_X = normalizeVector(Acceleration_LeftLowerLeg_X);
		Acceleration_LeftLowerLeg_Y = normalizeVector(Acceleration_LeftLowerLeg_Y);
		Acceleration_LeftLowerLeg_Z = normalizeVector(Acceleration_LeftLowerLeg_Z);	
		
		AngularVelocity_LeftLowerLeg_X = normalizeVector(AngularVelocity_LeftLowerLeg_X);
		AngularVelocity_LeftLowerLeg_Y = normalizeVector(AngularVelocity_LeftLowerLeg_Y);
		AngularVelocity_LeftLowerLeg_Z = normalizeVector(AngularVelocity_LeftLowerLeg_Z);		

		% Right Foot
		Acceleration_RightFoot_X = normalizeVector(Acceleration_RightFoot_X);
		Acceleration_RightFoot_Y = normalizeVector(Acceleration_RightFoot_Y);
		Acceleration_RightFoot_Z = normalizeVector(Acceleration_RightFoot_Z);
		
		AngularVelocity_RightFoot_X = normalizeVector(AngularVelocity_RightFoot_X);
		AngularVelocity_RightFoot_Y = normalizeVector(AngularVelocity_RightFoot_Y);
		AngularVelocity_RightFoot_Z = normalizeVector(AngularVelocity_RightFoot_Z);			
		
		% Left Foot
		Acceleration_LeftFoot_X = normalizeVector(Acceleration_LeftFoot_X);
		Acceleration_LeftFoot_Y = normalizeVector(Acceleration_LeftFoot_Y);
		Acceleration_LeftFoot_Z = normalizeVector(Acceleration_LeftFoot_Z);
		
		AngularVelocity_LeftFoot_X = normalizeVector(AngularVelocity_LeftFoot_X);
		AngularVelocity_LeftFoot_Y = normalizeVector(AngularVelocity_LeftFoot_Y);
		AngularVelocity_LeftFoot_Z = normalizeVector(AngularVelocity_LeftFoot_Z);
	
	end