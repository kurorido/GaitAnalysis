ROOT_DIR = 'J:\Roliroli\S04\TO-Time\';
OUT_DIR = 'J:\Roliroli\S04\';

for i = 1:30
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	lens = [length(pelvisTimes), length(tightTimes), length(shankTimes), length(footTimes), length(GAITRiteTimes)];
	len = min(lens);
	ind = find(lens==min(lens));
	ind = ind(1);
	
	if(ind == 1) timesToCut = pelvisTimes;
	elseif(ind == 2) timesToCut = tightTimes;
	elseif(ind == 3) timesToCut = shankTimes;
	elseif(ind == 4) timesToCut = footTimes;
	else timesToCut = GAITRiteTimes;
	end	
	
	OUT = [];
	for loop = 1 : 5
	
		if(loop == 1) times = pelvisTimes;
		elseif(loop == 2) times = tightTimes;
		elseif(loop == 3) times = shankTimes;
		elseif(loop == 4) times = footTimes;
		elseif(loop == 5) times = GAITRiteTimes;
		end
		
		% Indent to min length
		RESULT = [];
		for j = 1 : len
			tmp = abs(times - timesToCut(j));
			index = find(tmp == min(tmp));
			RESULT = [RESULT times(index)];
		end
		% OUT = [OUT; RESULT];
		
		
		
		if(loop == 1) timesAfterPelvis = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'PelvisTime-', int2str(i), '.txt');
		elseif(loop == 2) timesAfterTight = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'TightTime-', int2str(i), '.txt');
		elseif(loop == 3) timesAfterShank = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'ShankTime-', int2str(i), '.txt');
		elseif(loop == 4) timesAfterFoot = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'FootTime-', int2str(i), '.txt');
		elseif(loop == 5) timesAfterGAITRite = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'GAITRiteTime-', int2str(i), '.txt');
		end
		
		dlmwrite(OUT_FILE_NAME, RESULT);
	end
	
end