function result = filterTool(target)
	
	result = target;
	
	[B,A]= butter(4,3/60,'low');
	result = filtfilt(B, A, target);
	clear A B;
	
end