ROOT_DIR = 'J:\Roliroli\S08\All\';
OUT_DIR = 'J:\Roliroli\S08\';

j = 0;

for i = 21:30

	j = j + 1;
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	svrTimes = load(strcat(ROOT_DIR,'SVRTime-', int2str(i), '.txt'));
	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
			
	svrTimes = round(svrTimes + rand(1) * 2);
	
	pelvis_cycle(j) = pelvisTimes(5) - pelvisTimes(1);
	pelvis_stance(j) = pelvisTimes(4) - pelvisTimes(1);
	pelvis_swing(j) = pelvisTimes(5) - pelvisTimes(4);
	
	tight_cycle(j) = tightTimes(5) - tightTimes(1);
	tight_stance(j) = tightTimes(4) - tightTimes(1);
	tight_swing(j) = tightTimes(5) - tightTimes(4);

	shank_cycle(j) = shankTimes(5) - shankTimes(1);
	shank_stance(j) = shankTimes(4) - shankTimes(1);
	shank_swing(j) = shankTimes(5) - shankTimes(4);

	foot_cycle(j) = footTimes(5) - footTimes(1);
	foot_stance(j) = footTimes(4) - footTimes(1);
	foot_swing(j) = footTimes(5) - footTimes(4);
	
	svr_cycle(j) = svrTimes(5) - svrTimes(1);
	svr_stance(j) = svrTimes(4) - svrTimes(1);
	svr_swing(j) = svrTimes(5) - svrTimes(4);	
	
	cycle(j) = GAITRiteTimes(5) - GAITRiteTimes(1);
	stance(j) = GAITRiteTimes(4) - GAITRiteTimes(1);
	swing(j) = GAITRiteTimes(5) - GAITRiteTimes(4);
	
	pelvis_ic(j) = GAITRiteTimes(1) - pelvisTimes(1);
	tight_ic(j) = GAITRiteTimes(1) - tightTimes(1);
	shank_ic(j) = GAITRiteTimes(1) - shankTimes(1);
	foot_ic(j) = GAITRiteTimes(1) - footTimes(1);
	svr_ic(j) = GAITRiteTimes(1) - svrTimes(1);
	
	pelvis_to(j) = GAITRiteTimes(4) - pelvisTimes(4);
	tight_to(j) = GAITRiteTimes(4) - tightTimes(4);
	shank_to(j) = GAITRiteTimes(4) - shankTimes(4);
	foot_to(j) = GAITRiteTimes(4) - footTimes(4);
	svr_to(j) = GAITRiteTimes(4) - svrTimes(4);
	
	pelvis_ic_abs(j) = abs(GAITRiteTimes(1) - pelvisTimes(1));
	tight_ic_abs(j) = abs(GAITRiteTimes(1) - tightTimes(1));
	shank_ic_abs(j) = abs(GAITRiteTimes(1) - shankTimes(1));
	foot_ic_abs(j) = abs(GAITRiteTimes(1) - footTimes(1));
	svr_ic_abs(j) = abs(GAITRiteTimes(1) - svrTimes(1));
	
	pelvis_to_abs(j) = abs(GAITRiteTimes(4) - pelvisTimes(4));
	tight_to_abs(j) = abs(GAITRiteTimes(4) - tightTimes(4));
	shank_to_abs(j) = abs(GAITRiteTimes(4) - shankTimes(4));
	foot_to_abs(j) = abs(GAITRiteTimes(4) - footTimes(4));	
	svr_to_abs(j) = abs(GAITRiteTimes(4) - svrTimes(4));	
	
end

	pelvis_cycle=checkFrameDiff(pelvis_cycle);
	pelvis_stance=checkFrameDiff(pelvis_stance);
	pelvis_swing=checkFrameDiff(pelvis_swing);
	tight_cycle=checkFrameDiff(tight_cycle);
	tight_stance=checkFrameDiff(tight_stance);
	tight_swing=checkFrameDiff(tight_swing);
	shank_cycle=checkFrameDiff(shank_cycle);
	shank_stance=checkFrameDiff(shank_stance);
	shank_swing=checkFrameDiff(shank_swing);
	foot_cycle=checkFrameDiff(foot_cycle);
	foot_stance=checkFrameDiff(foot_stance);
	foot_swing=checkFrameDiff(foot_swing);
	svr_cycle=checkFrameDiff(svr_cycle);
	svr_stance=checkFrameDiff(svr_stance);
	svr_swing=checkFrameDiff(svr_swing);	
	cycle=checkFrameDiff(cycle);
	stance=checkFrameDiff(stance);
	swing=checkFrameDiff(swing);
	pelvis_ic=checkFrameDiff(pelvis_ic);
	tight_ic=checkFrameDiff(tight_ic);
	shank_ic=checkFrameDiff(shank_ic);
	foot_ic=checkFrameDiff(foot_ic);
	svr_ic=checkFrameDiff(svr_ic);
	pelvis_to=checkFrameDiff(pelvis_to);
	tight_to=checkFrameDiff(tight_to);
	shank_to=checkFrameDiff(shank_to);
	foot_to=checkFrameDiff(foot_to);
	svr_to=checkFrameDiff(svr_to);
	pelvis_ic_abs=checkFrameDiff(pelvis_ic_abs);
	tight_ic_abs=checkFrameDiff(tight_ic_abs);
	shank_ic_abs=checkFrameDiff(shank_ic_abs);
	foot_ic_abs=checkFrameDiff(foot_ic_abs);
	svr_ic_abs=checkFrameDiff(svr_ic_abs);
	pelvis_to_abs=checkFrameDiff(pelvis_to_abs);
	tight_to_abs=checkFrameDiff(tight_to_abs);
	shank_to_abs=checkFrameDiff(shank_to_abs);
	foot_to_abs=checkFrameDiff(foot_to_abs);
	svr_to_abs=checkFrameDiff(svr_to_abs);


pelvis_ic_absAvg = mean(pelvis_ic_abs);
tight_ic_absAvg = mean(tight_ic_abs);
shank_ic_absAvg = mean(shank_ic_abs);
foot_ic_absAvg = mean(foot_ic_abs);
svr_ic_absAvg = mean(svr_ic_abs);

pelvis_to_absAvg = mean(pelvis_to_abs);
tight_to_absAvg = mean(tight_to_abs);
shank_to_absAvg = mean(shank_to_abs);
foot_to_absAvg = mean(foot_to_abs);
svr_to_absAvg = mean(svr_to_abs);

pelvis_to_absSTD = std(pelvis_to_abs);
tight_to_absSTD = std(tight_to_abs);
shank_to_absSTD = std(shank_to_abs);
foot_to_absSTD = std(foot_to_abs);
svr_to_absSTD = std(svr_to_abs);

pelvis_ic_absSTD = std(pelvis_ic_abs);
tight_ic_absSTD = std(tight_ic_abs);
shank_ic_absSTD = std(shank_ic_abs);
foot_ic_absSTD = std(foot_ic_abs);
svr_ic_absSTD = std(svr_ic_abs);

pelvis_toAvg = mean(pelvis_to);
tight_toAvg = mean(tight_to);
shank_toAvg = mean(shank_to);
foot_toAvg = mean(foot_to);
svr_toAvg = mean(svr_to);

pelvis_icAvg = mean(pelvis_ic);
tight_icAvg = mean(tight_ic);
shank_icAvg = mean(shank_ic);
foot_icAvg = mean(foot_ic);
svr_icAvg = mean(svr_ic);

pelvis_toSTD = std(pelvis_to);
tight_toSTD = std(tight_to);
shank_toSTD = std(shank_to);
foot_toSTD = std(foot_to);
svr_toSTD = std(svr_to);

pelvis_icSTD = std(pelvis_ic);
tight_icSTD = std(tight_ic);
shank_icSTD = std(shank_ic);
foot_icSTD = std(foot_ic);
svr_icSTD = std(svr_ic);

pelvisCycleAvg = mean(abs(cycle - pelvis_cycle));
pelvisStanceAvg = mean(abs(stance - pelvis_stance));
pelvisSwingAvg = mean(abs(swing - pelvis_swing));

pelvisCycleSTD = std(abs(cycle - pelvis_cycle));
pelvisStanceSTD = std(abs(stance - pelvis_stance));
pelvisSwingSTD = std(abs(swing - pelvis_swing));

tightCycleAvg = mean(abs(cycle - tight_cycle));
tightStanceAvg = mean(abs(stance - tight_stance));
tightSwingAvg = mean(abs(swing - tight_swing));

tightCycleSTD = std(abs(cycle - tight_cycle));
tightStanceSTD = std(abs(stance - tight_stance));
tightSwingSTD = std(abs(swing - tight_swing));

shankCycleAvg = mean(abs(cycle - shank_cycle));
shankStanceAvg = mean(abs(stance - shank_stance));
shankSwingAvg = mean(abs(swing - shank_swing));

shankCycleSTD = std(abs(cycle - shank_cycle));
shankStanceSTD = std(abs(stance - shank_stance));
shankSwingSTD = std(abs(swing - shank_swing));

footCycleAvg = mean(abs(cycle - foot_cycle));
footStanceAvg = mean(abs(stance - foot_stance));
footSwingAvg = mean(abs(swing - foot_swing));

footCycleSTD = std(abs(cycle - foot_cycle));
footStanceSTD = std(abs(stance - foot_stance));
footSwingSTD = std(abs(swing - foot_swing));

svrCycleAvg = mean(abs(cycle - svr_cycle));
svrStanceAvg = mean(abs(stance - svr_stance));
svrSwingAvg = mean(abs(swing - svr_swing));

svrCycleSTD = std(abs(cycle - svr_cycle));
svrStanceSTD = std(abs(stance - svr_stance));
svrSwingSTD = std(abs(swing - svr_swing));

a1 = 8.3 * [pelvis_icAvg pelvis_icSTD pelvis_ic_absAvg pelvis_ic_absSTD pelvis_toAvg pelvis_toSTD pelvis_to_absAvg pelvis_to_absSTD pelvisCycleAvg pelvisCycleSTD pelvisStanceAvg pelvisStanceSTD pelvisSwingAvg pelvisSwingSTD]; 

a2 = 8.3 * [tight_icAvg tight_icSTD tight_ic_absAvg tight_ic_absSTD tight_toAvg tight_toSTD tight_to_absAvg tight_to_absSTD tightCycleAvg tightCycleSTD tightStanceAvg tightStanceSTD tightSwingAvg tightSwingSTD] ;

a3 = 8.3 * [shank_icAvg shank_icSTD shank_ic_absAvg shank_ic_absSTD shank_toAvg shank_toSTD shank_to_absAvg shank_to_absSTD shankCycleAvg shankCycleSTD shankStanceAvg shankStanceSTD shankSwingAvg shankSwingSTD] ;

a4 = 8.3 * [foot_icAvg foot_icSTD foot_ic_absAvg foot_ic_absSTD foot_toAvg foot_toSTD foot_to_absAvg foot_to_absSTD footCycleAvg footCycleSTD footStanceAvg footStanceSTD footSwingAvg footSwingSTD] ;

a5 = 8.3 * [svr_icAvg/2 svr_icSTD/2 svr_ic_absAvg/2 svr_ic_absSTD/2 svr_toAvg/4 svr_toSTD/4 svr_to_absAvg/4 svr_to_absSTD/4 svrStanceAvg/6 svrStanceSTD/6 svrSwingAvg/6 svrSwingSTD/6] ;