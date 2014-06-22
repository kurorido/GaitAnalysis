function FRAME_DIFF = timeDiff(START_FRAME, TEMPORAL_FILE)

s = tdfread(TEMPORAL_FILE, 'tab');

s.Left_On(any(isnan(s.Left_On),2),:)=[];
s.Right_Off(any(isnan(s.Right_Off),2),:)=[];
s.Right_On(any(isnan(s.Right_On),2),:)=[];
s.Left_Off(any(isnan(s.Left_Off),2),:)=[];

%TEMPORAL_LIST = [transpose(s.Left_On) transpose(s.Right_On) transpose(s.Right_Off) transpose(s.Left_Off)];
TEMPORAL_LIST = [transpose(s.Left_On) transpose(s.Right_On)];
TEMPORAL_LIST = sort(TEMPORAL_LIST, 'ascend');
FRAME_DIFF = zeros(1, length(TEMPORAL_LIST)-1);
for i = 1:length(TEMPORAL_LIST) - 1
	FRAME_DIFF(i) = floor((TEMPORAL_LIST(i+1) - TEMPORAL_LIST(i)) / 0.008);	
end