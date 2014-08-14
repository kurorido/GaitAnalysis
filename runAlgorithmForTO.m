%%%%%%% Pelvis
target = Acceleration_Pelvis_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 1.5);

	if(draw)
		figure('name', strcat('Pelvis-', int2str(i)));
		subplot(2,1,1)
		plot(1:END_TIME, target); hold on;
		plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0],'MarkerSize', 12);
		set(gca,'FontSize',28)
		set(gca,'xticklabel',{[]}) 
		ylabel('Acceleration (acc/s^2)');
		title('Pelvis Acceleration (Anterior-Posterior)');
		axis([0 1400 -10 10])
	end

	% Save locs to PelvisTime
	%OUT_FILE_NAME = strcat(ROOT_DIR, 'PelvisTime-', int2str(i), '.txt');

	target = Acceleration_Pelvis_Y;
	if(draw)
		subplot(2,1,2)
		plot(1:END_TIME, target); hold on;
		set(gca,'FontSize',28)
		xlabel('Frame');
		ylabel('Acceleration (acc/s^2)');
		title('Pelvis Acceleration (Vertical)');
	end
	for index = 1 : length(locs);
		if(locs(index) + 30 < END_TIME)
			[am(index), mx(index)] = max(target(locs(index):locs(index)+30));
			mx(index) = mx(index) + locs(index);
		end
	end
	
	if(draw)
		plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
		axis([0 1400 -10 10])
	end
	OUT_FILE_NAME = strcat(ROOT_DIR, 'PelvisTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, unique(mx));

%%%%%%% Tight
temp = [];
target = Acceleration_RightUpperLeg_X;

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

if(draw)
	figure('name',strcat('Right Upper Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	axis([0 1400 -10 10])

	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Upper Leg Acceleration (Anterior Posterior)');
end
	am = [];
	mx = [];
	
	for index = 1 : length(locs);
		if(locs(index) + 30 < END_TIME)
			[am(index), mx(index)] = max(target(locs(index):locs(index)+30));
			mx(index) = mx(index) + locs(index);
		end
	end
	if(draw)
		plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
	end
	
	am = [];
	mx = [];

	for index = 1 : length(locs)
		if(locs(index) - 50 > 0)
			[am(index), mx(index)] = min(target(locs(index)-50:locs(index)));
			mx(index) =  locs(index) - (50 - mx(index));
		end
	end
	if(draw)
		plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
	end

	OUT_FILE_NAME = strcat(ROOT_DIR, 'TightTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, unique(mx));

%%%%%%% Shank
temp = [];
target = AngularVelocity_RightLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 3);

if(draw)
	figure('name',strcat('Right Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
end
am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

if(draw)
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
end

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) - 50 > 0)
		[am(index), mx(index)] = min(target(locs(index)-50:locs(index)));
		mx(index) =  locs(index) - (50 - mx(index));
	end
end

if(draw)
	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);

	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Angular Velocity (rad/s)');
	title('Lower Leg Angular Velocity (Anterior Posterior)');
end
temp = mx;

target = AngularVelocity_LeftLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 4);

if(draw)
	figure('name',strcat('Left Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
end

%am = [];
%mx = [];
%
%for index = 1 : length(locs)
%	if(locs(index) + 50 < END_TIME)
%		[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
%		mx(index) = mx(index) + locs(index);
%	end
%end
%
%plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) - 50 > 0)
		[am(index), mx(index)] = min(target(locs(index)-50:locs(index)));
		mx(index) =  locs(index) - (50 - mx(index));
	end
end

if(draw)
	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);

	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Angular Velocity (rad/s)');
	title('Lower Leg Angular Velocity (Anterior Posterior)');
end

temp = [temp mx];
temp = sort(temp, 'ascend');

	OUT_FILE_NAME = strcat(ROOT_DIR, 'ShankTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, unique(temp));

%%%%%%% Foot
temp = [];
target = Acceleration_RightFoot_X;

if(draw)
	figure('name',strcat('Right Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;

	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 8);
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0],'MarkerSize', 12);
end

%am = [];
%mx = [];
%
%for index = 1 : length(locs)
%	if(locs(index) + 180 < END_TIME)
%		[am(index), mx(index)] = min(abs(target(locs(index):locs(index)+180)));
%		mx(index) = mx(index) + locs(index);
%	end
%end

target = target * (-1);
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);
target = target * (-1);
pks=pks*(-1);

if(draw)
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);


	%plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior Posterior)');
end
temp = [temp mx];

target = Acceleration_LeftFoot_X;

if(draw)
	figure('name',strcat('Right Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;
end
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 8);

if(draw)
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
end
am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 30 < END_TIME)
		[am(index), mx(index)] = min(abs(target(locs(index):locs(index)+30)));
		mx(index) = mx(index) + locs(index);
	end
end

if(draw)
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior Posterior)');
end
temp = [temp mx];
temp = sort(temp, 'ascend');
% Save locs to FootTime


	%OUT = [];
	%for eventIndex = 1 : length(eventTimes.ICs)
	%	tmp = abs(temp - eventTimes.ICs(eventIndex));
	%	ind = find(tmp == min(tmp));
	%	if(min(tmp) > 30)
	%		continue; % We dont accept frame different bigger then 30
	%	end		
	%	OUT = [OUT temp(ind)];
	%end

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'FootTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, unique(temp));