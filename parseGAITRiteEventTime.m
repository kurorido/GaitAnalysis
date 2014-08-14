function events = calcEventTimeByGaitRite(START_FRAME, TEMPORAL_FILE)

s = tdfread(TEMPORAL_FILE, 'tab');

s.Left_On(any(isnan(s.Left_On),2),:)=[];
s.Right_Off(any(isnan(s.Right_Off),2),:)=[];
s.Right_On(any(isnan(s.Right_On),2),:)=[];
s.Left_Off(any(isnan(s.Left_Off),2),:)=[];

TEMPORAL_LIST = [transpose(s.Left_On) transpose(s.Right_On)];
TEMPORAL_LIST = sort(TEMPORAL_LIST, 'ascend');

IC_STARTTIME = TEMPORAL_LIST(1);

TEMPORAL_LIST = TEMPORAL_LIST - IC_STARTTIME;
TEMPORAL_LIST = TEMPORAL_LIST(2:end);
TEMPORAL_LIST = (TEMPORAL_LIST / 0.008); % Frame Diff
RESULT = round(TEMPORAL_LIST + START_FRAME); % Add START

events.ICs = RESULT;

%%%%%% TO

TEMPORAL_LIST = [transpose(s.Left_Off) transpose(s.Right_Off)];
TEMPORAL_LIST = sort(TEMPORAL_LIST, 'ascend');
TEMPORAL_LIST = TEMPORAL_LIST - IC_STARTTIME; % Now the toe off is base on First IC
TEMPORAL_LIST = TEMPORAL_LIST / 0.008;
RESULT = round(TEMPORAL_LIST + START_FRAME);

events.TOs = RESULT;
