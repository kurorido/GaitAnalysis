function plotAllInOne(data, name, column, DATA_DIR)

% column = 63;
% data = allCycleData;
% name = 'Ankle-Z';

tmpCycles = data{column};

figure('name', strcat(name, '-All'));
hold on;
axis([0 101 -90 90]);

% errorbar(Y,E) plots Y and draws an error bar at each element of Y.
% errorbar(X,Y,E) plots Y versus X with symmetric error bars 2*E(i) long. X, Y, E must be the same size.
meanCycle = mean(tmpCycles, 2); % mean all cycles into a cycle
tmpStdCycle = std(tmpCycles, 0, 2); % std all cycles into a cycle

h = errorbar(1:101, meanCycle, tmpStdCycle);
hc = get(h, 'Children');
set(hc(1),'color','b'); %// data
set(hc(2),'color','r'); %// error bars

hold off;

saveas(h, strcat(DATA_DIR, '\', name, '-All'), 'png');

%for i = 1 : size(tmpCycles, 2)
%	
%	plot(1:101, tmpCycles(:,i));
%	
%end