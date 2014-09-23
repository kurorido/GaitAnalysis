markEvent = true;
drawCycle = false;

startTime = 600;
endTime = 1000;

realEventStartTime = 682;
realEventEndTime = 813;

%%%%%%%%%%%%%%%%%%%%%       Acceleration_Pelvis_X         %%%%%%%%%%%%%%%%%%%%%%%%%%

target = Acceleration_Pelvis_X(startTime:endTime);

figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Anterior-Posterior)');
if(markEvent)
	subplot(2,1,1)
	hold on;
	plot(1:length(target), target);
	axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
	set(gca,'FontSize',28)
	set(gca,'xticklabel',{[]});	
	ylabel('Acceleration (acc/s^2)');
	title('Pelvis Acceleration (Anterior-Posterior)');
	
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0],'MarkerSize', 12);
	
	target = Acceleration_Pelvis_Y(startTime:endTime);
	subplot(2,1,2)
	hold on;
	plot(1:length(target), target);
	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Pelvis Acceleration (Vertical)');
	
	am = [];
	mx = [];	
	
	for index = 1 : length(locs);
		if(locs(index) + 30 < END_TIME)
			[am(index), mx(index)] = max(target(locs(index):locs(index)+30));
			mx(index) = mx(index) + locs(index);
		end
	end

	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
	axis([0 endTime-startTime min(target)*1.5 max(target)*1.5])
	
	target = Acceleration_Pelvis_X(startTime:endTime); % Restore
end
hold off;

if(drawCycle)
	target = Acceleration_Pelvis_X(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Acceleration (acc/s^2)');
	title('Pelvis Acceleration (Anterior-Posterior)');
	hold off;
end

%%%%%%%%%%%%%%%%%%%%%       Acceleration_LeftUpperLeg_X         %%%%%%%%%%%%%%%%%%%%%%%%%%

target = Acceleration_LeftUpperLeg_X(startTime:endTime);
figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Anterior-Posterior)');

if(markEvent)
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);
	am = [];
	mx = [];

	for index = 1 : length(locs);
		if(locs(index) + 30 < END_TIME)
			[am(index), mx(index)] = max(target(locs(index):locs(index)+30));
			mx(index) = mx(index) + locs(index);
		end
	end

	if(markEvent)
		plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
	end

	am = [];
	mx = [];

	for index = 1 : length(locs)
		if(locs(index) - 50 > 1)
			[am(index), mx(index)] = min(target(locs(index)-50:locs(index)));
			mx(index) =  locs(index) - (50 - mx(index));
		end
	end

	mx = mx(2:end);
	am = am(2:end);

	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
end

hold off;

if(drawCycle)
	target = Acceleration_LeftUpperLeg_X(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Acceleration (acc/s^2)');
	title('Upper Leg Acceleration (Anterior-Posterior)');
	hold off;
end


%%%%%%%%%%%%%%%%%%%%%       AngularVelocity_LeftLowerLeg_Y         %%%%%%%%%%%%%%%%%%%%%%%%%%
target = AngularVelocity_LeftLowerLeg_Y(startTime:endTime);
figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Angular Velocity (rad/s)');
title('Lower Leg Angular Velocity (Anterior-Posterior)');

if(markEvent)
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 3);
	am = [];
	mx = [];

	for index = 1 : length(locs)
		if(locs(index) + 50 < END_TIME)
			[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
			mx(index) = mx(index) + locs(index);
		end
	end

	if(markEvent)
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
	mx = mx(2:end);
	am = am(2:end);
	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
end

hold off;

if(drawCycle)
	target = AngularVelocity_LeftLowerLeg_Y(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Angular Velocity (rad/s)');
	title('Lower Leg Angular Velocity (Anterior-Posterior)');
	hold off;
end

%%%%%%%%%%%%%%%%%%%%%       AngularVelocity_RightLowerLeg_Y         %%%%%%%%%%%%%%%%%%%%%%%%%%
target = AngularVelocity_RightLowerLeg_Y(startTime:endTime);
figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Angular Velocity (rad/s)');
title('Lower Leg Angular Velocity (Anterior-Posterior)');

if(markEvent)
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 3);
	am = [];
	mx = [];

	for index = 1 : length(locs)
		if(locs(index) + 50 < size(target, 1))
			[am(index), mx(index)] = min(target(locs(index):locs(index)+50));
			mx(index) = mx(index) + locs(index);
		end
	end

	if(markEvent)
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
	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
end

hold off;

if(drawCycle)
	target = AngularVelocity_RightLowerLeg_Y(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Angular Velocity (rad/s)');
	title('Lower Leg Angular Velocity (Anterior-Posterior)');
	hold off;
end

%%%%%%%%%%%%%%%%%%%%%       Acceleration_LeftFoot_X         %%%%%%%%%%%%%%%%%%%%%%%%%%
target = Acceleration_LeftFoot_X(startTime:endTime);
figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Anterior-Posterior)');

if(markEvent)
	target = target * (-1);
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);
	target = target * (-1);
	pks=pks*(-1);
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 8);
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0],'MarkerSize', 12);
end

hold off;

if(drawCycle)
	target = Acceleration_LeftFoot_X(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior-Posterior)');
	hold off;
end

%%%%%%%%%%%%%%%%%%%%%       Acceleration_RightFoot_X         %%%%%%%%%%%%%%%%%%%%%%%%%%
target = Acceleration_RightFoot_X(startTime:endTime);
figure
hold on;
axis([0 endTime-startTime min(target)*1.5 max(target)*1.5]);
plot(1:length(target), target);
set(gca,'FontSize', 28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Anterior-Posterior)');

if(markEvent)
	target = target * (-1);
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);
	target = target * (-1);
	pks=pks*(-1);
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);
	[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 8);
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0],'MarkerSize', 12);
end

hold off;

if(drawCycle)
	target = Acceleration_RightFoot_X(realEventStartTime:realEventEndTime);
	target = resample(target, 101, length(target));
	figure
	hold on;
	axis([0 101 min(target)*1.5 max(target)*1.5]);
	plot(1:length(target), target);
	set(gca,'FontSize', 28)
	xlabel('% Gait Cycle');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior-Posterior)');
	hold off;
end