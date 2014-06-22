% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx
% 20140327.xlsx

<<<<<<< HEAD
% extractTimeDiff
TEST_CASE_FILE = 'autoSVMBuild.xlsx';
OUT_FILE_NAME = 'output.txt';

TEST_CASE_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\testcase\testcase.xlsx';
OUT_FILE_NAME = '..\testcase.txt';

=======
TEST_CASE_FILE = 'J:\Roliroli\S01\L3PeakBuild.xlsx';
OUT_FILE_NAME = 'J:\Roliroli\S01\TwoClass-L3Peak-15Features.txt';

>>>>>>> 05d731a... L3 Peak
TOLERANCE = 0;

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
fid = fopen(OUT_FILE_NAME,'w');

fprintf('Start \n');

eventLostCount = 0;
totalEventCount = 0;

for i = 1:size(TEST_CASE_LIST, 1)

	fprintf('Running Test Case %d \n', i);
	fprintf(fid, 'Running Test Case %d \n', i);
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	
	fprintf('%s \n', MVN_FILE_NAME);
	fprintf('%s \n', GAITRITE_FILE_NAME);
	
	% Load Gait
	%gait = loadGait(MVN_FILE_NAME);
	load(MVN_FILE_NAME);
	% Load GaitRite Temporal
<<<<<<< HEAD
	eventTimes = calcEventTimeByGaitRite(GAITRITE_FILE_NAME);
	eventTimes = eventTimes + START_TIME;
	
	% The last IC event is End Time (add some frames)
	END_TIME = eventTimes(end);
	if(END_TIME > size(gait.acceleration, 1))
		END_TIME = size(gait.acceleration, 1);
	end
	eventTimes = eventTimes(2:end); % Don't use first event
=======
	%EVENTS = calcEventTimeByGaitRite(START_TIME, GAITRITE_FILE_NAME);
	%eventTimes = EVENTS.ICs;
	eventTimes = transpose(load(GAITRITE_FILE_NAME));
	
	% The last IC event is End Time (add some frames?)
	%END_TIME = eventTimes(end);
	%if(END_TIME > size(gait.acceleration, 1))
	%	END_TIME = size(gait.acceleration, 1);
	%end
	END_TIME = size(gait.acceleration, 1);
>>>>>>> 05d731a... L3 Peak
	eventTimes = eventTimes(1:end-1); % Don't use last event
	totalEventCount = length(eventTimes) + totalEventCount;

	% Filter
	%[B,A]= butter(4,15/120,'low');
	%targetFeature = filtfilt(B, A, targetFeature);
	%clear A B;
	
	% Find ZCs
	ZCList = findZCs(targetFeature);
	ZCList = ZCList + START_TIME - 2; % Shift 2
	% L3 ZC, cut event only remain the data before end time
	segement_id = 7;
	accL3_Z = [];
	
	SensorAcceleration_Pelvis_X = zeros(1, END_TIME);
	SensorAcceleration_Pelvis_Y = zeros(1, END_TIME);
	SensorAcceleration_Pelvis_Z = zeros(1, END_TIME);
	
	SensorAcceleration_RightUpperLeg_X = zeros(1, END_TIME);
	SensorAcceleration_RightUpperLeg_Y = zeros(1, END_TIME);
	SensorAcceleration_RightUpperLeg_Z = zeros(1, END_TIME);
	
	SensorAcceleration_RightLowerLeg_X = zeros(1, END_TIME);
	SensorAcceleration_RightLowerLeg_Y = zeros(1, END_TIME);
	SensorAcceleration_RightLowerLeg_Z = zeros(1, END_TIME);
	
	SensorAcceleration_LeftUpperLeg_X = zeros(1, END_TIME);
	SensorAcceleration_LeftUpperLeg_Y = zeros(1, END_TIME);
	SensorAcceleration_LeftUpperLeg_Z = zeros(1, END_TIME);
	
	SensorAcceleration_LeftLowerLeg_X = zeros(1, END_TIME);
	SensorAcceleration_LeftLowerLeg_Y = zeros(1, END_TIME);
	SensorAcceleration_LeftLowerLeg_Z = zeros(1, END_TIME);

	SensorAngularVelocity_LeftLowerLeg_X = zeros(1, END_TIME);
	SensorAngularVelocity_LeftLowerLeg_Y = zeros(1, END_TIME);
	SensorAngularVelocity_LeftLowerLeg_Z = zeros(1, END_TIME);
	
	for j = 1 : END_TIME
		accL3_Z = [accL3_Z ; str2num(gait.acceleration{j,segement_id})];
		
		SensorAcceleration_Pelvis_X(j) = str2num(gait.sensorAcceleration{j, 1});
		SensorAcceleration_Pelvis_Y(j) = str2num(gait.sensorAcceleration{j, 2});
		SensorAcceleration_Pelvis_Z(j) = str2num(gait.sensorAcceleration{j, 3});
		
		SensorAcceleration_RightUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 28});
		SensorAcceleration_RightUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 29});
		SensorAcceleration_RightUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 30});

		SensorAcceleration_RightLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 31});
		SensorAcceleration_RightLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 32});
		SensorAcceleration_RightLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 33});
		
		SensorAngularVelocity_RightLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 31});
		SensorAngularVelocity_RightLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 32});
		SensorAngularVelocity_RightLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 33});				

		SensorAcceleration_LeftUpperLeg_X(j) = str2num(gait.sensorAcceleration{j, 37});
		SensorAcceleration_LeftUpperLeg_Y(j) = str2num(gait.sensorAcceleration{j, 38});
		SensorAcceleration_LeftUpperLeg_Z(j) = str2num(gait.sensorAcceleration{j, 39});	

		SensorAcceleration_LeftLowerLeg_X(j) = str2num(gait.sensorAcceleration{j, 40});
		SensorAcceleration_LeftLowerLeg_Y(j) = str2num(gait.sensorAcceleration{j, 41});
		SensorAcceleration_LeftLowerLeg_Z(j) = str2num(gait.sensorAcceleration{j, 42});
		
		SensorAngularVelocity_LeftLowerLeg_X(j) = str2num(gait.sensorAngularVelocity{j, 40});
		SensorAngularVelocity_LeftLowerLeg_Y(j) = str2num(gait.sensorAngularVelocity{j, 41});
		SensorAngularVelocity_LeftLowerLeg_Z(j) = str2num(gait.sensorAngularVelocity{j, 42});
	end

	% Filter them
	[B,A]= butter(4,15/60,'low');
	accL3_Z = filtfilt(B, A, accL3_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_X = filtfilt(B, A, SensorAcceleration_Pelvis_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_Y = filtfilt(B, A, SensorAcceleration_Pelvis_Y);
	clear A B;		
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_Pelvis_Z = filtfilt(B, A, SensorAcceleration_Pelvis_Z);
	clear A B;	

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_X = filtfilt(B, A, SensorAcceleration_RightUpperLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_Y = filtfilt(B, A, SensorAcceleration_RightUpperLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightUpperLeg_Z = filtfilt(B, A, SensorAcceleration_RightUpperLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_X = filtfilt(B, A, SensorAcceleration_RightLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_Y = filtfilt(B, A, SensorAcceleration_RightLowerLeg_Y);
	clear A B;		

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_RightLowerLeg_Z = filtfilt(B, A, SensorAcceleration_RightLowerLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_X = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_Y = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_Y);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftUpperLeg_Z = filtfilt(B, A, SensorAcceleration_LeftUpperLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_X = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_Y = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAcceleration_LeftLowerLeg_Z = filtfilt(B, A, SensorAcceleration_LeftLowerLeg_Z);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_X = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_Y = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_Y);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_RightLowerLeg_Z = filtfilt(B, A, SensorAngularVelocity_RightLowerLeg_Z);
	clear A B;

	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_X = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_X);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_Y = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_Y);
	clear A B;
	
	[B,A]= butter(4,15/60,'low');
	SensorAngularVelocity_LeftLowerLeg_Z = filtfilt(B, A, SensorAngularVelocity_LeftLowerLeg_Z);
	clear A B;
	
	% Find ZCs, return the ZCList between START_TIME to END_TIME
	ZCList = findZCs(gait, START_TIME);
>>>>>>> 529af9bdc5d56b27e0a675c7059579c5696df0f4
	
	usedEvent = [];
	next = 1;
	for j = 1:length(ZCList)/2
		a = 2 * j - 1;
		b = 2 * j;
		
		if(ZCList(a) > END_TIME || ZCList(b) > END_TIME)
			break;
		end

		find = false;
		for k = 1:length(eventTimes)
			if(eventTimes(k) >= (ZCList(a) - TOLERANCE) && eventTimes(k) <= (ZCList(b) + TOLERANCE))
				% 2 condition: Event Time && ZC will be here
				find = true;
				usedEvent = [usedEvent eventTimes(k)];
				break;
			end
		end
		
		x = ZCList(a)-START_TIME+1:ZCList(b)-START_TIME-1;
		
		if(find)
			% For debug
			% fprintf(fid, '%d ----- %d ~ %d ', eventTimes(k), ZCList(a), ZCList(b));
			
			%fprintf(fid,'1 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, '\r\n');
			eventTime = usedEvent(end);
			
			% Now we should use usedEvent +- 4 frame as data sample
			fprintf(fid, '1 ');
			fprintf(fid, '1:');
			fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime)); % Feature: Pelvis Acceleration X
			fprintf(fid, '2:');
			fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime)); % Feature: Pelvis Acceleration Y
			fprintf(fid, '3:');
			fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime)); % Feature: Pelvis Acceleration Z

			fprintf(fid, '4:');
			fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime)); % Feature: Right Tight Acceleration X
			fprintf(fid, '5:');
			fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime)); % Feature: Right Tight Acceleration Y
			fprintf(fid, '6:');
			fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime)); % Feature: Right Tight Acceleration Z			
			fprintf(fid, '7:');
			fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime)); % Feature: Left Tight Acceleration X
			fprintf(fid, '8:');
			fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime)); % Feature: Left Tight Acceleration Y
			fprintf(fid, '9:');
			fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime)); % Feature: Left Tight Acceleration Z	
            
			fprintf(fid, '10:');
			fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime)); % Feature: Right Shank Angular Velocity X
			fprintf(fid, '11:');
			fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime)); % Feature: Right Shank Angular Velocity Y
			fprintf(fid, '12:');
			fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime)); % Feature: Right Shank Angular Velocity Z
			fprintf(fid, '13:');
			fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime)); % Feature: Left Shank Angular Velocity X
			fprintf(fid, '14:');
			fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime)); % Feature: Left Shank Angular Velocity Y
			fprintf(fid, '15:');
			fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime)); % Feature: Left Shank Angular Velocity Z		
            
			fprintf(fid, '\r\n');
			
			
			% Forward 4 frame
			for k = 1 : 2
				fprintf(fid, '0 ');
				fprintf(fid, '1:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime+k)); % Feature: Pelvis Acceleration X
				fprintf(fid, '2:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime+k)); % Feature: Pelvis Acceleration Y
				fprintf(fid, '3:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime+k)); % Feature: Pelvis Acceleration Z
				
				fprintf(fid, '4:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime+k)); % Feature: Right Tight Acceleration X
				fprintf(fid, '5:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime+k)); % Feature: Right Tight Acceleration Y
				fprintf(fid, '6:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime+k)); % Feature: Right Tight Acceleration Z			
				fprintf(fid, '7:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime+k)); % Feature: Left Tight Acceleration X
				fprintf(fid, '8:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime+k)); % Feature: Left Tight Acceleration Y
				fprintf(fid, '9:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime+k)); % Feature: Left Tight Acceleration Z	
				
				fprintf(fid, '10:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime+k)); % Feature: Right Shank Angular Velocity X
				fprintf(fid, '11:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime+k)); % Feature: Right Shank Angular Velocity Y
				fprintf(fid, '12:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime+k)); % Feature: Right Shank Angular Velocity Z
				fprintf(fid, '13:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime+k)); % Feature: Left Shank Angular Velocity X
				fprintf(fid, '14:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime+k)); % Feature: Left Shank Angular Velocity Y
				fprintf(fid, '15:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime+k)); % Feature: Left Shank Angular Velocity Z		
				
				fprintf(fid, '\r\n');				
			end
			
			% backward four frame
			for k = 1 : 2
				fprintf(fid, '0 ');
				fprintf(fid, '1:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime-k)); % Feature: Pelvis Acceleration X
				fprintf(fid, '2:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime-k)); % Feature: Pelvis Acceleration Y
				fprintf(fid, '3:');
				fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime-k)); % Feature: Pelvis Acceleration Z
				
				fprintf(fid, '4:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime-k)); % Feature: Right Tight Acceleration X
				fprintf(fid, '5:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime-k)); % Feature: Right Tight Acceleration Y
				fprintf(fid, '6:');
				fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime-k)); % Feature: Right Tight Acceleration Z			
				fprintf(fid, '7:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime-k)); % Feature: Left Tight Acceleration X
				fprintf(fid, '8:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime-k)); % Feature: Left Tight Acceleration Y
				fprintf(fid, '9:');
				fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime-k)); % Feature: Left Tight Acceleration Z	
				
				fprintf(fid, '10:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime-k)); % Feature: Right Shank Angular Velocity X
				fprintf(fid, '11:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime-k)); % Feature: Right Shank Angular Velocity Y
				fprintf(fid, '12:');
				fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime-k)); % Feature: Right Shank Angular Velocity Z
				fprintf(fid, '13:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime-k)); % Feature: Left Shank Angular Velocity X
				fprintf(fid, '14:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime-k)); % Feature: Left Shank Angular Velocity Y
				fprintf(fid, '15:');
				fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime-k)); % Feature: Left Shank Angular Velocity Z		
				
				fprintf(fid, '\r\n');
			end			
		else
			% For debug
			% fprintf(fid, '0 ----- %d ~ %d ', ZCList(a), ZCList(b));
		
			%fprintf(fid,'0 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, '\r\n');	
		end
	end
	
	
	% Toe Off
	%eventTimes = EVENTS.TOs;
	%
	%find = false;
	%for k = 1:length(eventTimes)
	%	if(eventTimes(k) >= (ZCList(a) - TOLERANCE) && eventTimes(k) <= (ZCList(b) + TOLERANCE))
	%		% 2 condition: Event Time && ZC will be here
	%		find = true;
	%		usedEvent = [usedEvent eventTimes(k)];
	%		break;
	%	end
	%end
	%
	%if(find)
	%	% For debug
	%	% fprintf(fid, '%d ----- %d ~ %d ', eventTimes(k), ZCList(a), ZCList(b));
	%	
	%	%fprintf(fid,'1 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
	%	%fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
	%	%fprintf(fid, '\r\n');
	%	eventTime = usedEvent(end);
	%	
	%	% Now we should use usedEvent +- 4 frame as data sample
	%	fprintf(fid, '2 '); % toe off label as class 2
	%	fprintf(fid, '1:');
	%	fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime)); % Feature: Pelvis Acceleration X
	%	fprintf(fid, '2:');
	%	fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime)); % Feature: Pelvis Acceleration Y
	%	fprintf(fid, '3:');
	%	fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime)); % Feature: Pelvis Acceleration Z
    %
	%	%fprintf(fid, '4:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime)); % Feature: Right Tight Acceleration X
	%	%fprintf(fid, '5:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime)); % Feature: Right Tight Acceleration Y
	%	%fprintf(fid, '6:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime)); % Feature: Right Tight Acceleration Z			
	%	%fprintf(fid, '7:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime)); % Feature: Left Tight Acceleration X
	%	%fprintf(fid, '8:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime)); % Feature: Left Tight Acceleration Y
	%	%fprintf(fid, '9:');
	%	%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime)); % Feature: Left Tight Acceleration Z	
    %    %
	%	%fprintf(fid, '10:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime)); % Feature: Right Shank Angular Velocity X
	%	%fprintf(fid, '11:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime)); % Feature: Right Shank Angular Velocity Y
	%	%fprintf(fid, '12:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime)); % Feature: Right Shank Angular Velocity Z
	%	%fprintf(fid, '13:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime)); % Feature: Left Shank Angular Velocity X
	%	%fprintf(fid, '14:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime)); % Feature: Left Shank Angular Velocity Y
	%	%fprintf(fid, '15:');
	%	%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime)); % Feature: Left Shank Angular Velocity Z		
    %
	%	fprintf(fid, '\r\n');
	%	
	%	
	%	% Forward 4 frame
	%	for k = 1 : 4
	%		fprintf(fid, '0 ');
	%		fprintf(fid, '1:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime+k)); % Feature: Pelvis Acceleration X
	%		fprintf(fid, '2:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime+k)); % Feature: Pelvis Acceleration Y
	%		fprintf(fid, '3:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime+k)); % Feature: Pelvis Acceleration Z
	%		
	%		%fprintf(fid, '4:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime+k)); % Feature: Right Tight Acceleration X
	%		%fprintf(fid, '5:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime+k)); % Feature: Right Tight Acceleration Y
	%		%fprintf(fid, '6:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime+k)); % Feature: Right Tight Acceleration Z			
	%		%fprintf(fid, '7:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime+k)); % Feature: Left Tight Acceleration X
	%		%fprintf(fid, '8:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime+k)); % Feature: Left Tight Acceleration Y
	%		%fprintf(fid, '9:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime+k)); % Feature: Left Tight Acceleration Z	
	%		%
	%		%fprintf(fid, '10:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime+k)); % Feature: Right Shank Angular Velocity X
	%		%fprintf(fid, '11:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime+k)); % Feature: Right Shank Angular Velocity Y
	%		%fprintf(fid, '12:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime+k)); % Feature: Right Shank Angular Velocity Z
	%		%fprintf(fid, '13:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime+k)); % Feature: Left Shank Angular Velocity X
	%		%fprintf(fid, '14:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime+k)); % Feature: Left Shank Angular Velocity Y
	%		%fprintf(fid, '15:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime+k)); % Feature: Left Shank Angular Velocity Z		
	%		
	%		fprintf(fid, '\r\n');				
	%	end
	%	
	%	% backward four frame
	%	for k = 1 : 4
	%		fprintf(fid, '0 ');
	%		fprintf(fid, '1:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime-k)); % Feature: Pelvis Acceleration X
	%		fprintf(fid, '2:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime-k)); % Feature: Pelvis Acceleration Y
	%		fprintf(fid, '3:');
	%		fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime-k)); % Feature: Pelvis Acceleration Z
	%		
	%		%fprintf(fid, '4:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime-k)); % Feature: Right Tight Acceleration X
	%		%fprintf(fid, '5:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime-k)); % Feature: Right Tight Acceleration Y
	%		%fprintf(fid, '6:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime-k)); % Feature: Right Tight Acceleration Z			
	%		%fprintf(fid, '7:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime-k)); % Feature: Left Tight Acceleration X
	%		%fprintf(fid, '8:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime-k)); % Feature: Left Tight Acceleration Y
	%		%fprintf(fid, '9:');
	%		%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime-k)); % Feature: Left Tight Acceleration Z	
	%		%
	%		%fprintf(fid, '10:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime-k)); % Feature: Right Shank Angular Velocity X
	%		%fprintf(fid, '11:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime-k)); % Feature: Right Shank Angular Velocity Y
	%		%fprintf(fid, '12:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime-k)); % Feature: Right Shank Angular Velocity Z
	%		%fprintf(fid, '13:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime-k)); % Feature: Left Shank Angular Velocity X
	%		%fprintf(fid, '14:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime-k)); % Feature: Left Shank Angular Velocity Y
	%		%fprintf(fid, '15:');
	%		%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime-k)); % Feature: Left Shank Angular Velocity Z		
	%		
	%		fprintf(fid, '\r\n');
	%	end
	%end
	
	fprintf('Finish Test Case %d \n', i);
	
	%restEvent = setdiff(eventTimes, usedEvent);
	%eventLostCount = eventLostCount + length(restEvent);
	%if(length(restEvent) > 0)
	%	fprintf('Event Not Detected\n');
	%	for i = 1:length(restEvent)
	%		fprintf('%d\n', restEvent(i));
	%	end
	%end	
	
end

if fid ~= -1
  fclose(fid);
end

fprintf('Done \n');
fprintf('Event Lost Rate: %d \n', eventLostCount / totalEventCount);