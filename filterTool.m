function result = filterTool(target)
	
	result = target;
	
	[B,A]= butter(4,5/60,'low');
	result = filtfilt(B, A, target);
	clear A B;
	
end