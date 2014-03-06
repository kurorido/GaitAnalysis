% data one
% gait = divideGait(gait, 13, 5, 5)
% data two
% gait = divideGait(gait, 13, 4, 5)
function [gait] = divideGaitByJointAngle( gait, cycle, Rinterval, Linterval )
	
	speedVariation = 15
	
	if nargin < 3
		Rinterval = 5
		Linterval = 5
	end
	
	%%%%%%%%%%%%%%%%%%%%%%%
	% Filter
	
	% 3th order lowpass 20Hz (Sample Rate: 120Hz)
	%[B,A]= butter(3, 20/60, 'low')
	%[B,A]= butter(3,30/60);
	%JointLeftAngle(:,1) = filtfilt(B, A, gait.jointAngle(:, 63))
	%JointRightAngle(:,1) = filtfilt(B, A, gait.jointAngle(:, 51))
	
	%figure(1)
	%hold all
	%h(1) = plot([1:length(JointLeftAngle)], gait.jointAngle(:, 63))
	%s{1} = 'Origin'
	%h(2) = plot([1:length(JointLeftAngle)], JointLeftAngle(:,1))
	%s{2} = 'Filtered'
	%legend(h, s)
	%hold off
	
	% End Filter
	%%%%%%%%%%%%%%%%%%%%%%%
	
	JointLeftAngle(:,1) = gait.jointAngle(:, 63)
	JointRightAngle(:,1) = gait.jointAngle(:, 51)
	
	u = sort(unique(JointRightAngle(:,1)))
	intervalWidth = int32(length(u) / Rinterval)
	maxRightAnkle = median(u(end-intervalWidth+1:end))
	minRightAnkle = u(cycle*20)
	%maxRightAnkle = u(end-cycle*50)
	
	u = sort(unique(JointLeftAngle(:,1)))
	intervalWidth = int32(length(u) / Linterval)
	maxLeftAnkle = median(u(end-intervalWidth:end))
	minLeftAnkle = u(cycle*20)
	%maxLeftAnkle = u(end-cycle*50)
	
	% Right Initial Contact ( Check Left Ankle )
	for i = [2:gait.frameLength]
		if JointLeftAngle(i) > maxLeftAnkle
			% Check if too near?
			%if (length(gait.RightInitialContact) >= 4)
			%	if ( i - gait.RightInitialContact(end) < (gait.RightInitialContact(end) - gait.RightInitialContact(3)) / (length(gait.RightInitialContact) - 3) - speedVariation)
			%		continue
			%	end
			%end
			
			if(length(gait.RightInitialContact) > 0)
				if ( i - gait.RightInitialContact(end) <= 30 )
					continue
				end
			end
			
			if ( (JointLeftAngle(i) > JointLeftAngle(i-1)) && (JointLeftAngle(i) > JointLeftAngle(i+1)) )
				gait.RightInitialContact = [ gait.RightInitialContact i ]
			end
		end
	end
	% End Right Inital Contact

	% Left Initial Contact ( Check Right Ankle )
	for i = [2:gait.frameLength]
		if JointRightAngle(i) > maxRightAnkle
		
			% Check if too near?
			%if (length(gait.LeftInitialContact) >= 4)
			%	if ( i - gait.LeftInitialContact(end) < (gait.LeftInitialContact(end) - gait.LeftInitialContact(3)) / (length(gait.LeftInitialContact) - 3) - speedVariation)
			%		continue
			%	end
			%end
			
			if(length(gait.LeftInitialContact) > 0)
				if ( i - gait.LeftInitialContact(end) <= 30 )
					continue
				end
			end

			if ( (JointRightAngle(i) > JointRightAngle(i-1)) && (JointRightAngle(i) > JointRightAngle(i+1)) )
				gait.LeftInitialContact = [ gait.LeftInitialContact i ]
			end
		end
	end
	% End Left Initial Contact
	
	%DropLeft = []
	%DropRight = []
	%
	%for i = [1:length(gait.LeftInitialContact)]
	%	for j = [1:length(gait.RightInitialContact)]
	%		if(abs(gait.LeftInitialContact(i) - gait.RightInitialContact(j)) <= 40)
	%			DropLeft = [DropLeft gait.LeftInitialContact(i)]
	%			DropRight = [DropRight gait.RightInitialContact(j)]
	%		end
	%	end
	%end
	%
	%gait.LeftInitialContact = setdiff(gait.LeftInitialContact, DropLeft)
	%gait.RightInitialContact = setdiff(gait.RightInitialContact, DropRight)
	
	% Length Validation (Drop)
	%if(length(gait.LeftInitialContact) > length(gait.RightInitialContact))
	%	diff = length(gait.LeftInitialContact) - length(gait.RightInitialContact)
	%	gait.LeftInitialContact(end-diff+1:end) = []
	%elseif (length(gait.LeftInitialContact) < length(gait.RightInitialContact))
	%	diff = length(gait.RightInitialContact) - length(gait.LeftInitialContact)
	%	gait.RightInitialContact(end-diff+1:end) = []
	%end
	
	% Drop First Step
	

	% Left Toe Off
	for i = [2:gait.frameLength]
		
		if JointLeftAngle(i) < minLeftAnkle
			
			% Check if too near?
			if (length(gait.LeftToeOff) >= 3)
				if ( i - gait.LeftToeOff(end) < (gait.LeftToeOff(end) - gait.LeftToeOff(2)) / (length(gait.LeftToeOff) - 2) - speedVariation)
					continue
				end
			end	
			
			if (JointLeftAngle(i) < gait.jointAngle(i-1, 63) && JointLeftAngle(i) < gait.jointAngle(i+1, 63))
				gait.LeftToeOff = [gait.LeftToeOff i]
			end
		end
	end
	% End Left Toe Off

	% Right Toe Off
	for i = [2:gait.frameLength]
		
		if JointRightAngle(i) < minRightAnkle
		
			if (length(gait.RightToeOff) >= 3)
				if ( i - gait.RightToeOff(end) < (gait.RightToeOff(end) - gait.RightToeOff(2)) / (length(gait.RightToeOff) - 2) - speedVariation)
					continue
				end
			end	
			
			if (JointRightAngle(i) < JointRightAngle(i-1) && JointRightAngle(i) < JointRightAngle(i+1))
				gait.RightToeOff = [gait.RightToeOff i]
			end
		end
	end	
	% End Right Toe Off
	
	%% Length Validation (Drop)
	%if(length(gait.LeftToeOff) > length(gait.RightToeOff))
	%	diff = length(gait.LeftToeOff) - length(gait.RightToeOff)
	%	gait.LeftToeOff(end-diff+1:end) = []
	%elseif (length(gait.LeftToeOff) < length(gait.RightToeOff))
	%	diff = length(gait.RightToeOff) - length(gait.LeftToeOff)
	%	gait.RightToeOff(end-diff+1:end) = []
	%end
	
	%% Chekc Left Foot First Or Right Foot First
	%if gait.RightInitialContact(1) > gait.LeftInitialContact(1)
	%	% Left Foot First
	%	for i = [1:length(gait.LeftInitialContact)]
	%		gait.DoubleSupport(end + 1,1) = gait.LeftInitialContact(i)
	%		gait.DoubleSupport(end,2) = gait.RightToeOff(i)
	%		gait.DoubleSupport(end,3) = gait.RightToeOff(i) - gait.LeftInitialContact(i)
	%		gait.DoubleSupport(end + 1,1) = gait.RightInitialContact(i)
	%		gait.DoubleSupport(end,2) = gait.LeftToeOff(i)
	%		gait.DoubleSupport(end,3) = gait.LeftToeOff(i) - gait.RightInitialContact(i)
	%	end
	%else
	%	% Right Foot First
	%	for i = [1:length(gait.RightInitialContact)]
	%		gait.DoubleSupport(end + 1,1) = gait.RightInitialContact(i)
	%		gait.DoubleSupport(end,2) = gait.LeftToeOff(i)
	%		gait.DoubleSupport(end,3) = gait.LeftToeOff(i) - gait.RightInitialContact(i)
	%		gait.DoubleSupport(end + 1,1) = gait.LeftInitialContact(i)
	%		gait.DoubleSupport(end,2) = gait.RightToeOff(i)
	%		gait.DoubleSupport(end,3) = gait.RightToeOff(i) - gait.LeftInitialContact(i)
	%	end
	%end
	
end