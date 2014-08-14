function ZCs = splitWithZCs(gait, start)

sensor_id = 3;
angularVelocity_Pelvis_Z = [];
for i = start : size(gait.sensorAngularVelocity, 1)
	angularVelocity_Pelvis_Z = [angularVelocity_Pelvis_Z ; str2num(gait.sensorAngularVelocity{i,sensor_id})];
end

% Filter
[B,A]= butter(4,15/120,'low');
angularVelocity_Pelvis_Z = filtfilt(B, A, angularVelocity_Pelvis_Z);
clear A B;

% Find ZC Points
last = 1;
ZCPoints = [];
for i = [2:length(angularVelocity_Pelvis_Z)]

	if(angularVelocity_Pelvis_Z(i-1) < 0 && angularVelocity_Pelvis_Z(i) > 0)
		ZCPoints = [ZCPoints last i];
		last = i+1;
	end

end

ZCs = ZCPoints + start;