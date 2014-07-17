TEST_CASE_FILE = 'J:\Roliroli\S02\autoSVMBuild.xlsx';
[~, ~, TEST_CASE_LIST] = xlsread(TEST_CASE_FILE);

for i = 1:size(TEST_CASE_LIST, 1)

	MVN_FILE_NAME = TEST_CASE_LIST{i, 1};
	load(MVN_FILE_NAME);

	totalLength = size(gait.acceleration, 1);

	startTime = round(totalLength / 3);
	endTime = round(totalLength * 2 / 3);

	segement_id=7;
	acceleration = zeros(endTime-startTime+1, 1);
	for j = 1 : endTime - startTime
		acceleration(j) = str2num(gait.acceleration{j+startTime,segement_id});
	end

	[B,A]= butter(4, 5/60, 'low');
	acceleration = filtfilt(B, A, acceleration);

	[pks,locs] = findpeaks(acceleration, 'MINPEAKHEIGHT', 1);
	plot(1:endTime-startTime+1, acceleration); hold on;
	plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]), hold off

	% Ouput candiate frame number
	dlmwrite(strcat('S03-', int2str(i)), locs + startTime)

end