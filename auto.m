% 20140116.xlsx
% 20140107-morning.xlsx
% 20140107-night.xlsx
% 20140327.xlsx
% extractTimeDiff

TEST_CASE_FILE = 'J:\Roliroli\S01\L3PeakBuild.xlsx';
OUT_FILE_NAME = 'J:\Roliroli\S01\TwoClass-L3Peak-Range5-15Feature.txt';

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
fid = fopen(OUT_FILE_NAME,'w');

fprintf('Start \n');

TOLERANCE = 0;
eventLostCount = 0;
totalEventCount = 0;

for i = 1:size(TEST_CASE_LIST, 1)

	fprintf('Running Test Case %d \n', i);
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = TEST_CASE_LIST{i, 3};
	
	fprintf('Load MVN Info %s \n', MVN_FILE_NAME);
	fprintf('Load Time Info %s \n', GAITRITE_FILE_NAME);
	
	%%%%%% Load Gait Information
	%gait = loadGait(MVN_FILE_NAME);
	load(MVN_FILE_NAME);

	%%%%%% Load Temporal Data
	%EVENTS = calcEventTimeByGaitRite(START_TIME, GAITRITE_FILE_NAME);
	%eventTimes = EVENTS.ICs;
	eventTimes = transpose(load(GAITRITE_FILE_NAME));
	
	%%%%%% For speed, sometimes we can let END_TIME as last event
	END_TIME = size(gait.acceleration, 1);

	%%%%%% Remove Sync Event??
	%eventTimes = eventTimes(1:end-1); % Don't use last event
	%eventTimes = eventTimes(2:end); % Don't use first event
	
	% Prepare feature arrays & load signal & filter them here!
	FeatureInitFragment;
	
	% Find ZCs, return the ZCList between START_TIME to END_TIME
	% ZCList = findZCs(gait, START_TIME);
	ZCList = findZCs(Acceleration_L3_X);
	
	usedEvent = [];
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
		
		if(find)
			% For debug
			% fprintf(fid, '%d ----- %d ~ %d ', eventTimes(k), ZCList(a), ZCList(b));
			
			%fprintf(fid,'1 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, '\r\n');
			
			%eventTime = usedEvent(end);
			%classLabel = 1;
			%
			%WriteFeaturesFragment;
			%
			%classLabel = 0;
			%% Forward 4 frame
			%for k = 1 : 2
			%	eventTime = eventTime + k; % move time
			%	WriteFeaturesFragment;
			%	eventTime = eventTime - k; % restore
			%end
			%
			%% backward four frame
			%for k = 1 : 2
			%	eventTime = eventTime - k; % move time
			%	WriteFeaturesFragment;
			%	eventTime = eventTime + k; % restore
			%end
			step = 5;
			for k = ZCList(a) : step : ZCList(b) - step
				START_POINT = k;
				END_POINT = START_POINT + step - 1;
				eventTime = usedEvent(end);
				if(START_POINT <= eventTime && END_POINT >= eventTime)
					classLabel = 1;
				else
					classLabel = 0;
				end
				WriteFeaturesFragment;
			end
			
		else
			% For debug
			% fprintf(fid, '0 ----- %d ~ %d ', ZCList(a), ZCList(b));
		
			%fprintf(fid,'0 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			%fprintf(fid, '\r\n');	
		end
	end
	
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
%fprintf('Event Lost Rate: %d \n', eventLostCount / totalEventCount);