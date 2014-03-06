% gait = divideGaitBySensorAcceleration(gait, 13, 5, 5)
function [gait] = divideGaitBySensorAcceleration( gait, cycle, Rinterval, Linterval )

	% Init Marker
	gait.LeftInitialContact = [];
	gait.RightInitialContact = [];
	gait.LeftToeOff = [];
	gait.RightToeOff = [];
	gait.DoubleSupport = [];

	nearDiff = 15;
	
	% LeftFoot (17) X: 48, Y: 49, Z: 51
	LeftFootZ = gait.sensorAcceleration(:,51);
	
	% RightFoot (14) X: 40, Y: 41, Z: 42
	RightFootZ = gait.sensorAcceleration(:,42);	
	
	%%%%%%%%%%%%%%
	% Filter

	% 3th order lowpass 20Hz (Sample Rate: 120Hz)
	[B,A]= butter(3, 20/60, 'low');
	LeftFootZ(:,1) = filtfilt(B, A, LeftFootZ(:, 1));
	RightFootZ(:,1) = filtfilt(B, A, RightFootZ(:, 1));
	
	%%%%%%%%%%%%%%
	% Find the walking start point.
	
	LeftStart = 1; % Left foot start
	RightStart = 1; % Right foot start
	
	% Assume the variance is 3
	for i = [2:gait.frameLength]
		if (abs(LeftFootZ(i) - LeftFootZ(i-1)) > 3)
			LeftStart = i;
			break
		end
	end
	
	for i = [2:gait.frameLength]
		if (abs(RightFootZ(i) - RightFootZ(i-1)) > 3)
			RightStart = i;
			break
		end
	end
	% End
	%%%%%%%%%%%%%
	
	%%%%%%%%%%%%%
	% Left foot first or right foot first??
	if ( LeftStart > RightStart )
		LeftFootZ = LeftFootZ(RightStart:end,1);
		RightFootZ = RightFootZ(RightStart:end,1);
		Start = RightStart;
	else
		LeftFootZ = LeftFootZ(LeftStart:end,1);
		RightFootZ = RightFootZ(LeftStart:end,1);
		Start = LeftStart;
	end
	%%%%%%%%%%%%
	
	% Calculate actual frame length (length - start)
	ActualFrameLength = gait.frameLength - Start;
	gait.Start = Start;
	
	%%%%%%%%%%%%%%%
	% Compare origin data and filtered data.
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
	u = sort(unique(LeftFootZ(:,1)));
	intervalWidth = int32(length(u) / Linterval);
	medianLeftFootZ_Last = median(u(end-intervalWidth+1:end));
	medianLeftFootZ_First = median(u(1:intervalWidth));
	
	u = sort(unique(RightFootZ(:,1)));
	intervalWidth = int32(length(u) / Rinterval);
	medianRightFootZ_Last = median(u(end-intervalWidth+1:end));
	medianRightFootZ_First = median(u(1:intervalWidth));
	
	%%%%%%%%%%%%%%%%
	
	% In the first phase, we find the peak of wavelet.
	
	% Left Initial Contact
	for i = [2:ActualFrameLength]
		if LeftFootZ(i) < medianLeftFootZ_First
			if (LeftFootZ(i) < LeftFootZ(i-1) && LeftFootZ(i) < LeftFootZ(i+1))
				gait.LeftInitialContact = [gait.LeftInitialContact i+Start];
			end
		end
	end	
	
	% Right Initial Contact
	for i = [2:ActualFrameLength]
		if RightFootZ(i) < medianRightFootZ_First
			if (RightFootZ(i) < RightFootZ(i-1) && RightFootZ(i) < RightFootZ(i+1))
				gait.RightInitialContact = [gait.RightInitialContact i+Start];
			end
		end
	end	
	
	% Left Toe Off
	for i = [2:ActualFrameLength]
		if LeftFootZ(i) > medianLeftFootZ_Last
			if (LeftFootZ(i) > LeftFootZ(i-1) && LeftFootZ(i) > LeftFootZ(i+1))
				gait.LeftToeOff = [gait.LeftToeOff i+Start];
			end
		end
	end
	
	% Right Toe Off
	for i = [2:ActualFrameLength]
		if RightFootZ(i) > medianRightFootZ_Last
			if (RightFootZ(i) > RightFootZ(i-1) && RightFootZ(i) > RightFootZ(i+1))
				gait.RightToeOff = [gait.RightToeOff i+Start];
			end
		end
	end
	
	%%%%%%%%%%%%%%
	% In the second phase, we drop error data retrieved from first phase.
	% If the "contact" is too near ( < 20 ), drop it.
	
	diff = 20;
	
	% Prepare drop list
	DropLeft = [];
	DropRight = [];
	
	% Left Toe Off between Left Initial Contact
	for i = [1:length(gait.LeftToeOff)]
		for j = [1:length(gait.LeftInitialContact)]
			if (abs(gait.LeftToeOff(i) - gait.LeftInitialContact(j)) <= diff)
				DropLeft = [ DropLeft gait.LeftToeOff(i)];
			end
		end
	end
	
	% Right Toe Off between Right Initial Contact
	for i = [1:length(gait.RightToeOff)]
		for j = [1:length(gait.RightInitialContact)]
			if (abs(gait.RightToeOff(i) - gait.RightInitialContact(j)) <= diff)
				DropRight = [ DropRight  gait.RightToeOff(i)];
			end
		end
	end
	
	% Drop
	gait.RightToeOff = setdiff(gait.RightToeOff, DropRight);
	gait.LeftToeOff = setdiff(gait.LeftToeOff, DropLeft);
	
	Drop = [];
	
	% Right Toe Off between Right Toe Off
	for i = [1:length(gait.RightToeOff)-1]
		if(abs(gait.RightToeOff(i) - gait.RightToeOff(i+1)) <= nearDiff)
			Drop = [Drop gait.RightToeOff(i)];
		end
	end
	
	% Drop
	gait.RightToeOff = setdiff(gait.RightToeOff, Drop);
	
	Drop = [];
	
	% Left Toe Off between Left Toe Off
	for i = [1:length(gait.LeftToeOff)-1]
		if(abs(gait.LeftToeOff(i) - gait.LeftToeOff(i+1)) <= nearDiff)
			Drop = [Drop gait.LeftToeOff(i)];
		end
	end
	
	% Drop
	gait.LeftToeOff = setdiff(gait.LeftToeOff, Drop);
	
	% Right Initial Contact between Right Initial Contact
	for i = [1:length(gait.RightInitialContact)-1]
		if(abs(gait.RightInitialContact(i) - gait.RightInitialContact(i+1)) <= nearDiff)
			Drop = [Drop gait.RightInitialContact(i)];
		end
	end
	
	% Drop
	gait.RightInitialContact = setdiff(gait.RightInitialContact, Drop);	
	
	% Left Initial Contact between Left Initial Contact
	for i = [1:length(gait.LeftInitialContact)-1]
		if(abs(gait.LeftInitialContact(i) - gait.LeftInitialContact(i+1)) <= nearDiff)
			Drop = [Drop gait.LeftInitialContact(i)];
		end
	end
	
	% Drop
	gait.LeftInitialContact = setdiff(gait.LeftInitialContact, Drop);	
	
	%%%%%%%%%%%%%%%
	
	% ReFormat
	%% LI RT RI LT
	%% Drop All Marker Before LI(1)
	gait.RightInitialContact(find(gait.RightInitialContact < gait.LeftInitialContact(1))) = [];
	gait.RightToeOff(find(gait.RightToeOff < gait.LeftInitialContact(1))) = [];
	gait.LeftToeOff(find(gait.LeftToeOff < gait.LeftInitialContact(1))) = [];
	
	LI = [];
	RT = [];
	RI = [];
	LT = [];
	% Get the shortest length
	minLen = min([length(gait.RightInitialContact), length(gait.LeftInitialContact), length(gait.RightToeOff), length(gait.LeftToeOff)]);
	
	for i = [1:minLen]
		
		LI = [LI gait.LeftInitialContact(i)];
		
		if (gait.RightToeOff(i) > gait.LeftInitialContact(i))
			RT = [RT gait.RightToeOff(i)];
		else
			LI(end) = [];
			continue;
		end
		
		if (gait.RightInitialContact(i) > gait.RightToeOff(i))
			RI = [RI gait.RightInitialContact(i)];
		else
			LI(end) = [];
			RT(end) = [];
			continue;
		end
		
		if(gait.LeftToeOff(i) > gait.RightInitialContact(i))
			LT = [LT gait.LeftToeOff(i)];
		else
			LI(end) = [];
			RT(end) = [];
		end
		
	end
	
	gait.RightToeOff = RT;
	gait.LeftToeOff = LT;
	gait.RightInitialContact = RI;
	gait.LeftInitialContact = LI;
	
	% Toe Off Recalculation
	windowSize = 6;
	slope = 4.5;
	% LI v.s RT
	for i = [1:minLen]
		
		pivot = gait.LeftInitialContact(i);
		while pivot < gait.RightToeOff(i)
			
			pivot = pivot + windowSize;
			
			% Calculate Slope
			if (abs(RightFootZ(pivot-Start) - RightFootZ(pivot-windowSize-Start) / windowSize) > slope)
				gait.RightToeOff(i) = pivot + windowSize;
				break;
			end
			
		end
		
	end
	
	% RI v.s LT
	for i = [1:minLen]
		
		pivot = gait.RightInitialContact(i);
		while pivot < gait.LeftToeOff(i)
			
			pivot = pivot + windowSize;
			
			% Calculate Slope
			if (abs(LeftFootZ(pivot-Start) - LeftFootZ(pivot-windowSize-Start) / windowSize) > slope)
				gait.LeftToeOff(i) = pivot + windowSize;
				break;
			end
			
		end
		
	end
	
	%%%%%%%%%%%%%%%
	
	% Smart Validation (Left First Or Right First ??)
	%if(gait.RightInitialContact(1) > gait.LeftInitialContact(1))
	%	
	%	if(gait.LeftToeOff(1) < gait.LeftInitialContact(1))
	%		gait.LeftToeOff = gait.LeftToeOff(2:end)
	%	end
	%	
	%	if(gait.RightToeOff(1) < gait.LeftInitialContact(1))
	%		gait.RightToeOff = gait.RightToeOff(2:end)
	%	end
	%	
	%else
	%	
	%	if(gait.LeftToeOff(1) < gait.RightInitialContact(1))
	%		gait.LeftToeOff = gait.LeftToeOff(2:end)
	%	end
	%	
	%	if(gait.RightToeOff(1) < gait.RightInitialContact(1))
	%		gait.RightToeOff = gait.RightToeOff(2:end)
	%	end
	%	
	%end
	
	% Length Validation
	%if(length(gait.RightToeOff) ~= length(gait.LeftToeOff))
	%	if(length(gait.RightToeOff) > length(gait.LeftToeOff))
	%		gait.RightInitialContact = gait.RightInitialContact(1:length(gait.LeftToeOff));
	%		gait.LeftInitialContact = gait.LeftInitialContact(1:length(gait.LeftToeOff));
	%		gait.RightToeOff = gait.RightToeOff(1:length(gait.LeftToeOff));
	%	else
	%		gait.RightInitialContact = gait.RightInitialContact(1:length(gait.RightToeOff));
	%		gait.LeftInitialContact = gait.LeftInitialContact(1:length(gait.RightToeOff));
	%		gait.LeftToeOff = gait.LeftToeOff(1:length(gait.RightToeOff));
	%	end
	%end
	
end