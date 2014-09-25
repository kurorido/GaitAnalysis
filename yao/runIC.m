normalize = false;
FeatureInit;
draw = false;

%%%%%%% Pelvis
target = Acceleration_Pelvis_X;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 1);

if(draw)
	figure('name', strcat('Pelvis-', int2str(i)));
	plot(START_TIME:END_TIME, target); hold on;
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;
end

%OUT_FILE_NAME = strcat(ROOT_DIR, 'ic_time.txt');
%dlmwrite(OUT_FILE_NAME, locs);

pelvisIC = locs;

%%%%%%%% Shank
temp = [];
target = AngularVelocity_RightLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

if(draw)
	figure('name',strcat('Right Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
end

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = max(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

if(draw)
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;
end

temp = [temp unique(mx)];

target = AngularVelocity_LeftLowerLeg_Y;
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

am = [];
mx = [];

for index = 1 : length(locs)
	if(locs(index) + 50 < END_TIME)
		[am(index), mx(index)] = max(target(locs(index):locs(index)+50));
		mx(index) = mx(index) + locs(index);
	end
end

if(draw)
	figure('name',strcat('Left Lower Leg-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	plot(mx,am+0.05,'k^','markerfacecolor',[1 0 0]), hold off;
end

temp = [temp unique(mx)];
temp = unique(temp);
temp = sort(temp, 'ascend');

shankIC = [];
for i = 1 : length(temp) - 1

	if(temp(i+1)-temp(i) > 10)
		shankIC = [shankIC temp(i)];
	end

end

shankIC = transpose(shankIC);

%%%%%%%% Foot
temp = [];
target = Acceleration_RightFoot_X;
target = target * (-1);
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);
target = target * (-1);

if(draw)
	figure('name',strcat('Right Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;
end

temp = [temp unique(locs)];

target = Acceleration_LeftFoot_X;
target = target * (-1);
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 10);
target = target * (-1);

if(draw)
	figure('name',strcat('Left Foot-', int2str(i)));
	plot(1:END_TIME, target); hold on;
	plot(locs,(-1)*pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off;
end

temp = [temp ; unique(locs)];
temp = unique(temp);
temp = sort(temp, 'ascend');

footIC = [];
for i = 1 : length(temp) - 1

	if(temp(i+1)-temp(i) > 10)
		footIC = [footIC temp(i)];
	end

end

footIC = transpose(footIC);



% PelvisIC
% ShankIC
% FootIC
pelvisIC = pelvisIC(5:end);
standard = pelvisIC(1);

diffs = shankIC - standard;
diffs = abs(diffs);
ind = find(diffs==min(diffs));
ind = ind(1);
shankIC = shankIC(ind:end);

diffs = footIC - standard;
diffs = abs(diffs);
ind = find(diffs==min(diffs));
ind = ind(1);
footIC = footIC(ind:end);

lens = [length(pelvisIC), length(shankIC), length(footIC)];
len = min(lens);
pelvisIC = pelvisIC(1:len);
shankIC = shankIC(1:len);
footIC = footIC(1:len);

pelvisIC = reshape(pelvisIC, 1, length(pelvisIC));
shankIC = reshape(shankIC, 1, length(shankIC));
footIC = reshape(footIC, 1, length(footIC));


fid = fopen(strcat(ROOT_DIR, 'ic_sample.txt'),'w');
for i = 1 : len - 1
	
	range = [pelvisIC(i) shankIC(i) footIC(i)];
	rangeStart = min(range);
	range = [pelvisIC(i+1) shankIC(i+1) footIC(i+1)];
	rangeEnd = min(range);
	
	for k = rangeStart : rangeEnd
		fprintf(fid, '1:%.3f ', Acceleration_Pelvis_Z(k));
		fprintf(fid, '2:%.3f ', Acceleration_RightUpperLeg_Z(k));
		fprintf(fid, '3:%.3f ', Acceleration_LeftUpperLeg_Z(k));
		fprintf(fid, '4:%.3f ', Acceleration_RightLowerLeg_Z(k));
		fprintf(fid, '5:%.3f ', Acceleration_LeftLowerLeg_Z(k));
		fprintf(fid, '6:%.3f ', Jerk_Pelvis_Z(k));
		fprintf(fid, '7:%.3f\r\n', k-rangeStart+1);
	end

end

fclose(fid);
fclose all;

SVM_PREDICT_EXE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\windows\svm-predict.exe';
SVM_SCALE_EXE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\windows\svm-scale.exe';
SCALE_RANGE_FILE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\tools\range';
MODEL_FILE = 'J:\Roliroli-Gait\GaitAnalysis\yao\libsvm-3.17\tools\train.scale.model';

PREDICT_FILE = strcat(ROOT_DIR, 'test.predict');
TEST_FILE = strcat(ROOT_DIR, 'ic_sample.txt');	

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
	
	range = [pelvisIC(i) shankIC(i) footIC(i)];
	rangeStart = min(range);
	range = [pelvisIC(i+1) shankIC(i+1) footIC(i+1)];
	rangeEnd = min(range);
	
	len = rangeEnd - rangeStart;
			
	predictSet = predictLabels(currentLen:currentLen+len);
	ind = find(abs(predictSet)==abs(min(predictSet)));
	ind = ind(1);
	currentLen = currentLen + len + 1;
	
	t = rangeStart + ind;
	
	Time = [Time t];			

end

svrIC = Time;