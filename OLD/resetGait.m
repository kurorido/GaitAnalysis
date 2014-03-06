function [gait] = resetGait(gait)
	
	% Reset
	gait.LeftInitialContact = []
	gait.RightInitialContact = []
	gait.LeftToeOff = []
	gait.RightToeOff = []
	gait.DoubleSupport = []

end