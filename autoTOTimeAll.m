for subjectNum = 21 : 21

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end

	ROOT_DIR = strcat('J:\Roliroli\S', number,'\');
	autoTOTime;

end