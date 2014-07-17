ROOT_DIR = 'J:\Roliroli\S03\IC-Time-Indent\';
OUT_DIR = 'J:\Roliroli\S03\';

OUT_FILE_NAME = strcat(OUT_DIR, 'SVR.txt');
fid = fopen(OUT_FILE_NAME,'w');

for i = 1:30
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));

	
	for j = 1 : length(GAITRiteTimes)

		diff_P = GAITRiteTimes(j) - pelvisTimes(j);
		diff_T = GAITRiteTimes(j) - tightTimes(j);
		diff_S = GAITRiteTimes(j) - shankTimes(j);
		diff_F = GAITRiteTimes(j) - footTimes(j);
		
		% Write Current
		fprintf(fid,'1 1:%d 2:%d 3:%d 4:%d\r\n', diff_P, diff_T, diff_S, diff_F);
		
		for forwardStep = 1 : 4
			fprintf(fid,'%2f 1:%d 2:%d 3:%d 4:%d\r\n', 0 +  (forwardStep * 8.3), diff_P + forwardStep, diff_T + forwardStep, diff_S + forwardStep, diff_F + forwardStep);
		end
		
		for backwardStep = 1 : 4
			fprintf(fid,'%2f 1:%d 2:%d 3:%d 4:%d\r\n', 0 + (backwardStep * 8.3), diff_P - backwardStep, diff_T - backwardStep, diff_S - backwardStep, diff_F - backwardStep);
		end
		
	end
	
end
fclose(fid);
fclose all;