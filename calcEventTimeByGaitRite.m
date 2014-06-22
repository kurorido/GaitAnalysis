function RESULT = calcEventTimeByGaitRite(TEMPORAL_FILE)

% TEMPORAL_FILE = '20140106-01.txt';
% START_FRAME = 652;

%TEMPORAL_FILE = GAITRITE_FILE_NAME;

s = tdfread(TEMPORAL_FILE, 'tab');

s.Left_On(any(isnan(s.Left_On),2),:)=[];
s.Right_On(any(isnan(s.Right_On),2),:)=[];

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

