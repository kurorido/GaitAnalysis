TEST_CASE_FILE = 'E:\FTP\emgCode\autoSVMBuild.xlsx';
OUT_FILE_NAME = 'str_and_mat.txt';

[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);
fid = fopen(OUT_FILE_NAME,'w');

for i = 1:size(TEST_CASE_LIST, 1)
	
	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	GAITRITE_FILE_NAME = TEST_CASE_LIST{i, 2};
	START_TIME = 0;
	END_TIME = 0;
	
	% Load Gait
	gait = loadGait(MVN_FILE_NAME);
	ZCList = findZCs(gait, START_TIME);
	
	segement_id = 7;
	accL3_Z = [];
	for i = 1 : endTime
		accL3_Z = [accL3_Z ; str2num(gait.acceleration{i,segement_id})];
	end

	% Filter
	[B,A]= butter(4,15/120,'low');
	accL3_Z = filtfilt(B, A, accL3_Z);
	clear A B;
		
	next = 1;
	for i = [next:length(ZCList)/2]
		a = 2 * i - 1;
		b = 2 * i;
		
		find = false;
		for j = [next:length(eventTimes)]
			if(eventTimes(j) >= ZCList(a) && eventTimes(j) <= ZCList(b))
				find = true;
				next = j;
				break;
			end
		end
		
		if(find)
			fprintf(fid,'1 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, '\r\n');	
		else
			fprintf(fid,'0 1:%5f', trapz(ZCList(a):ZCList(b)-1 , accL3_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, ' 2:%5f', max(accL3_Z(ZCList(a):ZCList(b)-1)));
			fprintf(fid, '\r\n');	
		end
	end	
		
end

if fid ~= -1
  fclose(fid);
end