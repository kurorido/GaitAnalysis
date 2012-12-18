% gait = initGait('..\..\Test Data\B04-1-nor-wok-one.mvnx')
% gait = initGait('..\..\Test Data\B04-1-nor-wok-two.mvnx')
% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-one.mvnx')
% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-two.mvnx')

% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-nor-wok-three.mvnx')
% gait = divideGaitBySensorAcceleration(gait, 13, 10, 10)

% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B04-1-sk-work-one.mvnx')
% gait = divideGaitBySensorAcceleration(gait, 13, 14, 10)

% gait = initGait('D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B03-1-nor-stair-up-one.mvnx')

function [gait] = initGait(fileName)
	
	gait = Gait();
	
	[tree treeName] = xml_read (fileName)
	disp([treeName{1} ' ='])
	
	[pathstr, name, ext] = fileparts(fileName)
	gait.id = strcat(pathstr, name)
	
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