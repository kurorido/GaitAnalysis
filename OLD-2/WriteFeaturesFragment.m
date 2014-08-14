% WriteFeaturesFragment.m

fprintf(fid, '%d ', classLabel);

%fprintf(fid, '1:');
%fprintf(fid,'%5f ', SensorAcceleration_Pelvis_X(eventTime)); % Feature: Pelvis Acceleration X
%fprintf(fid, '2:');
%fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Y(eventTime)); % Feature: Pelvis Acceleration Y
%fprintf(fid, '3:');
%fprintf(fid,'%5f ', SensorAcceleration_Pelvis_Z(eventTime)); % Feature: Pelvis Acceleration Z

%fprintf(fid, '4:');
%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_X(eventTime)); % Feature: Right Tight Acceleration X
%fprintf(fid, '5:');
%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Y(eventTime)); % Feature: Right Tight Acceleration Y
%fprintf(fid, '6:');
%fprintf(fid,'%5f ', SensorAcceleration_RightUpperLeg_Z(eventTime)); % Feature: Right Tight Acceleration Z			
%fprintf(fid, '7:');
%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_X(eventTime)); % Feature: Left Tight Acceleration X
%fprintf(fid, '8:');
%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Y(eventTime)); % Feature: Left Tight Acceleration Y
%fprintf(fid, '9:');
%fprintf(fid,'%5f ', SensorAcceleration_LeftUpperLeg_Z(eventTime)); % Feature: Left Tight Acceleration Z	
%
%fprintf(fid, '10:');
%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_X(eventTime)); % Feature: Right Shank Angular Velocity X
%fprintf(fid, '11:');
%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Y(eventTime)); % Feature: Right Shank Angular Velocity Y
%fprintf(fid, '12:');
%fprintf(fid,'%5f ', SensorAngularVelocity_RightLowerLeg_Z(eventTime)); % Feature: Right Shank Angular Velocity Z
%fprintf(fid, '13:');
%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_X(eventTime)); % Feature: Left Shank Angular Velocity X
%fprintf(fid, '14:');
%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Y(eventTime)); % Feature: Left Shank Angular Velocity Y
%fprintf(fid, '15:');
%fprintf(fid,'%5f ', SensorAngularVelocity_LeftLowerLeg_Z(eventTime)); % Feature: Left Shank Angular Velocity Z	

fprintf(fid, '1:');
fprintf(fid,'%5f ', mean(SensorAcceleration_Pelvis_X(START_POINT:END_POINT))); % Feature: Pelvis Acceleration X
fprintf(fid, '2:');
fprintf(fid,'%5f ', mean(SensorAcceleration_Pelvis_Y(START_POINT:END_POINT))); % Feature: Pelvis Acceleration Y
fprintf(fid, '3:');
fprintf(fid,'%5f ', mean(SensorAcceleration_Pelvis_Z(START_POINT:END_POINT))); % Feature: Pelvis Acceleration Z

%fprintf(fid, '4:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_RightUpperLeg_X(START_POINT:END_POINT))); % Feature: Right Tight Acceleration X
%fprintf(fid, '5:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_RightUpperLeg_Y(START_POINT:END_POINT))); % Feature: Right Tight Acceleration Y
%fprintf(fid, '6:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_RightUpperLeg_Z(START_POINT:END_POINT))); % Feature: Right Tight Acceleration Z			
%fprintf(fid, '7:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_LeftUpperLeg_X(START_POINT:END_POINT))); % Feature: Left Tight Acceleration X
%fprintf(fid, '8:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_LeftUpperLeg_Y(START_POINT:END_POINT))); % Feature: Left Tight Acceleration Y
%fprintf(fid, '9:');
%fprintf(fid,'%5f ', mean(SensorAcceleration_LeftUpperLeg_Z(START_POINT:END_POINT))); % Feature: Left Tight Acceleration Z	
%
%fprintf(fid, '10:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_RightLowerLeg_X(START_POINT:END_POINT))); % Feature: Right Shank Angular Velocity X
%fprintf(fid, '11:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_RightLowerLeg_Y(START_POINT:END_POINT))); % Feature: Right Shank Angular Velocity Y
%fprintf(fid, '12:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_RightLowerLeg_Z(START_POINT:END_POINT))); % Feature: Right Shank Angular Velocity Z
%fprintf(fid, '13:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_LeftLowerLeg_X(START_POINT:END_POINT))); % Feature: Left Shank Angular Velocity X
%fprintf(fid, '14:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_LeftLowerLeg_Y(START_POINT:END_POINT))); % Feature: Left Shank Angular Velocity Y
%fprintf(fid, '15:');
%fprintf(fid,'%5f ', mean(SensorAngularVelocity_LeftLowerLeg_Z(START_POINT:END_POINT))); % Feature: Left Shank Angular Velocity Z	

fprintf(fid, '\r\n');