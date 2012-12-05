classdef Gait < handle

	properties
		LeftInitialContact = [];
		RightInitialContact = [];
		LeftToeOff = [];
		RightToeOff = [];
		DoubleSupport = [];
		sensorAcceleration;
		jointAngle;
		frameLength;
		MedianGait;
		Start;
	end

end