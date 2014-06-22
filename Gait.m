classdef Gait < handle

	properties
		id;
		LeftInitialContact = [];
		RightInitialContact = [];
		LeftToeOff = [];
		RightToeOff = [];
		DoubleSupport = [];
		speedInfo;
		position;
		frameLength;
		MedianGait;
		Start;
		npose;
		tpose;
		
		sensorAcceleration;
		angularVelocity;
		angularAcceleration;
		velocity;
		sensorAngularVelocity
		jointAngle;
		acceleration;
	end

end