classdef Gait < handle

	properties
		id;
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