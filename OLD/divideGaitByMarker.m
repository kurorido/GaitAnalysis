% divideGaitByMarker(gait, 'D:\Roli\Dropbox\NCKU\MVN data processing\MVN Export Data\Test Data\B03-1-nor-stair-up-one.xlsx')
function [ gait ] = divideGaitByMarker(gait, fileName)
	
	% Read Marker File
	markerData = xlsread(fileName);
	
	% Left
	marker = markerData(:,3)
	marker = marker(~isnan(marker))
	marker = transpose(marker)
	gait.LeftInitialContact = marker
	
	% Right
	marker = markerData(:,4)
	marker = marker(~isnan(marker))
	marker = transpose(marker)
	gait.RightInitialContact = marker;

end