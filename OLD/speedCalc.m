function [gait] = speedCalc(gait)

	column = 66;

	% Total Average Speed = Total Displacement / Total Frame Length
	displacement = abs(gait.position(gait.frameLength, column) - gait.position(gait.Start, column));
	gait.speedInfo.speed = displacement / (gait.frameLength - gait.Start);
	
	gait.speedInfo.eachCycleSpeed = [];
	
	for i = [1:length(gait.LeftInitialContact) - 1]
		time = abs(gait.LeftInitialContact(i) - gait.LeftInitialContact(i+1));
		displacement = abs(gait.position(gait.LeftInitialContact(i), column) - gait.position(gait.LeftInitialContact(i+1), column));
		speed = displacement/time;
		% frame1 position1 frame2 position2 displacement time speed 
		gait.speedInfo.eachCycleSpeed = [gait.speedInfo.eachCycleSpeed ; [gait.LeftInitialContact(i), gait.position(gait.LeftInitialContact(i), column), gait.LeftInitialContact(i+1), gait.position(gait.LeftInitialContact(i+1), column),displacement, time, speed]];
	end

end