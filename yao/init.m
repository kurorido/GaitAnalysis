%ROOT_DIR = 'J:\Kuan_Half\';
%DATA_NAME = 'HS_half_20141002-001_Suit 00131162';
% sb-111001-1L-000-1
% sb-111003-1L-T20-2

ROOT_DIR = 'J:\Roliroli-Gait\GaitAnalysis\yao\sample\';
DATA_NAME = 'sb-122002-1L-B10-1-017_2';

%ROOT_DIR = 'J:\Roliroli-Gait\GaitAnalysis\yao\';
%DATA_NAME = 'sb-111001-1L-000-1';

% Use this only when stair
%ROOT_DIR = 'J:\Roliroli-Gait\GaitAnalysis\yao\stair\';
%markerFileName = 'J:\Roliroli-Gait\GaitAnalysis\yao\stair\sb-121002-2T-000-1-001.xlsx';
%DATA_NAME = 'sb-121002-2T-000-1-001';

% 1 Pelvis
% 2 Shank
% 3 Foot
% 4 SVR
% 5 Manual (create ic_time.txt, to_time.txt by yourself)

method = 1;

%%%%%%%%%%%%%%%%%%%%%%%%
% Mode
stair = 1;
wholeCycle = 2;
doubleSupportOne = 3;
stancePhase = 4;
doubleSupportTwo = 5;
swingPhase = 6;

modeArr = {'Stair', 'WholeCycle', 'doubleSupportOne', 'StancePhase', 'DoubleSupportTwo', 'SwingPhase'};