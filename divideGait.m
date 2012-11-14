function [gait] = divideGait( gait, speedVariation )
	
	% Speed Variation = 10 As Default
	if nargin < 2
		speedVariation = 10
	end
	
	%%%%%%%%%%%%%%%%%%%%%%%
	
	u = sort(unique((gait.sensorAcceleration(:,49))))
	maxLeftFootSensorAcceleration = u(end-25)
	u = sort(unique((gait.sensorAcceleration(:,40))))
	maxRightFootSensorAcceleration = u(end-25)
	
	%maxLeftFootSensorAcceleration = -3
	%maxRightFootSensorAcceleration = -3
	
	% Left Initial Contact
	for i = [2:gait.frameLength]
		if gait.sensorAcceleration(i,49) > maxLeftFootSensorAcceleration
			if (gait.sensorAcceleration(i, 49) > gait.sensorAcceleration(i-1, 49)) && (gait.sensorAcceleration(i, 49) > gait.sensorAcceleration(i+1, 49))
				gait.LeftInitialContact = [ gait.LeftInitialContact i ]
			end
		end
	end
	% End Left Inital Contact

	% Right Initial Contact
	for i = [2:gait.frameLength]
		if gait.sensorAcceleration(i,40) > maxRightFootSensorAcceleration
			if (gait.sensorAcceleration(i, 40) > gait.sensorAcceleration(i-1, 40)) && (gait.sensorAcceleration(i, 40) > gait.sensorAcceleration(i+1, 40))
				gait.RightInitialContact = [ gait.RightInitialContact i ]
			end
		end
	end
	% End Right Initial Contact

	% Left Toe Off
	for i = [2:gait.frameLength]
		
		if gait.jointAngle(i, 63) < -12
		
			if (length(gait.LeftToeOff) >= 3)
				if ( i - gait.LeftToeOff(end) < (gait.LeftToeOff(end) - gait.LeftToeOff(2)) / (length(gait.LeftToeOff) - 2) - speedVariation)
					continue
				end
			end	
			
			if (gait.jointAngle(i, 63) < gait.jointAngle(i-1, 63) && gait.jointAngle(i, 63) < gait.jointAngle(i+1, 63))
				gait.LeftToeOff = [gait.LeftToeOff i]
			end
		end
	end
	% End Left Toe Off

	% Right Toe Off
	for i = [2:gait.frameLength]
		
		if gait.jointAngle(i, 51) < -12
		
			if (length(gait.RightToeOff) >= 3)
				if ( i - gait.RightToeOff(end) < (gait.RightToeOff(end) - gait.RightToeOff(2)) / (length(gait.RightToeOff) - 2) - speedVariation)
					continue
				end
			end	
			
			if (gait.jointAngle(i, 51) < gait.jointAngle(i-1, 51) && gait.jointAngle(i, 51) < gait.jointAngle(i+1, 51))
				gait.RightToeOff = [gait.RightToeOff i]
			end
		end
	end	
	% End Right Toe Off
	
	% Chekc Left Foot First Or Right Foot First
	if gait.RightInitialContact(1) > gait.LeftInitialContact(1)
		% Left Foot First
		for i = [1:length(gait.LeftInitialContact)]
			% gait.DoubleSupport = [gait.DoubleSupport gait.LeftInitialContact
		end
	else
		% Right Foot First
	
	
	end
	
end