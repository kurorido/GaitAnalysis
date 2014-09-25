function result = removeTooNear(data)

result = [data(1)];

current = 1;

for i = 2 : length(data)
	
	if(data(i) - data(current) < 30)
		continue; % too near, try next
	else
		result = [result data(i)]; % put data into result
		current = current + 1; % move cursor next
	end

end