target = Acceleration_Pelvis_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 1);

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

pelvisTO = removeTooNear(mx);

% Shank
temp = [];
target = AngularVelocity_RightLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

if(draw)
	figure('name',strcat('Right Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
end

if(draw)
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0], 'MarkerSize', 12);
end

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) - 30 > 0)
		[am(index), mx(index)] = min(target(locs(index)-30:locs(index)));
		mx(index) =  locs(index) - (30 - mx(index));
	end
end

if(draw)
	plot(mx,am+0.05,'ro','markerfacecolor',[1 0 0],'MarkerSize', 12);

	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Angular Velocity (rad/s)');
	title('Lower Leg Angular Velocity (Anterior Posterior)');
end
temp = [temp unique(mx)];

target = AngularVelocity_LeftLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

if(draw)
	figure('name',strcat('Left Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
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

temp = [temp mx];
temp = sort(temp, 'ascend');

shankTO = removeTooNear(temp);

% Foot
temp = [];
target = Acceleration_RightFoot_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 5.5);
	
if(draw)
	figure('name',strcat('Right Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0]);
	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior Posterior)');
end
temp = [temp ; locs];


target = Acceleration_LeftFoot_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 5.5);
if(draw)
	figure('name',strcat('Left Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	plot(locs,pks+0.05,'ro','markerfacecolor',[1 0 0]);
	set(gca,'FontSize',28)
	xlabel('Frame');
	ylabel('Acceleration (acc/s^2)');
	title('Foot Acceleration (Anterior Posterior)');	
end

temp = [temp ; locs];
temp = sort(temp, 'ascend');

footTO = removeTooNear(temp);


pelvisTO = pelvisTO(5:end);
standard = pelvisTO(1);

diffs = shankTO - standard;
diffs = abs(diffs);
ind = find(diffs==min(diffs));
ind = ind(1);
shankTO = shankTO(ind:end);

diffs = footTO - standard;
diffs = abs(diffs);
ind = find(diffs==min(diffs));
ind = ind(1);
footTO = footTO(ind:end);

lens = [length(pelvisTO), length(shankTO), length(footTO)];
len = min(lens);
pelvisTO = pelvisTO(1:len);
shankTO = shankTO(1:len);
footTO = footTO(1:len);

pelvisTO = reshape(pelvisTO, 1, length(pelvisTO));
shankTO = reshape(shankTO, 1, length(shankTO));
footTO = reshape(footTO, 1, length(footTO));


fid = fopen(strcat(ROOT_DIR, 'to_sample.txt'),'w');
for i = 1 : len - 1
	
	range = [pelvisTO(i) shankTO(i) footTO(i)];
	rangeStart = min(range);
	range = [pelvisTO(i+1) shankTO(i+1) footTO(i+1)];
	rangeEnd = min(range);
	
	for k = rangeStart : rangeEnd
		fprintf(fid, '1:%.3f ', AngularVelocity_LeftLowerLeg_Y(k));
		fprintf(fid, '2:%.3f ', AngularVelocity_RightLowerLeg_Y(k));
		fprintf(fid, '3:%.3f ', Jerk_Pelvis_Z(k));
		fprintf(fid, '4:%.3f ', Jerk_Pelvis_Y(k));
		fprintf(fid, '5:%.3f ', Acceleration_LeftFoot_Z(k));
		fprintf(fid, '6:%.3f ', Acceleration_RightFoot_Z(k));
		fprintf(fid, '7:%.3f\r\n', k-rangeStart+1);				
	end

end

fclose(fid);
fclose all;

SVM_PREDICT_EXE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\windows\svm-predict.exe';
SVM_SCALE_EXE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\windows\svm-scale.exe';
SCALE_RANGE_FILE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\tools\combination-2\to\range';
MODEL_FILE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\tools\combination-2\to\train.scale.model';

PREDICT_FILE = strcat(ROOT_DIR, 'test.predict');
TEST_FILE = strcat(ROOT_DIR, 'to_sample.txt');	

% Scale Test File to test.scale
scale_command = sprintf('%s -r %s %s %s %s %s', SVM_SCALE_EXE, SCALE_RANGE_FILE, TEST_FILE, '>', strcat(ROOT_DIR, 'test.scale'));
system(scale_command);

% Run Predict
predict_command = sprintf('%s %s %s %s', SVM_PREDICT_EXE, strcat(ROOT_DIR, 'test.scale'), MODEL_FILE, PREDICT_FILE );
[status,cmdout] = system(predict_command);

predictLabels = load(PREDICT_FILE);
Time = [];

currentLen = 1;
for i = 1 : len - 1
	
	range = [pelvisTO(i) shankTO(i) footTO(i)];
	rangeStart = min(range);
	range = [pelvisTO(i+1) shankTO(i+1) footTO(i+1)];
	rangeEnd = min(range);
	
	len = rangeEnd - rangeStart;
			
	predictSet = predictLabels(currentLen:currentLen+len);
	ind = find(abs(predictSet)==abs(min(predictSet)));
	ind = ind(1);
	currentLen = currentLen + len + 1;
	
	t = rangeStart + ind;
	
	Time = [Time t];			

end

svrTO = Time;