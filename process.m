function [gait] = process(gait)

	% Joint Angle
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% 1
	% JX1 = L5S1(X) 1
	% JY1 = L5S1(Y) 2
	% JZ1 = L5S1(Z) 3
	% 7
	% JX2 = RightC7Shoulder (X) 19
	% JY2 = RightC7Shoulder (Y) 20
	% JZ2 = RightC7Shoulder (Z) 21
	% 16
	% JX3 = RightKnee (X) 46
	% JY3 = RightKnee (Y) 47
	% JZ3 = RightKnee (Z) 48
	% Columns = {'Joint' 'Parameter', 'Mean', 'Median', 'STDEV', 'P5', 'P90', 'Max','Min','TimeToPeak','Area'};
	
	mean_angles = mean(gait.jointAngle);
	std_angles = std(gait.jointAngle);
	min_angles = min(gait.jointAngle);
	p10_angles = prctile(gait.jointAngle, 10);
	p25_angles = prctile(gait.jointAngle, 25);
	median_angles = median(gait.jointAngle);
	p75_angles = prctile(gait.jointAngle, 75);
	p90_angles = prctile(gait.jointAngle, 90);
	max_angles = max(gait.jointAngle);
	IQR_angles = p75_angles - p25_angles;
	% QD_angles = (p75_angles - p25_angles) / 2;
	APDF_angles = p90_angles - p10_angles;
	range_angles = max_angles - min_angles;
	bigThanZero_angles = [];
	for i = [1:66]
		bigThanZero_angles = [bigThanZero_angles (sum(sign(find(gait.jointAngle(:,i) > 0))) / gait.frameLength)];
	end
	
	% supress the warning
	warning('off','MATLAB:xlswrite:AddSheet');
	
	% Write col headers
	col_headers = num2cell([1:66]);
	xlswrite(strcat(gait.id ,'.xls'), col_headers, 'Joint Angle','B1');
	
	% Write row headers
	row_headers = {'Mean'; 'STD'; 'Min'; 'P10'; 'P25'; 'Median'; 'P75'; 'P90'; 'Max'; 'IQR'; 'APDF' ;'Range'; 'Bigger than 0'};
	xlswrite(strcat(gait.id ,'.xls'), row_headers, 'Joint Angle','A2');
	
	% Prepare data
	d = [mean_angles ; std_angles; min_angles; p10_angles; p25_angles; median_angles; p75_angles; p90_angles; max_angles; IQR_angles; APDF_angles ;range_angles; bigThanZero_angles];
	
	% Write data
	xlswrite(strcat(gait.id ,'.xls'), d, 'Joint Angle', 'B2');

	% Shoulder
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	% Left 12
	% 34 35 36
	% Right 17
	% 49 50 51
	shoulder_diff_X = gait.position(:, 49) - gait.position(:, 34);
	shoulder_diff_Y = gait.position(:, 50) - gait.position(:, 35);
	shoulder_diff_Z = gait.position(:, 51) - gait.position(:, 36);
	shoulder(:,1) = shoulder_diff_X;
	shoulder(:,2) = shoulder_diff_Y;
	shoulder(:,3) = shoulder_diff_Z;
	
	mean_shoulder = mean(shoulder);
	std_shoulder = mean(shoulder);
	min_shoulder = min(shoulder);
	p10_shoulder = prctile(shoulder, 10);
	p25_shoulder = prctile(shoulder, 25);
	median_shoulder = median(shoulder);
	p75_shoulder = prctile(shoulder, 75);
	p90_shoulder = prctile(shoulder, 90);
	max_shoulder = max(shoulder);
	IQR_shoulder = p75_shoulder - p25_shoulder;
	APDF_shoulder = p90_shoulder - p10_shoulder;
	range_shoulder = max_shoulder - min_shoulder;
	
	% Write col headers
	col_headers = {'X', 'Y', 'Z'};
	xlswrite(strcat(gait.id ,'.xls'), col_headers, 'Acromin', 'B1');
	
	% Write row headers
	row_headers = {'Mean'; 'STD'; 'Min'; 'P10'; 'P25'; 'Median'; 'P75'; 'P90'; 'Max'; 'IQR'; 'APDF' ; 'Range';};
	xlswrite(strcat(gait.id ,'.xls'), row_headers, 'Acromin','A2');
	
	% Prepare data
	d = [mean_shoulder ; std_shoulder; min_shoulder; p10_shoulder; p25_shoulder; median_shoulder; p75_shoulder; p90_shoulder; max_shoulder; IQR_shoulder; APDF_shoulder;range_shoulder];
	
	% Write data
	xlswrite(strcat(gait.id ,'.xls'), d, 'Acromin', 'B2');	
	
	% Pos_s
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	pos1 = gait.position;
	pos2 = [zeros([1,69]) ; pos1];
	i = 3;
	while i <= 69
		pos2(:,i) = 0;
		i = i + 3;
	end	
	pos1 = [gait.position ; zeros([1,69])];
	pos_diff = pos1 - pos2;
	pos_diff = pos_diff( 2:end-1 , 1:end);
	
	mean_pos_diff = mean(pos_diff);
	std_pos_diff = mean(pos_diff);
	min_pos_diff = min(pos_diff);
	p10_pos_diff = prctile(pos_diff, 10);
	p25_pos_diff = prctile(pos_diff, 25);
	median_pos_diff = median(pos_diff);
	p75_pos_diff = prctile(pos_diff, 75);
	p90_pos_diff = prctile(pos_diff, 90);
	max_pos_diff = max(pos_diff);
	IQR_pos_diff = p75_pos_diff - p25_pos_diff;
	APDF_pos_diff = p90_pos_diff - p10_pos_diff;
	range_pos_diff = max_pos_diff - min_pos_diff;	
	
	% Write col headers
	col_headers = num2cell([1:69]);
	xlswrite(strcat(gait.id ,'.xls'), col_headers, 'Pos_S', 'B1');
	
	% Write row headers
	row_headers = {'Mean'; 'STD'; 'Min'; 'P10'; 'P25'; 'Median'; 'P75'; 'P90'; 'Max'; 'IQR'; 'APDF' ; 'Range';};
	xlswrite(strcat(gait.id ,'.xls'), row_headers, 'Pos_S','A2');
	
	% Prepare data
	d = [mean_pos_diff ; std_pos_diff; min_pos_diff; p10_pos_diff; p25_pos_diff; median_pos_diff; p75_pos_diff; p90_pos_diff; max_pos_diff; IQR_pos_diff; APDF_pos_diff ;range_pos_diff];
	
	% Write data
	xlswrite(strcat(gait.id ,'.xls'), d, 'Pos_S', 'B2');
	
	
	% Calibration Position
	cValue = gait.npose;
	for i = [1:gait.frameLength - 2]
		cValue = [cValue ; gait.npose];
	end
	c_pos_diff = pos_diff - cValue;
	
	mean_c_pos_diff = mean(c_pos_diff);
	std_c_pos_diff = mean(c_pos_diff);
	min_c_pos_diff = min(c_pos_diff);
	p10_c_pos_diff = prctile(c_pos_diff, 10);
	p25_c_pos_diff = prctile(c_pos_diff, 25);
	median_c_pos_diff = median(c_pos_diff);
	p75_c_pos_diff = prctile(c_pos_diff, 75);
	p90_c_pos_diff = prctile(c_pos_diff, 90);
	max_c_pos_diff = max(c_pos_diff);
	IQR_c_pos_diff = p75_c_pos_diff - p25_c_pos_diff;
	APDF_c_pos_diff = p90_c_pos_diff - p10_c_pos_diff;
	range_c_pos_diff = max_c_pos_diff - min_c_pos_diff;		
	
	% Write col headers
	col_headers = num2cell([1:69]);
	xlswrite(strcat(gait.id ,'.xls'), col_headers, 'C_Pos_S', 'B1');
	
	% Write row headers
	row_headers = {'Mean'; 'STD'; 'Min'; 'P10'; 'P25'; 'Median'; 'P75'; 'P90'; 'Max'; 'IQR'; 'APDF' ; 'Range';};
	xlswrite(strcat(gait.id ,'.xls'), row_headers, 'C_Pos_S','A2');
	
	% Prepare data
	d = [mean_c_pos_diff ; std_c_pos_diff; min_c_pos_diff; p10_c_pos_diff; p25_c_pos_diff; median_c_pos_diff; p75_c_pos_diff; p90_c_pos_diff; max_c_pos_diff; IQR_c_pos_diff; APDF_c_pos_diff ;range_c_pos_diff];
	
	% Write data
	xlswrite(strcat(gait.id ,'.xls'), d, 'C_Pos_S', 'B2');	
	
	%% L5S1
	%L5S1_X = gait.jointAngle([1:gait.frameLength], 1);
	%L5S1_Y = gait.jointAngle([1:gait.frameLength], 2);
	%L5S1_Z = gait.jointAngle([1:gait.frameLength], 3);
	%
	%% RightC7Shoulder
	%RightC7Shoulder_X = gait.jointAngle([1:gait.frameLength], 19);
	%RightC7Shoulder_Y = gait.jointAngle([1:gait.frameLength], 20);
	%RightC7Shoulder_Z = gait.jointAngle([1:gait.frameLength], 21);
	%
	%% RightKnee
	%RightKnee_X = gait.jointAngle([1:gait.frameLength], 46);
	%RightKnee_Y = gait.jointAngle([1:gait.frameLength], 47);
	%RightKnee_Z = gait.jointAngle([1:gait.frameLength], 48);
	%
	%%%%%%%%%%%%%%%%%%%%%%%%%
	%% Average / Mean
	%L5S1_X_Mean = mean(L5S1_X);
	%L5S1_Y_Mean = mean(L5S1_Y);
	%L5S1_Z_Mean = mean(L5S1_Z);
	%
	%RightC7Shoulder_X_Mean = mean(RightC7Shoudler_X);
	%RightC7Shoulder_Y_Mean = mean(RightC7Shoudler_Y);
	%RightC7Shoulder_Z_Mean = mean(RightC7Shoudler_Z);
	
	% Position
	% X1 = pL5SpinalProcess(X)n- pL5SpinalProcess(X)n-1
	% Y1 = pL5SpinalProcess(Y)n- pL5SpinalProcess(Y)n-1
	% Z1 = pL5SpinalProcess(Z)
	% CX1 = X1- pL5SpinalProcessC(X)
	% CY1 = Y1- pL5SpinalProcessC(Y)
	% CZ1 = Z1- pL5SpinalProcessC(Z)

end