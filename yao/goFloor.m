init;

DATA_DIR = strcat(ROOT_DIR, DATA_NAME); 
mkdir(DATA_DIR); % Create a directory for subject

load(strcat(ROOT_DIR, DATA_NAME));

normalize = false;
draw = false;
FeatureInit;

START_TIME = 1;
END_TIME = size(gait.acceleration, 1);

normalize = false;
draw = false;
FeatureInit;
runIC;
runTO;

% Find a stable IC Sequences
pelvisIC = stableIC(pelvisIC);
shankIC = stableIC(shankIC);
footIC = stableIC(footIC);
svrIC = stableIC(svrIC);

% Base on IC to truncate TO
pelvisTO = truncateTO(pelvisIC, pelvisTO);
shankTO = truncateTO(shankIC, shankTO);
footTO = truncateTO(footIC, footTO);
svrTO = truncateTO(svrIC, svrTO);

% Validate cycle sequence
[pelvisIC, pelvisTO] = cycleValidate(pelvisIC, pelvisTO);
[shankIC, shankTO] = cycleValidate(shankIC, shankTO);
[footIC, footTO] = cycleValidate(footIC, footTO);
[svrIC, svrTO] = cycleValidate(svrIC, svrTO);

if method == 1
	shift = 10;
	dlmwrite(strcat(DATA_DIR, '\ic_time.txt'), pelvisIC+shift);
	dlmwrite(strcat(DATA_DIR, '\to_time.txt'), pelvisTO+shift);
elseif method == 2
	dlmwrite(strcat(DATA_DIR, '\ic_time.txt'), shankIC);
	dlmwrite(strcat(DATA_DIR, '\to_time.txt'), shankTO);
elseif method == 3
	dlmwrite(strcat(DATA_DIR, '\ic_time.txt'), footIC);
	dlmwrite(strcat(DATA_DIR, '\to_time.txt'), footTO);
elseif method == 4
	dlmwrite(strcat(DATA_DIR, '\ic_time.txt'), svrIC);
	dlmwrite(strcat(DATA_DIR, '\to_time.txt'), svrTO);
end

%startContact = 33;
startContact = 3;
endContact = 9;
%endContact = 21;

leftFirst = false;

IC_TIMES = load(strcat(DATA_DIR, '\ic_time.txt'));
TO_TIMES = load(strcat(DATA_DIR, '\to_time.txt'));

s = IC_TIMES(startContact);
e = IC_TIMES(startContact+2);

if(Position_LeftFoot_X(s) > Position_RightFoot_X(s))
	leftFirst = true;
end

l5s1X = 1;
l5s1Y = 2;
l5s1Z = 3;
l4l3X = 4;
l4l3Y = 5;
l4l3Z = 6;
l1t12X= 7;
l1t12Y= 8;
l1t12Z= 9;
t9t8X = 10;
t9t8Y = 11;
t9t8Z = 12;

if(leftFirst)
	hipX = 55;
	hipY = 56;
	hipZ = 57;	
	kneeX = 58;
	kneeY = 59;
	kneeZ = 60;
	ankleX = 61;
	ankleY = 62;
	ankleZ = 63;
	c7ShoulderX = 31;
	c7ShoulderY = 32;
	c7ShoulderZ = 33;
	shoulderX = 34;
	shoulderY = 35;
	shoulderZ = 36;
else
	hipX = 43;
	hipY = 44;
	hipZ = 45;	
	kneeX = 46;
	kneeY = 47;
	kneeZ = 48;
	ankleX = 49;
	ankleY = 50;
	ankleZ = 51;
	c7ShoulderX = 19;
	c7ShoulderY = 20;
	c7ShoulderZ = 21;
	shoulderX = 22;
	shoulderY = 23;
	shoulderZ = 24;	
end

cycle = 3;

count = 1;
figure('name', 'Cycles');
axis([0 101 -40 40]);
colors=distinguishable_colors(10);
hold on;
for j = startContact : 2 : endContact

	s = IC_TIMES(j);
	e = IC_TIMES(j+2);
	
	st = TO_TIMES(j);
	et = TO_TIMES(j+1);
	
	target = gait.jointAngle(s:e, ankleZ);
	target = resample(target, 101, length(target));
	
    %% Plot single normalized
	%figure('name', strcat('Cycle-', int2str(cycle)));
	%hold on;
	%axis([0 101 -40 40]);
	%plot(1:101, target);
	%hold off;
	
	% Plot singel raw
	%target = gait.jointAngle(s:e, ankleZ);
    %
	%figure('name', strcat('Cycle-', int2str(cycle)));
	%hold on;
	%axis([0 length(target) min(target)*1.5 max(target)*1.5]);
	%plot(1:length(target), target);
    %
	%line([st-s st-s], [max(target)*1.5 min(target)*1.5], 'Color','r');
	%line([et-s et-s], [max(target)*1.5 min(target)*1.5], 'Color','r');
	%
	%hold off;
	
	%subplot(4,1,count);
	%hold on;
	%axis([0 101 -40 40]);
	%plot(1:101, target);
	%title(strcat('Cycle - ', int2str(cycle)));
	%count = count + 1;
	
	% Plot all in one
	
	plot(1:101, target, 'color', colors(count,:));
	legStrs{count} = sprintf('Cycle %d', cycle);
	
	cycle = cycle + 1;
	count = count + 1;

end
legend(legStrs{:});
hold off;