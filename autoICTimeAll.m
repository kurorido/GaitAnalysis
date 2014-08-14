for subjectNum = 1 : 30

	if( subjectNum < 10 )
		number = strcat('0', int2str(subjectNum));
	else
		number = int2str(subjectNum);
	end

	ROOT_DIR = strcat('J:\Roliroli\S', number,'\');
	autoICTime;

end