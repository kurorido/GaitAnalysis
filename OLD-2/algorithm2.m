%%%%%%% Pelvis
target = Acceleration_Pelvis_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

figure('name', strcat('Pelvis-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

	% Save locs to PelvisTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'PelvisTime-', int2str(i), '.txt');
	
	OUT = [];
	for eventIndex = 1 : length(eventTimes.ICs)
		tmp = abs(locs - eventTimes.ICs(eventIndex));
		ind = find(tmp == min(tmp));
		if(min(tmp) > 30)
			continue; % We dont accept frame different bigger then 30
		end
		OUT = [OUT locs(ind)];
	end
	
	dlmwrite(OUT_FILE_NAME, OUT);

%%%%%%% Tight
temp = [];
target = Acceleration_RightUpperLeg_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

figure('name',strcat('Right Upper Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;

set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Anterior Posterior)');

	am = [];
	mx = [];
	
	for index = 1 : length(locs);
		if(locs(index) + 50 < END_TIME)
			[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
			mx(index) = mx(index) + locs(index);
		end
	end
	
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
	
	OUT_FILE_NAME = strcat(ROOT_DIR, 'TightTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, mx);

%%%%%%% Shank
temp = [];
target = AngularVelocity_RightLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 4);
figure('name',strcat('Right Lower Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp mx];

target = AngularVelocity_LeftLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 4);

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

figure('name',strcat('Left Lower Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp mx];
temp = sort(temp, 'ascend');

	OUT = [];
	for eventIndex = 1 : length(eventTimes.ICs)
		tmp = abs(temp - eventTimes.ICs(eventIndex));
		ind = find(tmp == min(tmp));
		if(min(tmp) > 30)
			continue; % We dont accept frame different bigger then 30
		end		
		OUT = [OUT temp(ind)];
	end

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'ShankTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, OUT);

%%%%%%% Foot
temp = [];
target = Acceleration_RightFoot_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);

figure('name',strcat('Right Foot-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp locs];

target = Acceleration_LeftFoot_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);


figure('name',strcat('Left Foot-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp locs];
temp = sort(temp, 'ascend');
% Save locs to FootTime


	OUT = [];
	for eventIndex = 1 : length(eventTimes.ICs)
		tmp = abs(temp - eventTimes.ICs(eventIndex));
		ind = find(tmp == min(tmp));
		if(min(tmp) > 30)
			continue; % We dont accept frame different bigger then 30
		end		
		OUT = [OUT temp(ind)];
	end

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'FootTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, OUT);