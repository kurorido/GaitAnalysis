j = 2 * cycle - 1;
startIC = IC_TIMES(j);
middleIC = IC_TIMES(j+1);
endIC = IC_TIMES(j+2);
secondTO = TO_TIMES(j+1);
firstTO = TO_TIMES(j);

target = gait.jointAngle(startIC:endIC, ankleZ);

figure('name', strcat('Cycle-', int2str(cycle)));
hold on;
axis([0 length(target) -40 40]);
plot(1:length(target), target);

line([firstTO-startIC firstTO-startIC], [40 -40], 'Color','r');
line([secondTO-startIC secondTO-startIC], [40 -40], 'Color','r');

hold off;
