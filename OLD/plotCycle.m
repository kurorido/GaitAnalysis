function plotCycle( gait, cycle, plotBy)
	
	if plotBy == 'R'
		plot([ gait.RightInitialContact( cycle ) : gait.RightInitialContact( cycle + 1 ) ] , gait.jointAngle([ gait.RightInitialContact( cycle ) : gait.RightInitialContact( cycle + 1 ) ], 51))
	else
		plot([ gait.LeftInitialContact( cycle ) : gait.LeftInitialContact( cycle + 1 ) ], gait.jointAngle([ gait.LeftInitialContact( cycle ) : gait.LeftInitialContact( cycle + 1 ) ], 63))
	end
	
	axis tight
	
	%x = [ gait.RightInitialContact( cycle ) : gait.RightInitialContact( cycle + 1 ) ]
	%x = [ gait.LeftInitialContact( cycle ) : gait.LeftInitialContact( cycle + 1 ) ]
	%y = gait.jointAngle(x, 51)
	%plot(x, y)
	%axis tight

end