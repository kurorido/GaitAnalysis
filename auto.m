% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx
% 20140327.xlsx

% extractTimeDiff

TEST_CASE_FILE = 'C:\Users\Ergolab2\Desktop\Roliroli\testcase\testcase.xlsx';
OUT_FILE_NAME = '..\testcase.txt';

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
	gait = loadGait(MVN_FILE_NAME);
	% Load GaitRite Temporal
	eventTimes = calcEventTimeByGaitRite(GAITRITE_FILE_NAME);
	eventTimes = eventTimes + START_TIME;
	
	% The last IC event is End Time (add some frames)
	END_TIME = eventTimes(end);
	if(END_TIME > size(gait.acceleration, 1))
		END_TIME = size(gait.acceleration, 1);
	end
	eventTimes = eventTimes(2:end); % Don't use first event
	eventTimes = eventTimes(1:end-1); % Don't use last event
	totalEventCount = length(eventTimes) + totalEventCount;
	
	segement_id = 3;
	targetFeature = zeros(END_TIME - START_TIME + 1, 1);
	for j = START_TIME : END_TIME
		targetFeature(j - START_TIME + 1, 1) = gait.sensorAcceleration(j,segement_id);
	end

	% Filter
	%[B,A]= butter(4,15/120,'low');
	%targetFeature = filtfilt(B, A, targetFeature);
	%clear A B;
	
	% Find ZCs
	ZCList = findZCs(targetFeature);
	ZCList = ZCList + START_TIME - 2; % Shift 2
	
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
				find = true;
				usedEvent = [usedEvent eventTimes(k)];
				break;
			end
		end
		
		x = ZCList(a)-START_TIME+1:ZCList(b)-START_TIME-1;
		
		if(find)
			% For debug
			% fprintf(fid, '%d ----- %d ~ %d ', eventTimes(k), ZCList(a), ZCList(b));
			
			fprintf(fid,'1 1:%5f', trapz(x , targetFeature(x)));
			fprintf(fid, ' 2:%5f', max(targetFeature(x)));
			fprintf(fid, '\r\n');	
		else
			% For debug
			% fprintf(fid, '0 ----- %d ~ %d ', ZCList(a), ZCList(b));
		
			fprintf(fid,'0 1:%5f', trapz(x , targetFeature(x)));
			fprintf(fid, ' 2:%5f', max(targetFeature(x)));
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