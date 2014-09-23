ROOT_DIR = strcat('J:\Roliroli\S03\');
TEST_CASE_FILE = strcat(ROOT_DIR, 'autoSVMBuild.xlsx');
SVR_TIME_DIR = strcat(ROOT_DIR, 'IC-SVR\Combination-2\Time\');
RANGE_DIR = strcat(ROOT_DIR, 'IC-Range\');
[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

%for i = 1:size(TEST_CASE_LIST, 1)
for i = 2:2

	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};	

	RANGE_FILE = strcat(RANGE_DIR, 'Range-', int2str(i), '.txt');
	marker = load(RANGE_FILE);
	
	SVR_TIME_FILE = strcat(SVR_TIME_DIR, 'SVRTime-', int2str(i), '.txt');
	event_marker = load(SVR_TIME_FILE);
	
	%%%%%% Load Gait Information
	load(MVN_FILE_NAME);
	END_TIME = size(gait.acceleration, 1);
	
	%%%%%%% Prepare feature arrays & load signal & filter them here!
	normalize = false;
	FeatureInit;
	
	subplot(3,1,1);
	plot(1:length(Deriv2_Pelvis_Y), Deriv2_Pelvis_Y);
	hold on;
	startMarkers = marker(:,1);
	startValues = Deriv2_Pelvis_Y(startMarkers);
	endMarkers = marker(:,2);
	endValues = Deriv2_Pelvis_Y(endMarkers);
	
	plot(startMarkers, startValues,'k^', 'markerfacecolor',[1 0 0]);
	plot(endMarkers, endValues,'ro', 'markerfacecolor',[1 0 0]);
	plot(event_marker, Deriv2_Pelvis_Y(event_marker),'rx', 'markerfacecolor',[1 0 0]);
	hold off;
	
	subplot(3,1,2);
	plot(1:length(Deriv4_Pelvis_Y), Deriv4_Pelvis_Y);
	hold on;
	startMarkers = marker(:,1);
	startValues = Deriv4_Pelvis_Y(startMarkers);
	endMarkers = marker(:,2);
	endValues = Deriv4_Pelvis_Y(endMarkers);
	
	plot(startMarkers, startValues,'k^', 'markerfacecolor',[1 0 0]);
	plot(endMarkers, endValues,'ro', 'markerfacecolor',[1 0 0]);
	plot(event_marker, Deriv4_Pelvis_Y(event_marker),'rx', 'markerfacecolor',[1 0 0]);
	hold off;
	
	subplot(3,1,3);
	plot(1:length(Deriv_Pelvis_Y), Deriv_Pelvis_Y);
	hold on;
	
	startMarkers = marker(:,1);
	startValues = Deriv_Pelvis_Y(startMarkers);
	endMarkers = marker(:,2);
	endValues = Deriv_Pelvis_Y(endMarkers);
	
	plot(startMarkers, startValues,'k^', 'markerfacecolor',[1 0 0]);
	plot(endMarkers, endValues,'ro', 'markerfacecolor',[1 0 0]);
	plot(event_marker, Deriv_Pelvis_Y(event_marker),'rx', 'markerfacecolor',[1 0 0]);	
	hold off;
	
	
	%jLeftAnkle_Z
	%AngularVelocity_LeftLowerLeg_Y
	%AngularVelocity_RightLowerLeg_Y
	%Jerk_Pelvis_Z
	%Jerk_Pelvis_Y
	%Acceleration_LeftFoot_Z
	%Acceleration_RightFoot_Z
end