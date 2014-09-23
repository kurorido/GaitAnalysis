function h = plotCycle(data, name, column, DATA_DIR)

tmpCycles = data{column};

for i = 1 : size(tmpCycles, 2)
	
	h = figure('name', strcat(name, '-Cycle-', int2str(i)));
	hold on;
	axis([0 101 -90 90]);
	plot(1:101, tmpCycles(:,i));
	hold off;
	
	saveas(h, strcat(DATA_DIR, '\', name, '-Cycle-', int2str(i)), 'png');

end
