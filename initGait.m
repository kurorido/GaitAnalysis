% gait = initGait('..\data\B04-1-nor-wok-one.mvnx')
% gait = initGait('..\data\B04-1-sk-wok-one.mvnx')
% gait = divideGaitBySensorAcceleration(gait, 13, 14, 10)

% Strange
% sb-131002-2L-B15
% gait = initGait('D:\Roli\Dropbox\ForMVNdata\DATA_lite\L\sb-131002-2L-B15\sb-131002-2L-B15-004_Suit 00131054#Suit 00131054_frames_4680-7306.mvnx')
% gait = initGait('D:\Roli\Dropbox\ForMVNdata\DATA_lite\L\sb-131002-2L-B15\sb-131002-2L-B15-004_Suit 00131054#Suit 00131054_frames_37171-39287.mvnx')

% gait = initGait('D:\Roli\Dropbox\ForMVNdata\DATA_lite\L\sb-132002-1L-C20\sb-132002-1L-C20-005_Suit 00131054#Suit 00131054_frames_5606-7554.mvnx')

% gait = initGait('D:\Roli\Dropbox\ForMVNdata\POS_A_sb-141002-1L-T20-004_Suit 00131054#Suit 00131054_frames_2573-4423.mvnx')

function [gait] = initGait(fileName)
	
	gait = Gait();
	
	% Read mvnx file
	[tree treeName] = xml_read (fileName)
	disp([treeName{1} ' ='])
	
	% Give a identification to the gait. (for output file name)
	[pathstr, name, ext] = fileparts(fileName);
	gait.id = strcat(pathstr, '\' ,name);
	
	% gen_object_display(tree)
	
	% Get All Sensor Acceleration Data
	%for i = [3:length(tree.subject.frames.frame)]
	%	gait.sensorAcceleration(i-2,:) = tree.subject.frames.frame(i).sensorAcceleration;
	%end
	%
	%% Get All Joint Angle Data
	%for i = [3:length(tree.subject.frames.frame)]
	%	gait.jointAngle(i-2,:) = tree.subject.frames.frame(i).jointAngle;
	%end
	
	for i = [1:length(tree.subject.frames.frame)]
	
		if( i == 1)
			gait.npose = tree.subject.frames.frame(i).position;
		end
		
		if ( i == 2)
			gait.tpose = tree.subject.frames.frame(i).position;
		end
	
		if( i >= 3)
			% Get All Sensor Acceleration Data
			gait.sensorAcceleration(i-2,:) = tree.subject.frames.frame(i).sensorAcceleration;
			% Get All Joint Angle Data
			gait.jointAngle(i-2,:) = tree.subject.frames.frame(i).jointAngle;
			% Get All Position Data
			gait.position(i-2,:) = tree.subject.frames.frame(i).position;
		end
	end
	
	frameLength = length(tree.subject.frames.frame);
	
	% The first and second frame are dummy.
	gait.frameLength = frameLength - 2;

end