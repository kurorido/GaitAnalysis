for i = 1:30

	GAITRiteTimes = load(strcat(ROOT_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	pelvisTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	%tightTimes = load(strcat(ROOT_DIR,'TightTime-', int2str(i), '.txt'));
	tightTimes = load(strcat(ROOT_DIR,'PelvisTime-', int2str(i), '.txt'));
	shankTimes = load(strcat(ROOT_DIR,'ShankTime-', int2str(i), '.txt'));
	footTimes = load(strcat(ROOT_DIR,'FootTime-', int2str(i), '.txt'));
	
	Temp = [];
	
	for j = 1 : length(GAITRiteTimes) % we can get a range for each event detection
		Range = [pelvisTimes(j) tightTimes(j) shankTimes(j) footTimes(j)];
		Temp = [Temp ; min(Range) max(Range)];	
	end

	dlmwrite(strcat(OUT_DIR, 'Range-', int2str(i), '.txt'), Temp);

end