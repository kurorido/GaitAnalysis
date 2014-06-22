% FeatureInitFragment.m

Acceleration_L3_X = zeros(1, END_TIME);

SensorAcceleration_Pelvis_X = zeros(1, END_TIME);
SensorAcceleration_Pelvis_Y = zeros(1, END_TIME);
SensorAcceleration_Pelvis_Z = zeros(1, END_TIME);

SensorAcceleration_RightUpperLeg_X = zeros(1, END_TIME);
SensorAcceleration_RightUpperLeg_Y = zeros(1, END_TIME);
SensorAcceleration_RightUpperLeg_Z = zeros(1, END_TIME);

SensorAcceleration_RightLowerLeg_X = zeros(1, END_TIME);
SensorAcceleration_RightLowerLeg_Y = zeros(1, END_TIME);
SensorAcceleration_RightLowerLeg_Z = zeros(1, END_TIME);

SensorAcceleration_LeftUpperLeg_X = zeros(1, END_TIME);
SensorAcceleration_LeftUpperLeg_Y = zeros(1, END_TIME);
SensorAcceleration_LeftUpperLeg_Z = zeros(1, END_TIME);

SensorAcceleration_LeftLowerLeg_X = zeros(1, END_TIME);
SensorAcceleration_LeftLowerLeg_Y = zeros(1, END_TIME);
SensorAcceleration_LeftLowerLeg_Z = zeros(1, END_TIME);

SensorAngularVelocity_LeftLowerLeg_X = zeros(1, END_TIME);
SensorAngularVelocity_LeftLowerLeg_Y = zeros(1, END_TIME);
SensorAngularVelocity_LeftLowerLeg_Z = zeros(1, END_TIME);

	for j = 1 : END_TIME
		Acceleration_L3_X(j) = str2num(gait.acceleration{j, 7});
		
		SensorAcceleration_Pelvis_X(j) = str2num(gait.sensorAcceleration{j, 1});
		SensorAcceleration_Pelvis_Y(j) = str2num(gait.sensorAcceleration{j, 2});
		SensorAcceleration_Pelvis_Z(j) = str2num(gait.sensorAcceleration{j, 3});
		
		SensorAcceleration_RightUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 28});
		SensorAcceleration_RightUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 29});
		SensorAcceleration_RightUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 30});

		SensorAcceleration_RightLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 31});
		SensorAcceleration_RightLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 32});
		SensorAcceleration_RightLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 33});
		
		SensorAngularVelocity_RightLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 31});
		SensorAngularVelocity_RightLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 32});
		SensorAngularVelocity_RightLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 33});				

		SensorAcceleration_LeftUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 37});
		SensorAcceleration_LeftUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 38});
		SensorAcceleration_LeftUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 39});	

		SensorAcceleration_LeftLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 40});
		SensorAcceleration_LeftLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 41});
		SensorAcceleration_LeftLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 42});
		
		SensorAngularVelocity_LeftLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 40});
		SensorAngularVelocity_LeftLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 41});
		SensorAngularVelocity_LeftLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 42});
	end

	% Filter them
	[B,A]= butter(4,15/60,'low');
	Acceleration_L3_X = filtfilt(B, A, Acceleration_L3_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_X = filtfilt(B, A, SensorAcceleration_Pelvis_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_Y = filtfilt(B, A, SensorAcceleration_Pelvis_Y);
	clear A B;		
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_Z = filtfilt(B, A, SensorAcceleration_Pelvis_Z);
	clear A B;	

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_X = filtfilt(B, A, SensorAcceleration_RightUpperLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_Y = filtfilt(B, A, SensorAcceleration_RightUpperLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_Z = filtfilt(B, A, SensorAcceleration_RightUpperLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_X = filtfilt(B, A, SensorAcceleration_RightLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_Y = filtfilt(B, A, SensorAcceleration_RightLowerLeg_Y);
	clear A B;		

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_Z = filtfilt(B, A, SensorAcceleration_RightLowerLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_X = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_Y = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_Y);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_Z = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_X = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_Y = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_Z = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_X = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_Y = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_Z = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_Z);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_X = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_Y = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_Y);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_Z = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_Z);
	clear A B;	