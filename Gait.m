classdef Gait < handle

	properties
		id;
		LeftInitialContact = [];
		RightInitialContact = [];
		LeftToeOff = [];
		RightToeOff = [];
		DoubleSupport = [];
		sensorAcceleration;
		speedInfo;
		position;
		jointAngle;
		frameLength;
		MedianGait;
		Start;
		npose;
		tpose;
	end

end