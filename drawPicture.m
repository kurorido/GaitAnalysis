target = AngularVelocity_RightLowerLeg_X(636:781);
target = target - mean(SensorAcceleration_Pelvis_Z(1:120));
[pks,locs] = findpeaks(target, 'MINPEAKHEIGHT', 2.5);

figure('name', strcat('Pelvis-', int2str(i)));
plot(1:1049-905, target); hold on;
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]);

target = SensorAcceleration_Pelvis_Y(500:1200);
target = target - mean(target(1:120));
plot(1:1200-499, target);

hold on;
locs = [636, 781];
pks = target(locs);
plot(locs,pks+0.05,'k^','markerfacecolor',[1 0 0]);
hold off;

figure
target = Acceleration_Pelvis_X;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Anterior-Posterior)');

figure
target = Acceleration_Pelvis_Y;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Vertical)');

figure
target = Acceleration_Pelvis_Z;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Medial-Lateral)');

figure
target = Acceleration_RightUpperLeg_X;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Anterior-Posterior)');

figure
target = Acceleration_RightUpperLeg_Z;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Medial-Lateral)');

figure
target = Acceleration_RightUpperLeg_X(636:781);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Anterior-Posterior)');

figure
target = Acceleration_RightUpperLeg_Z(636:781);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Upper Leg Acceleration (Medial-Lateral)');

figure
target =  Acceleration_RightFoot_X(732:862);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Anterior-Posterior)');

figure
target = Acceleration_RightFoot_X;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Anterior-Posterior)');

figure
target = Acceleration_RightFoot_Y;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Vertical)');

figure
target = Acceleration_RightFoot_Z;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Medial-Lateral)');

figure
target = Acceleration_RightFoot_X(636:781);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Foot Acceleration (Anterior-Posterior)');

figure
target = AngularVelocity_RightLowerLeg_X;
plot(target,'YDataSource','target')
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
xlabel('Frame');
ylabel('Angular Velocity (rad/s)');
title('Lower Leg Angular Velocity (Anterior-Posterior)');

figure
target = AngularVelocity_RightLowerLeg_X(636:781);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Angular Velocity (rad/s)');
title('Lower Leg Angular Velocity (Anterior-Posterior)');

figure
subplot(2,1,1)
target = Acceleration_Pelvis_X;
%target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Anterior-Posterior)');
set(gca,'xticklabel',{[]}) 

subplot(2,1,2)
target = Acceleration_Pelvis_Y;
%target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Vertical)');

figure
target = Acceleration_Pelvis_X(636:781);
target = resample(target, 100, length(target));
plot(target,'YDataSource','target')
set(gca,'FontSize',28)
xlabel('% Gait Cycle');
ylabel('Acceleration (acc/s^2)');
title('Pelvis Acceleration (Anterior-Posterior)');


title('Lower Leg Angular Velocity Anterior Posterior');

figure
target = Acceleration_Pelvis_X;
axis([0 1300 min(target)*1.5 max(target)*1.5]);
set(gca,'FontSize',28)
%xlabel('Frame');
xlabel('% Gait Cycle');
% ylabel('Acceleration (acc/s^2)');
ylabel('Angular Velocity (rad/s)');
title('Lower Leg Angular Velocity Anterior Posterior');


target = resample(target, 100, length(target));

target = Acceleration_Pelvis_X;
ylabel('Angular Velocity (rad/s)');