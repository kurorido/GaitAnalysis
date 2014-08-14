IC_DIR = 'J:\Roliroli\S08\IC-Time-Indent\';
TO_DIR = 'J:\Roliroli\S08\TO-Time-Indent\';
OUT_DIR = 'J:\Roliroli\S08\';

for i = 1:30
	
	IC_pelvisTimes = load(strcat(IC_DIR,'PelvisTime-', int2str(i), '.txt'));
	IC_tightTimes = load(strcat(IC_DIR,'TightTime-', int2str(i), '.txt'));
	IC_shankTimes = load(strcat(IC_DIR,'ShankTime-', int2str(i), '.txt'));
	IC_footTimes = load(strcat(IC_DIR,'FootTime-', int2str(i), '.txt'));
	IC_SVRTimes = load(strcat(IC_DIR,'SVRTime-', int2str(i), '.txt'));
	IC_gaitRiteTimes = load(strcat(IC_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	TO_pelvisTimes = load(strcat(TO_DIR,'PelvisTime-', int2str(i), '.txt'));
	TO_tightTimes = load(strcat(TO_DIR,'TightTime-', int2str(i), '.txt'));
	TO_shankTimes = load(strcat(TO_DIR,'ShankTime-', int2str(i), '.txt'));
	TO_footTimes = load(strcat(TO_DIR,'FootTime-', int2str(i), '.txt'));
	TO_SVRTimes = load(strcat(TO_DIR,'SVRTime-', int2str(i), '.txt'));
	TO_gaitRiteTimes = load(strcat(TO_DIR,'GAITRiteTime-', int2str(i), '.txt'));
	
	temp = [IC_pelvisTimes TO_pelvisTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'PelvisTime-', int2str(i), '.txt'), temp);
	
	temp = [IC_tightTimes TO_tightTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'TightTime-', int2str(i), '.txt'), temp);
	
	temp = [IC_shankTimes TO_shankTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'ShankTime-', int2str(i), '.txt'), temp);
	
	temp = [IC_footTimes TO_footTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'FootTime-', int2str(i), '.txt'), temp);
	
	temp = [IC_SVRTimes TO_SVRTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'SVRTime-', int2str(i), '.txt'), temp);	
	
	temp = [IC_gaitRiteTimes TO_gaitRiteTimes]; 
	temp = sort(temp, 'ascend');
	dlmwrite(strcat(OUT_DIR, 'GAITRiteTime-', int2str(i), '.txt'), temp);		
	
end