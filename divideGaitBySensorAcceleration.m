% gait = divideGaitBySensorAcceleration(gait, 13, 5, 5)
function [gait] = divideGaitBySensorAcceleration( gait, cycle, Rinterval, Linterval )

	% Init Marker
	gait.LeftInitialContact = []
	gait.RightInitialContact = []
	gait.LeftToeOff = []
	gait.RightToeOff = []
	gait.DoubleSupport = []

	nearDiff = 15
	
	%if nargin < 3
	%	Rinterval = 5
	%	Linterval = 5
	%end
	
	% LeftFoot (17) X: 48, Y: 49, Z: 51
	LeftFootZ = gait.sensorAcceleration(:,51)
	
	% RightFoot (14) X: 40, Y: 41, Z: 42
	RightFootZ = gait.sensorAcceleration(:,42)	

	% 3th order lowpass 20Hz (Sample Rate: 120Hz)
	[B,A]= butter(3, 20/60, 'low')
	LeftFootZ(:,1) = filtfilt(B, A, LeftFootZ(:, 1))
	RightFootZ(:,1) = filtfilt(B, A, RightFootZ(:, 1))
	
	% Start Detection
	LeftStart = 1
	RightStart = 1
	
	for i = [2:gait.frameLength]
		if (abs(LeftFootZ(i) - LeftFootZ(i-1)) > 3)
			LeftStart = i
			break
		end
	end
	
	for i = [2:gait.frameLength]
		if (abs(RightFootZ(i) - RightFootZ(i-1)) > 3)
			RightStart = i
			break
		end
	end
	
	% End Start Detection
	
	if ( LeftStart > RightStart )
		LeftFootZ = LeftFootZ(RightStart:end,1)
		RightFootZ = RightFootZ(RightStart:end,1)
		Start = RightStart
	else
		LeftFootZ = LeftFootZ(LeftStart:end,1)
		RightFootZ = RightFootZ(LeftStart:end,1)	
		Start = LeftStart
	end
	
	ActualFrameLength = gait.frameLength - Start
	
	gait.Start = Start
	
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
	for i = [2:ActualFrameLength]
	
		if LeftFootZ(i) < medianLeftFootZ_First
			if (LeftFootZ(i) < LeftFootZ(i-1) && LeftFootZ(i) < LeftFootZ(i+1))
				gait.LeftInitialContact = [gait.LeftInitialContact i+Start]
			end
		end
	end	
	
	% Right Initial Contact
	for i = [2:ActualFrameLength]
	
		if RightFootZ(i) < medianRightFootZ_First
			if (RightFootZ(i) < RightFootZ(i-1) && RightFootZ(i) < RightFootZ(i+1))
				gait.RightInitialContact = [gait.RightInitialContact i+Start]
			end
		end
	end	
	
	% Left Toe Off
	for i = [2:ActualFrameLength]
		
		if LeftFootZ(i) > medianLeftFootZ_Last
			if (LeftFootZ(i) > LeftFootZ(i-1) && LeftFootZ(i) > LeftFootZ(i+1))
				gait.LeftToeOff = [gait.LeftToeOff i+Start]
			end
		end
	end
	
	DropLeft = []
	DropRight = []
	
	% Right Toe Off
	for i = [2:ActualFrameLength]
	
		if RightFootZ(i) > medianRightFootZ_Last
			if (RightFootZ(i) > RightFootZ(i-1) && RightFootZ(i) > RightFootZ(i+1))
				gait.RightToeOff = [gait.RightToeOff i+Start]
			end
		end
	end
	
	DropLeft = []
	DropRight = []	
	
	% Toe Off - Initial Contact
	for i = [1:length(gait.LeftToeOff)]
		for j = [1:length(gait.LeftInitialContact)]
			if (abs(gait.LeftToeOff(i) - gait.LeftInitialContact(j)) <= 20)
				DropLeft = [ DropLeft gait.LeftToeOff(i)]
			end
		end
	end
	
	for i = [1:length(gait.RightToeOff)]
		for j = [1:length(gait.RightInitialContact)]
			if (abs(gait.RightToeOff(i) - gait.RightInitialContact(j)) <= 20)
				DropRight = [ DropRight  gait.RightToeOff(i)]
			end
		end
	end
	
	gait.RightToeOff = setdiff(gait.RightToeOff, DropRight)
	gait.LeftToeOff = setdiff(gait.LeftToeOff, DropLeft)
	
	% Smart Validation (Left First Or Right First ??)
	if(gait.RightInitialContact(1) > gait.LeftInitialContact(1))
		
		if(gait.LeftToeOff(1) < gait.LeftInitialContact(1))
			gait.LeftToeOff = gait.LeftToeOff(2:end)
		end
		
		if(gait.RightToeOff(1) < gait.LeftInitialContact(1))
			gait.RightToeOff = gait.RightToeOff(2:end)
		end
		
	else
		
		if(gait.LeftToeOff(1) < gait.RightInitialContact(1))
			gait.LeftToeOff = gait.LeftToeOff(2:end)
		end
		
		if(gait.RightToeOff(1) < gait.RightInitialContact(1))
			gait.RightToeOff = gait.RightToeOff(2:end)
		end
		
	end
	
	% Distance Validation
	Drop = []
	
	for i = [1:length(gait.RightToeOff)-1]
		if(abs(gait.RightToeOff(i) - gait.RightToeOff(i+1)) <= nearDiff)
			Drop = [Drop gait.RightToeOff(i)]
		end
	end
	
	gait.RightToeOff = setdiff(gait.RightToeOff, Drop)
	
	Drop = []
	
	for i = [1:length(gait.LeftToeOff)-1]
		if(abs(gait.LeftToeOff(i) - gait.LeftToeOff(i+1)) <= nearDiff)
			Drop = [Drop gait.LeftToeOff(i)]
		end
	end
	
	gait.LeftToeOff = setdiff(gait.LeftToeOff, Drop)
	
	% Length Validation
	if(length(gait.RightToeOff) ~= length(gait.LeftToeOff))
		if(length(gait.RightToeOff) > length(gait.LeftToeOff))
			gait.RightInitialContact = gait.RightInitialContact(1:length(gait.LeftToeOff))
			gait.LeftInitialContact = gait.LeftInitialContact(1:length(gait.LeftToeOff))
			gait.RightToeOff = gait.RightToeOff(1:length(gait.LeftToeOff))
		else
			gait.RightInitialContact = gait.RightInitialContact(1:length(gait.RightToeOff))
			gait.LeftInitialContact = gait.LeftInitialContact(1:length(gait.RightToeOff))
			gait.LeftToeOff = gait.LeftToeOff(1:length(gait.RightToeOff))			
		end
	end
	
end