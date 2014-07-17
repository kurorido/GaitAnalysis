% FeatureInitFragment.m

normalize = 1;

Acceleration_L3_X = zeros(1, END_TIME);

% Pelvis
Acceleration_Pelvis_X = zeros(1, END_TIME);
Acceleration_Pelvis_Y = zeros(1, END_TIME);
Acceleration_Pelvis_Z = zeros(1, END_TIME);

AngularVelocity_Pelvis_X = zeros(1, END_TIME);
AngularVelocity_Pelvis_Y = zeros(1, END_TIME);
AngularVelocity_Pelvis_Z = zeros(1, END_TIME);

% Right Upper Leg
Acceleration_RightUpperLeg_X = zeros(1, END_TIME);
Acceleration_RightUpperLeg_Y = zeros(1, END_TIME);
Acceleration_RightUpperLeg_Z = zeros(1, END_TIME);

AngularVelocity_RightUpperLeg_X = zeros(1, END_TIME);
AngularVelocity_RightUpperLeg_Y = zeros(1, END_TIME);
AngularVelocity_RightUpperLeg_Z = zeros(1, END_TIME);

% Left Upper Leg
Acceleration_LeftUpperLeg_X = zeros(1, END_TIME);
Acceleration_LeftUpperLeg_Y = zeros(1, END_TIME);
Acceleration_LeftUpperLeg_Z = zeros(1, END_TIME);

AngularVelocity_LeftUpperLeg_X = zeros(1, END_TIME);
AngularVelocity_LeftUpperLeg_Y = zeros(1, END_TIME);
AngularVelocity_LeftUpperLeg_Z = zeros(1, END_TIME);

% Right Lower Leg
Acceleration_RightLowerLeg_X = zeros(1, END_TIME);
Acceleration_RightLowerLeg_Y = zeros(1, END_TIME);
Acceleration_RightLowerLeg_Z = zeros(1, END_TIME);

AngularVelocity_RightLowerLeg_X = zeros(1, END_TIME);
AngularVelocity_RightLowerLeg_Y = zeros(1, END_TIME);
AngularVelocity_RightLowerLeg_Z = zeros(1, END_TIME);

% Left Lower Leg
Acceleration_LeftLowerLeg_X = zeros(1, END_TIME);
Acceleration_LeftLowerLeg_Y = zeros(1, END_TIME);
Acceleration_LeftLowerLeg_Z = zeros(1, END_TIME);

AngularVelocity_LeftLowerLeg_X = zeros(1, END_TIME);
AngularVelocity_LeftLowerLeg_Y = zeros(1, END_TIME);
AngularVelocity_LeftLowerLeg_Z = zeros(1, END_TIME);

% Right Foot
Acceleration_RightFoot_X = zeros(1, END_TIME);
Acceleration_RightFoot_Y = zeros(1, END_TIME);
Acceleration_RightFoot_Z = zeros(1, END_TIME);

AngularVelocity_RightFoot_X = zeros(1, END_TIME);
AngularVelocity_RightFoot_Y = zeros(1, END_TIME);
AngularVelocity_RightFoot_Z = zeros(1, END_TIME);

% Left Foot
Acceleration_LeftFoot_X = zeros(1, END_TIME);
Acceleration_LeftFoot_Y = zeros(1, END_TIME);
Acceleration_LeftFoot_Z = zeros(1, END_TIME);

AngularVelocity_LeftFoot_X = zeros(1, END_TIME);
AngularVelocity_LeftFoot_Y = zeros(1, END_TIME);
AngularVelocity_LeftFoot_Z = zeros(1, END_TIME);

%SensorAcceleration_Pelvis_X = zeros(1, END_TIME);
%SensorAcceleration_Pelvis_Y = zeros(1, END_TIME);
%SensorAcceleration_Pelvis_Z = zeros(1, END_TIME);
%
%SensorAcceleration_RightUpperLeg_X = zeros(1, END_TIME);
%SensorAcceleration_RightUpperLeg_Y = zeros(1, END_TIME);
%SensorAcceleration_RightUpperLeg_Z = zeros(1, END_TIME);
%
%SensorAngularVelocity_RightUpperLeg_X = zeros(1, END_TIME);
%SensorAngularVelocity_RightUpperLeg_Y = zeros(1, END_TIME);
%SensorAngularVelocity_RightUpperLeg_Z = zeros(1, END_TIME);
%
%SensorAcceleration_RightLowerLeg_X = zeros(1, END_TIME);
%SensorAcceleration_RightLowerLeg_Y = zeros(1, END_TIME);
%SensorAcceleration_RightLowerLeg_Z = zeros(1, END_TIME);
%
%SensorAcceleration_LeftUpperLeg_X = zeros(1, END_TIME);
%SensorAcceleration_LeftUpperLeg_Y = zeros(1, END_TIME);
%SensorAcceleration_LeftUpperLeg_Z = zeros(1, END_TIME);
%
%SensorAngularVelocity_LeftUpperLeg_X = zeros(1, END_TIME);
%SensorAngularVelocity_LeftUpperLeg_Y = zeros(1, END_TIME);
%SensorAngularVelocity_LeftUpperLeg_Z = zeros(1, END_TIME);
%
%SensorAcceleration_LeftLowerLeg_X = zeros(1, END_TIME);
%SensorAcceleration_LeftLowerLeg_Y = zeros(1, END_TIME);
%SensorAcceleration_LeftLowerLeg_Z = zeros(1, END_TIME);
%
%SensorAngularVelocity_LeftLowerLeg_X = zeros(1, END_TIME);
%SensorAngularVelocity_LeftLowerLeg_Y = zeros(1, END_TIME);
%SensorAngularVelocity_LeftLowerLeg_Z = zeros(1, END_TIME);
%
%SensorAngularVelocity_RightLowerLeg_X = zeros(1, END_TIME);
%SensorAngularVelocity_RightLowerLeg_Y = zeros(1, END_TIME);
%SensorAngularVelocity_RightLowerLeg_Z = zeros(1, END_TIME);
%
%SensorAcceleration_RightFoot_X = zeros(1, END_TIME);
%SensorAcceleration_RightFoot_Y = zeros(1, END_TIME);
%SensorAcceleration_RightFoot_Z = zeros(1, END_TIME);
%
%SensorAcceleration_LeftFoot_X = zeros(1, END_TIME);
%SensorAcceleration_LeftFoot_Y = zeros(1, END_TIME);
%SensorAcceleration_LeftFoot_Z = zeros(1, END_TIME);


	for j = 1 : END_TIME
		Acceleration_L3_X(j) = str2num(gait.acceleration{j, 7});
		
		%SensorAcceleration_Pelvis_X(j) = str2num(gait.sensorAcceleration{j, 1});
		%SensorAcceleration_Pelvis_Y(j) = str2num(gait.sensorAcceleration{j, 2});
		%SensorAcceleration_Pelvis_Z(j) = str2num(gait.sensorAcceleration{j, 3});
		
		% Pelvis
		Acceleration_Pelvis_X(j) = str2num(gait.acceleration{j, 1});
		Acceleration_Pelvis_Y(j) = str2num(gait.acceleration{j, 2});
		Acceleration_Pelvis_Z(j) = str2num(gait.acceleration{j, 3});
		
		AngularVelocity_Pelvis_X(j) = str2num(gait.angularVelocity{j, 1});
		AngularVelocity_Pelvis_Y(j) = str2num(gait.angularVelocity{j, 2});
		AngularVelocity_Pelvis_Z(j) = str2num(gait.angularVelocity{j, 3});

		% Right Upper Leg
		Acceleration_RightUpperLeg_X(j) = str2num(gait.acceleration{j, 46});
		Acceleration_RightUpperLeg_Y(j) = str2num(gait.acceleration{j, 47});
		Acceleration_RightUpperLeg_Z(j) = str2num(gait.acceleration{j, 48});
		
		AngularVelocity_RightUpperLeg_X(j) = str2num(gait.angularVelocity{j, 46});
		AngularVelocity_RightUpperLeg_Y(j) = str2num(gait.angularVelocity{j, 47});
		AngularVelocity_RightUpperLeg_Z(j) = str2num(gait.angularVelocity{j, 48});		
		
		% Left Upper Leg
		Acceleration_LeftUpperLeg_X(j) = str2num(gait.acceleration{j, 58});
		Acceleration_LeftUpperLeg_Y(j) = str2num(gait.acceleration{j, 59});
		Acceleration_LeftUpperLeg_Z(j) = str2num(gait.acceleration{j, 60});

		AngularVelocity_LeftUpperLeg_X(j) = str2num(gait.angularVelocity{j, 58});
		AngularVelocity_LeftUpperLeg_Y(j) = str2num(gait.angularVelocity{j, 59});
		AngularVelocity_LeftUpperLeg_Z(j) = str2num(gait.angularVelocity{j, 60});			
		
		% Right Lower Leg
		Acceleration_RightLowerLeg_X(j) = str2num(gait.acceleration{j, 49});
		Acceleration_RightLowerLeg_Y(j) = str2num(gait.acceleration{j, 50});
		Acceleration_RightLowerLeg_Z(j) = str2num(gait.acceleration{j, 51});
		
		AngularVelocity_RightLowerLeg_X(j) = str2num(gait.angularVelocity{j, 49});
		AngularVelocity_RightLowerLeg_Y(j) = str2num(gait.angularVelocity{j, 50});
		AngularVelocity_RightLowerLeg_Z(j) = str2num(gait.angularVelocity{j, 51});		
		
		% Left Lower Leg
		Acceleration_LeftLowerLeg_X(j) = str2num(gait.acceleration{j, 61});
		Acceleration_LeftLowerLeg_Y(j) = str2num(gait.acceleration{j, 62});
		Acceleration_LeftLowerLeg_Z(j) = str2num(gait.acceleration{j, 63});	
		
		AngularVelocity_LeftLowerLeg_X(j) = str2num(gait.angularVelocity{j, 61});
		AngularVelocity_LeftLowerLeg_Y(j) = str2num(gait.angularVelocity{j, 62});
		AngularVelocity_LeftLowerLeg_Z(j) = str2num(gait.angularVelocity{j, 63});		

		% Right Foot
		Acceleration_RightFoot_X(j) = str2num(gait.acceleration{j, 52});
		Acceleration_RightFoot_Y(j) = str2num(gait.acceleration{j, 53});
		Acceleration_RightFoot_Z(j) = str2num(gait.acceleration{j, 54});
		
		AngularVelocity_RightFoot_X(j) = str2num(gait.angularVelocity{j, 52});
		AngularVelocity_RightFoot_Y(j) = str2num(gait.angularVelocity{j, 53});
		AngularVelocity_RightFoot_Z(j) = str2num(gait.angularVelocity{j, 54});			
		
		% Left Foot
		Acceleration_LeftFoot_X(j) = str2num(gait.acceleration{j, 64});
		Acceleration_LeftFoot_Y(j) = str2num(gait.acceleration{j, 65});
		Acceleration_LeftFoot_Z(j) = str2num(gait.acceleration{j, 66});
		
		AngularVelocity_LeftFoot_X(j) = str2num(gait.angularVelocity{j, 64});
		AngularVelocity_LeftFoot_Y(j) = str2num(gait.angularVelocity{j, 65});
		AngularVelocity_LeftFoot_Z(j) = str2num(gait.angularVelocity{j, 66});					
		


		
		%SensorAcceleration_RightUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 28});
		%SensorAcceleration_RightUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 29});
		%SensorAcceleration_RightUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 30});
		%
		%SensorAngularVelocity_RightUpperLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 28});
		%SensorAngularVelocity_RightUpperLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 29});
		%SensorAngularVelocity_RightUpperLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 30});
        %
		%SensorAcceleration_RightLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 31});
		%SensorAcceleration_RightLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 32});
		%SensorAcceleration_RightLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 33});
		%
		%SensorAngularVelocity_RightLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 31});
		%SensorAngularVelocity_RightLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 32});
		%SensorAngularVelocity_RightLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 33});
        %
		%SensorAcceleration_RightFoot_X(j) = str2num(gait.sensorAcceleration{j, 34});
		%SensorAcceleration_RightFoot_Y(j) = str2num(gait.sensorAcceleration{j, 35});
		%SensorAcceleration_RightFoot_Z(j) = str2num(gait.sensorAcceleration{j, 36});
        %
		%SensorAcceleration_LeftUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 37});
		%SensorAcceleration_LeftUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 38});
		%SensorAcceleration_LeftUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 39});	
		%
		%SensorAngularVelocity_LeftUpperLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 37});
		%SensorAngularVelocity_LeftUpperLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 38});
		%SensorAngularVelocity_LeftUpperLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 39});
        %
		%SensorAcceleration_LeftLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 40});
		%SensorAcceleration_LeftLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 41});
		%SensorAcceleration_LeftLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 42});
		%
		%SensorAcceleration_LeftFoot_X(j) = str2num(gait.sensorAcceleration{j, 43});
		%SensorAcceleration_LeftFoot_Y(j) = str2num(gait.sensorAcceleration{j, 44});
		%SensorAcceleration_LeftFoot_Z(j) = str2num(gait.sensorAcceleration{j, 45});
		%
		%SensorAngularVelocity_LeftLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 40});
		%SensorAngularVelocity_LeftLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 41});
		%SensorAngularVelocity_LeftLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 42});
	end
		
		% Pelvis
		Acceleration_Pelvis_X = filterTool(Acceleration_Pelvis_X);
		Acceleration_Pelvis_Y = filterTool(Acceleration_Pelvis_Y);
		Acceleration_Pelvis_Z = filterTool(Acceleration_Pelvis_Z);
		
		AngularVelocity_Pelvis_X = filterTool(AngularVelocity_Pelvis_X);
		AngularVelocity_Pelvis_Y = filterTool(AngularVelocity_Pelvis_Y);
		AngularVelocity_Pelvis_Z = filterTool(AngularVelocity_Pelvis_Z);

		% Right Upper Leg
		Acceleration_RightUpperLeg_X = filterTool(Acceleration_RightUpperLeg_X);
		Acceleration_RightUpperLeg_Y = filterTool(Acceleration_RightUpperLeg_Y);
		Acceleration_RightUpperLeg_Z = filterTool(Acceleration_RightUpperLeg_Z);
		
		AngularVelocity_RightUpperLeg_X = filterTool(AngularVelocity_RightUpperLeg_X);
		AngularVelocity_RightUpperLeg_Y = filterTool(AngularVelocity_RightUpperLeg_Y);
		AngularVelocity_RightUpperLeg_Z = filterTool(AngularVelocity_RightUpperLeg_Z);		
		
		% Left Upper Leg
		Acceleration_LeftUpperLeg_X = filterTool(Acceleration_LeftUpperLeg_X);
		Acceleration_LeftUpperLeg_Y = filterTool(Acceleration_LeftUpperLeg_Y);
		Acceleration_LeftUpperLeg_Z = filterTool(Acceleration_LeftUpperLeg_Z);

		AngularVelocity_LeftUpperLeg_X = filterTool(AngularVelocity_LeftUpperLeg_X);
		AngularVelocity_LeftUpperLeg_Y = filterTool(AngularVelocity_LeftUpperLeg_Y);
		AngularVelocity_LeftUpperLeg_Z = filterTool(AngularVelocity_LeftUpperLeg_Z);			
		
		% Right Lower Leg
		Acceleration_RightLowerLeg_X = filterTool(Acceleration_RightLowerLeg_X);
		Acceleration_RightLowerLeg_Y = filterTool(Acceleration_RightLowerLeg_Y);
		Acceleration_RightLowerLeg_Z = filterTool(Acceleration_RightLowerLeg_Z);
		
		AngularVelocity_RightLowerLeg_X = filterTool(AngularVelocity_RightLowerLeg_X);
		AngularVelocity_RightLowerLeg_Y = filterTool(AngularVelocity_RightLowerLeg_Y);
		AngularVelocity_RightLowerLeg_Z = filterTool(AngularVelocity_RightLowerLeg_Z);		
		
		% Left Lower Leg
		Acceleration_LeftLowerLeg_X = filterTool(Acceleration_LeftLowerLeg_X);
		Acceleration_LeftLowerLeg_Y = filterTool(Acceleration_LeftLowerLeg_Y);
		Acceleration_LeftLowerLeg_Z = filterTool(Acceleration_LeftLowerLeg_Z);	
		
		AngularVelocity_LeftLowerLeg_X = filterTool(AngularVelocity_LeftLowerLeg_X);
		AngularVelocity_LeftLowerLeg_Y = filterTool(AngularVelocity_LeftLowerLeg_Y);
		AngularVelocity_LeftLowerLeg_Z = filterTool(AngularVelocity_LeftLowerLeg_Z);		

		% Right Foot
		Acceleration_RightFoot_X = filterTool(Acceleration_RightFoot_X);
		Acceleration_RightFoot_Y = filterTool(Acceleration_RightFoot_Y);
		Acceleration_RightFoot_Z = filterTool(Acceleration_RightFoot_Z);
		
		AngularVelocity_RightFoot_X = filterTool(AngularVelocity_RightFoot_X);
		AngularVelocity_RightFoot_Y = filterTool(AngularVelocity_RightFoot_Y);
		AngularVelocity_RightFoot_Z = filterTool(AngularVelocity_RightFoot_Z);			
		
		% Left Foot
		Acceleration_LeftFoot_X = filterTool(Acceleration_LeftFoot_X);
		Acceleration_LeftFoot_Y = filterTool(Acceleration_LeftFoot_Y);
		Acceleration_LeftFoot_Z = filterTool(Acceleration_LeftFoot_Z);
		
		AngularVelocity_LeftFoot_X = filterTool(AngularVelocity_LeftFoot_X);
		AngularVelocity_LeftFoot_Y = filterTool(AngularVelocity_LeftFoot_Y);
		AngularVelocity_LeftFoot_Z = filterTool(AngularVelocity_LeftFoot_Z);			
	
	%SensorAcceleration_Pelvis_X = filterTool(SensorAcceleration_Pelvis_X);
	%SensorAcceleration_Pelvis_Y = filterTool(SensorAcceleration_Pelvis_Y);
	%SensorAcceleration_Pelvis_Z = filterTool(SensorAcceleration_Pelvis_Z);
	%
	%SensorAcceleration_RightUpperLeg_X = filterTool(SensorAcceleration_RightUpperLeg_X);
	%SensorAcceleration_RightUpperLeg_Y = filterTool(SensorAcceleration_RightUpperLeg_Y);
	%SensorAcceleration_RightUpperLeg_Z = filterTool(SensorAcceleration_RightUpperLeg_Z);
	%
	%SensorAcceleration_RightLowerLeg_X = filterTool(SensorAcceleration_RightLowerLeg_X);
	%SensorAcceleration_RightLowerLeg_Y = filterTool(SensorAcceleration_RightLowerLeg_Y);
	%SensorAcceleration_RightLowerLeg_Z = filterTool(SensorAcceleration_RightLowerLeg_Z);
	%
	%SensorAcceleration_LeftUpperLeg_X = filterTool(SensorAcceleration_LeftUpperLeg_X);
	%SensorAcceleration_LeftUpperLeg_Y = filterTool(SensorAcceleration_LeftUpperLeg_Y);
	%SensorAcceleration_LeftUpperLeg_Z = filterTool(SensorAcceleration_LeftUpperLeg_Z);
	%
	%SensorAcceleration_LeftLowerLeg_X = filterTool(SensorAcceleration_LeftLowerLeg_X);
	%SensorAcceleration_LeftLowerLeg_Y = filterTool(SensorAcceleration_LeftLowerLeg_Y);
	%SensorAcceleration_LeftLowerLeg_Z = filterTool(SensorAcceleration_LeftLowerLeg_Z);
	%
	%SensorAngularVelocity_RightLowerLeg_X = filterTool(SensorAngularVelocity_RightLowerLeg_X);
	%SensorAngularVelocity_RightLowerLeg_Y = filterTool(SensorAngularVelocity_RightLowerLeg_Y);
	%SensorAngularVelocity_RightLowerLeg_Z = filterTool(SensorAngularVelocity_RightLowerLeg_Z);
	%
	%SensorAngularVelocity_LeftLowerLeg_X = filterTool(SensorAngularVelocity_LeftLowerLeg_X);
	%SensorAngularVelocity_LeftLowerLeg_Y = filterTool(SensorAngularVelocity_LeftLowerLeg_Y);
	%SensorAngularVelocity_LeftLowerLeg_Z = filterTool(SensorAngularVelocity_LeftLowerLeg_Z);
	%
	%SensorAcceleration_LeftFoot_X = filterTool(SensorAcceleration_LeftFoot_X);
	%SensorAcceleration_LeftFoot_Y = filterTool(SensorAcceleration_LeftFoot_Y);
	%SensorAcceleration_LeftFoot_Z = filterTool(SensorAcceleration_LeftFoot_Z);
	%
	%SensorAcceleration_RightFoot_X = filterTool(SensorAcceleration_RightFoot_X);
	%SensorAcceleration_RightFoot_Y = filterTool(SensorAcceleration_RightFoot_Y);
	%SensorAcceleration_RightFoot_Z = filterTool(SensorAcceleration_RightFoot_Z);
	%
	%SensorAngularVelocity_LeftUpperLeg_X = filterTool(SensorAngularVelocity_LeftUpperLeg_X);
	%SensorAngularVelocity_LeftUpperLeg_Y = filterTool(SensorAngularVelocity_LeftUpperLeg_Y);	
	%SensorAngularVelocity_LeftUpperLeg_Z = filterTool(SensorAngularVelocity_LeftUpperLeg_Z);	
    %
	%SensorAngularVelocity_RightUpperLeg_X = filterTool(SensorAngularVelocity_RightUpperLeg_X);
	%SensorAngularVelocity_RightUpperLeg_Y = filterTool(SensorAngularVelocity_RightUpperLeg_Y);
	%SensorAngularVelocity_RightUpperLeg_Z = filterTool(SensorAngularVelocity_RightUpperLeg_Z);

	if(normalize == 1)
	
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