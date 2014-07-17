ROOT_DIR = 'J:\Roliroli\S04\IC-Time\';
OUT_DIR = 'J:\Roliroli\S07\';

TP = 0;
pelvis_FP = 0;
pelvis_FN = 0;
tight_FP = 0;
tight_FN = 0;
shank_FP = 0;
shank_FN = 0;
foot_FP = 0;
foot_FN = 0;

for i = 1:30
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	lens = [length(pelvisTimes), length(tightTimes), length(shankTimes), length(footTimes), length(GAITRiteTimes)];
	
	pelvis_diff = lens(1) - lens(5);
	tight_diff = lens(2) - lens(5);
	shank_diff = lens(3) - lens(5);
	foot_diff = lens(4) - lens(5);
	
	TP = TP + length(GAITRiteTimes);
	
	if(pelvis_diff > 0)
		pelvis_FP = pelvis_FP + pelvis_diff;
	else
		pelvis_FN = pelvis_FN + abs(pelvis_diff);
	end
	
	if(tight_diff > 0)
		tight_FP = tight_FP + tight_diff;
	else
		tight_FN = tight_FN + abs(tight_diff);
	end
	
	if(shank_diff > 0)
		shank_FP = shank_FP + shank_diff;
	else
		shank_FN = shank_FN + abs(shank_diff);
	end
	
	if(foot_diff > 0)
		foot_FP = foot_FP + foot_diff;
	else
		foot_FN = foot_FN + abs(foot_diff);
	end
	
end