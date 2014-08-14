% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx

TEST_CASE_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\20140107-morning.xlsx';
OUT_FILE_NAME = '..\output.txt';

TOLERANCE = 0;

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
fid = fopen(OUT_FILE_NAME,'w');

fprintf('Start \n');

eventLostCount = 0;
totalEventCount = 0;

for i = 1:size(TEST_CASE_LIST, 1)

	fprintf('Running Test Case %d \n', i);
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	
	% Load Gait
	gait = loadGait(MVN_FILE_NAME);
	% Load GaitRite Temporal
	eventTimes = calcEventTimeByGaitRite(START_TIME, GAITRITE_FILE_NAME);
	
	% The last IC event is End Time (add some frames)
	END_TIME = eventTimes(end);
	if(END_TIME > size(gait.sensorAngularVelocity, 1))
		END_TIME = size(gait.sensorAngularVelocity, 1);
	end
	eventTimes = eventTimes(1:end-1); % Don't use last event
	eventTimes = eventTimes(2:end); % Don't use first event
	totalEventCount = length(eventTimes) + totalEventCount;
	
	sensor_id = 3;
	angularVelocity_Pelvis_Z = [];
	for j = 1 : END_TIME
		angularVelocity_Pelvis_Z = [angularVelocity_Pelvis_Z ; str2num(gait.sensorAngularVelocity{j,sensor_id})];
	end

	% Filter
	[B,A]= butter(4,15/120,'low');
	angularVelocity_Pelvis_Z = filtfilt(B, A, angularVelocity_Pelvis_Z);
	clear A B;
	
	% Absolute
	% angularVelocity_Pelvis_Z = abs(angularVelocity_Pelvis_Z);
	
	% Find ZCs
	ZCList = splitWithZCs(gait, START_TIME);
	
	usedEvent = [];
	next = 1;
	for j = 1:length(ZCList)/2
		a = 2 * j - 1;
		b = 2 * j;
		
		% Don't calculate those Range Size < 2
		if(ZCList(b) - ZCList(a) < 2)
			continue;
		end		
		
		if(ZCList(a) > END_TIME || ZCList(b) > END_TIME)
			break;
		end

		find = false;		
		for k = 1:length(eventTimes)
			if(eventTimes(k) >= (ZCList(a) - TOLERANCE) && eventTimes(k) <= (ZCList(b) + TOLERANCE))
				find = true;
				usedEvent = [usedEvent eventTimes(k)];
				break;
			end
		end
		
		if(find)
			% For debug
			% fprintf(fid, '%d ----- %d ~ %d ', eventTimes(k), ZCList(a), ZCList(b));
			
			fprintf(fid,'1 1:%5f', trapz(ZCList(a):ZCList(b)-1 , angularVelocity_Pelvis_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, ' 2:%5f', max(angularVelocity_Pelvis_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, '\r\n');	
		else
			% For debug
			% fprintf(fid, '0 ----- %d ~ %d ', ZCList(a), ZCList(b));
		
			fprintf(fid,'0 1:%5f', trapz(ZCList(a):ZCList(b)-1 , angularVelocity_Pelvis_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, ' 2:%5f', max(angularVelocity_Pelvis_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, '\r\n');	
		end
	end	
	
	fprintf('Finish Test Case %d \n', i);
	
	restEvent = setdiff(eventTimes, usedEvent);
	eventLostCount = eventLostCount + length(restEvent);
	if(length(restEvent) > 0)
		fprintf('Event Not Detected\n');
		for i = 1:length(restEvent)
			fprintf('%d\n', restEvent(i));
		end
	end	
	
end

if fid ~= -1
  fclose(fid);
end

fprintf('Done \n');
fprintf('Event Lost Rate: %d \n', eventLostCount / totalEventCount);