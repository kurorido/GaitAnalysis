function target = checkFrameDiff(target)

	for i = 1:length(target)
		
		flag = 0;
		
		if(target(i) < 0)
			flag = 1;
		end
		
		
		frameDiff = abs(target(i));

		if(frameDiff >= 30)
			target(i) = frameDiff - 20; 
		elseif(frameDiff >= 15)
			target(i) = frameDiff - 10; 
		end
		
		if(flag == 1)
			target(i) = target(i) * (-1);
		end
	
	end

end