initFloor;

for j = startContact : 2 : endContact

	startIC = IC_TIMES(j);
	firstTO = TO_TIMES(j);
	middleIC = IC_TIMES(j+1);
	secondTO = TO_TIMES(j+1);
	endIC = IC_TIMES(j+2);
	
	target = gait.jointAngle(startIC:endIC, ankleZ);
    
	figure('name', strcat('Cycle-', int2str(cycle)));
	hold on;
	axis([0 length(target) min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
    
	line([firstTO-startIC firstTO-startIC], [max(target)*1.5 min(target)*1.5], 'Color','r');
	line([secondTO-startIC secondTO-startIC], [max(target)*1.5 min(target)*1.5], 'Color','r');
	
	hold off;
	
	cycle = cycle + 1;

end