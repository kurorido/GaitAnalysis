function events = calcEventTimeByGaitRite(START_FRAME, TEMPORAL_FILE)

%TEMPORAL_FILE = 'J:\Roliroli\S13\GAITRite\S13-100-1.time';
%START_FRAME = 1027;

%TEMPORAL_FILE = GAITRITE_FILE_NAME;

s = tdfread(TEMPORAL_FILE, 'tab');

s.Left_On(any(isnan(s.Left_On),2),:)=[];
s.Right_Off(any(isnan(s.Right_Off),2),:)=[];
s.Right_On(any(isnan(s.Right_On),2),:)=[];
s.Left_Off(any(isnan(s.Left_Off),2),:)=[];

TEMPORAL_LIST = [transpose(s.Left_On) transpose(s.Right_On)];
TEMPORAL_LIST = sort(TEMPORAL_LIST, 'ascend');

%fid = fopen(TEMPORAL_FILE);
%fgets(fid);
%TEMPORAL_LIST = fscanf(fid, '%g');
%TEMPORAL_LIST = transpose(unique(TEMPORAL_LIST));
%fclose(fid);

FRAME_DIFF = zeros(1, length(TEMPORAL_LIST)-1);
for i = 1:length(TEMPORAL_LIST) - 1
	FRAME_DIFF(i) = floor((TEMPORAL_LIST(i+1) - TEMPORAL_LIST(i)) / 0.008);	
end

RESULT = zeros(1, length(TEMPORAL_LIST));
CURRENT = 0;
RESULT(1) = CURRENT;
for i = 1:length(FRAME_DIFF)
	CURRENT = CURRENT + FRAME_DIFF(i);
	RESULT(i+1) = CURRENT;
end

events.ICs = RESULT;

%%%%%% TO
IC_STARTTIME = TEMPORAL_LIST(1);
TEMPORAL_LIST = [transpose(s.Left_Off) transpose(s.Right_Off)];
TEMPORAL_LIST = sort(TEMPORAL_LIST, 'ascend');
TEMPORAL_LIST = TEMPORAL_LIST - IC_STARTTIME; % Now the toe off is base on First IC
TEMPORAL_LIST = TEMPORAL_LIST / 0.008;
RESULT = round(TEMPORAL_LIST + START_FRAME);

%FRAME_DIFF = zeros(1, length(TEMPORAL_LIST)-1);
%for i = 1:length(TEMPORAL_LIST) - 1
%	FRAME_DIFF(i) = floor((TEMPORAL_LIST(i+1) - TEMPORAL_LIST(i)) / 0.008);	
%end

%RESULT = zeros(1, length(TEMPORAL_LIST));
%CURRENT = START_FRAME;
%RESULT(1) = CURRENT;
%for i = 1:length(FRAME_DIFF)
%	CURRENT = CURRENT + FRAME_DIFF(i);
%	RESULT(i+1) = CURRENT;
%end

events.TOs = RESULT;
