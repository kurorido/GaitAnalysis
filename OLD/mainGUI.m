function mainGUI(gait)

f = figure('Position', [100 100 1200 500]);
t = uitable('Parent', f, 'Position', [25 25 1100 150]);
set(t, 'Data', [gait.LeftInitialContact; gait.RightToeOff ;gait.RightInitialContact; gait.LeftToeOff])
rnames = {'LI','RT','RI','LT'};
set(t, 'RowName', rnames);

h = axes('Parent', f, 'position',[.1  .4  .8  .5])

cycleSelectString = {}
for i = [1:length(gait.LeftInitialContact)-1]
	cycleSelectString{i} = i
end

uicontrol('style','text','string','Cycle From', 'Position', [220 460 100 20]);
uicontrol('style','text','string','To', 'Position', [460 460 30 20]);

cycleSelectStart = uicontrol('Parent', f, 'Style', 'popup', 'String', cycleSelectString, 'Position', [330 435 110 50])
cycleSelectEnd = uicontrol('Parent', f, 'Style', 'popup', 'String', cycleSelectString, 'Position', [500 435 110 50])

drawButton = uicontrol('Parent', f, 'Style', 'pushbutton', 'String', 'Push', 'Position', [620 460 70 30])
set(drawButton, 'Callback', {'drawButton_callback', h, gait, cycleSelectStart, cycleSelectEnd})