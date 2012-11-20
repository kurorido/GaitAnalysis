% gait = initGait('..\..\Test Data\B04-1-nor-wok-one.mvnx')
% gait = initGait('..\..\Test Data\B04-1-nor-wok-two.mvnx')
% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-one.mvnx')
% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-two.mvnx')
% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-three.mvnx')
function [gait] = initGait(fileName)
	
	[tree treeName] = xml_read (fileName)
	disp([treeName{1} ' ='])
	
	% gen_object_display(tree)
	
	% Get All Sensor Acceleration Data
	for i = [3:length(tree.subject.frames.frame)]
		gait.sensorAcceleration(i-2,:) = tree.subject.frames.frame(i).sensorAcceleration;
	end
	
	% Get All Joint Angle Data
	for i = [3:length(tree.subject.frames.frame)]
		gait.jointAngle(i-2,:) = tree.subject.frames.frame(i).jointAngle;
	end
	
	frameLength = length(tree.subject.frames.frame)
	
	% Init Frame Length
	gait.frameLength = frameLength - 2

end