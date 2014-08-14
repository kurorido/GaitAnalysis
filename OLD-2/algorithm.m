%%%%%%% Pelvis
target = SensorAcceleration_Pelvis_Z;
target = target - mean(target(1:120));
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

figure('name', strcat('Pelvis-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

	% Save locs to PelvisTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'PelvisTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, locs);

%%%%%%% Tight
temp = [];
target = SensorAcceleration_RightUpperLeg_X;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 15);

target = target * (-1);

figure('name',strcat('Right Upper Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp locs];
	
target = SensorAcceleration_LeftUpperLeg_X;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 15);

target = target * (-1);

figure('name',strcat('Left Upper Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;	

temp = [temp locs];
temp = sort(temp, 'ascend');

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'TightTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, temp);

%%%%%%% Shank
temp = [];
target = SensorAngularVelocity_RightLowerLeg_Y;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 4);

target = target * (-1);

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = max(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

figure('name',strcat('Right Lower Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp mx];

target = SensorAngularVelocity_LeftLowerLeg_Y;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 4);

target = target * (-1);

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = max(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

figure('name',strcat('Left Lower Leg-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp mx];
temp = sort(temp, 'ascend');

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'ShankTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, temp);

%%%%%%% Foot
temp = [];
target = SensorAcceleration_RightFoot_Z;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);

target = target * (-1);

figure('name',strcat('Right Foot-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp locs];

target = SensorAcceleration_LeftFoot_Z;
target = target * (-1);

[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);

target = target * (-1);

figure('name',strcat('Left Foot-', int2str(i)));
plot(1:END_TIME, target); hold on;
plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;

temp = [temp locs];
temp = sort(temp, 'ascend');
% Save locs to FootTime

	% Save locs to TightTime
	OUT_FILE_NAME = strcat(ROOT_DIR, 'FootTime-', int2str(i), '.txt');
	dlmwrite(OUT_FILE_NAME, temp);