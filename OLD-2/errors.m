

pelvisDiffs = [];
tightDiffs = [];
shankDiffs = [];
footDiffs = [];

ROOT_DIR = 'J:\Roliroli\S03\IC-Time-Indent\';
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
		
		%diff_P = abs(GAITRiteTimes(j) - pelvisTimes(j));
		%diff_T = abs(GAITRiteTimes(j) - tightTimes(j));
		%diff_S = abs(GAITRiteTimes(j) - shankTimes(j));
		%diff_F = abs(GAITRiteTimes(j) - footTimes(j));		
		
		pelvisDiffs = [pelvisDiffs diff_P];
		tightDiffs = [tightDiffs diff_T];
		shankDiffs = [shankDiffs diff_S];
		footDiffs = [footDiffs diff_F];
	end
	
end

avgPelvis = mean(pelvisDiffs);
avgTight = mean(tightDiffs);
avgShank = mean(shankDiffs);
avgFoot = mean(footDiffs);

stdPelvis = std(pelvisDiffs);
stdTight = std(tightDiffs);
stdShank = std(shankDiffs);
stdFoot = std(footDiffs);