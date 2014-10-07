init;
mode = stair;

DATA_DIR = strcat(ROOT_DIR, DATA_NAME); 
%mkdir(strcat(DATA_DIR, '-', modeArr{mode})); % Create a directory for subject

load(strcat(ROOT_DIR, DATA_NAME));

normalize = false;
draw = false;
FeatureInit;

START_TIME = 1;
END_TIME = size(gait.acceleration, 1);

normalize = false;
draw = false;
FeatureInit;

markerData = xlsread(markerFileName);

% Left
marker = markerData(:,3);
marker = marker(~isnan(marker));
marker = transpose(marker);
LeftInitialContact = marker;
LeftInitialContact(isnan(LeftInitialContact)) = [];

% Right
marker = markerData(:,4);
marker = marker(~isnan(marker));
marker = transpose(marker);
RightInitialContact = marker;
RightInitialContact(isnan(RightInitialContact)) = [];

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

IC_TIMES = RightInitialContact;
%IC_TIMES = [RightInitialContact LeftInitialContact];
%IC_TIMES = sort(IC_TIMES, 'ascend');

% find start contact and end contact
%s = RightInitialContact(1);
%ind = find(IC_TIMES == s);
%startContact = ind;
%e = RightInitialContact(end);
%ind = find(IC_TIMES == e);
%endContact = ind;

cylcesToPlot = [3,4,7,8];
cycle = 3;
count = 1;

figure('name', 'Cycles');
axis([0 101 -40 40]);
colors=distinguishable_colors(10);
hold on;
for j = cylcesToPlot

	s = IC_TIMES(j);
	e = IC_TIMES(j+1);	
	
	target = gait.jointAngle(s:e, ankleZ);
	target = resample(target, 101, length(target));

	%figure('name', strcat('Cycle-', int2str(cycle-1)));
	%hold on;
	%axis([0 101 -40 40]);
	%plot(1:101, target);
	%hold off;
	
	%subplot(4,1,count);
	%hold on;
	%axis([0 101 -40 40]);
	%plot(1:101, target);
	%title(strcat('Cycle - ', int2str(cycle)));
	%count = count + 1;
	
	plot(1:101, target, 'color', colors(count,:));
	legStrs{count} = sprintf('Cycle %d', j);
	
	cycle = cycle + 1;
	count = count + 1;	
end
legend(legStrs{:});
hold off;