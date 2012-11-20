% gait = divideGaitBySensorAccelerationStartEnd(gait, 13, 5, 5, 950)
function [gait] = divideGaitBySensorAccelerationStartEnd( gait, cycle, Rinterval, Linterval, start)

	%if nargin < 3
	%	Rinterval = 5
	%	Linterval = 5
	%end
	
	% LeftFoot (17) X: 48, Y: 49, Z: 51
	LeftFootZ = gait.sensorAcceleration(start:end,51)
	
	% RightFoot (14) X: 40, Y: 41, Z: 42
	RightFootZ = gait.sensorAcceleration(start:end,42)
	
	% 3th order lowpass 20Hz (Sample Rate: 120Hz)
	[B,A]= butter(3, 30/60, 'low')
	LeftFootZ(:,1) = filtfilt(B, A, LeftFootZ(:, 1))
	RightFootZ(:,1) = filtfilt(B, A, RightFootZ(:, 1))
	
	%figure(1)
	%hold all
	%h(1) = plot([1:length(LeftFootZ)], gait.sensorAcceleration(:,51))
	%s{1} = 'Origin'
	%h(2) = plot([1:length(LeftFootZ)], LeftFootZ(:,1))
	%s{2} = 'Filtered'
	%legend(h, s)
	%hold off	
	
	%%%%%%%%%%%%%%%
	
	% Calculate median of first & last interval.
	
	u = sort(unique(LeftFootZ(:,1)))
	intervalWidth = int32(length(u) / Linterval)
	medianLeftFootZ_Last = median(u(end-intervalWidth+1:end))
	medianLeftFootZ_First = median(u(1:intervalWidth))
	
	u = sort(unique(RightFootZ(:,1)))
	intervalWidth = int32(length(u) / Rinterval)
	medianRightFootZ_Last = median(u(end-intervalWidth+1:end))
	medianRightFootZ_First = median(u(1:intervalWidth))
	
	%%%%%%%%%%%%%%%%
	
	% Left Initial Contact
	for i = [2:gait.frameLength-start]
		if LeftFootZ(i) < medianLeftFootZ_First
			if (LeftFootZ(i) < LeftFootZ(i-1) && LeftFootZ(i) < LeftFootZ(i+1))
				gait.LeftInitialContact = [gait.LeftInitialContact i]
			end
		end
	end	
	
	% Right Initial Contact
	for i = [2:gait.frameLength-start]
		if RightFootZ(i) < medianRightFootZ_First
			if (RightFootZ(i) < RightFootZ(i-1) && RightFootZ(i) < RightFootZ(i+1))
				gait.RightInitialContact = [gait.RightInitialContact i]
			end
		end
	end	
	
	% Left Toe Off
	for i = [2:gait.frameLength-start]
		if LeftFootZ(i) > medianLeftFootZ_Last
			if (LeftFootZ(i) > LeftFootZ(i-1) && LeftFootZ(i) > LeftFootZ(i+1))
				gait.LeftToeOff = [gait.LeftToeOff i]
			end
		end
	end
	
	% Right Toe Off
	for i = [2:gait.frameLength-start]
		if RightFootZ(i) > medianRightFootZ_Last
			if (RightFootZ(i) > RightFootZ(i-1) && RightFootZ(i) > RightFootZ(i+1))
				gait.RightToeOff = [gait.RightToeOff i]
			end
		end
	end
	

end