function varargout = mainGUI(varargin)
% mainGUI MATLAB code for mainGUI.fig
%      mainGUI, by itself, creates a new mainGUI or raises the existing
%      singleton*.
%
%      H = mainGUI returns the handle to a new mainGUI or the handle to
%      the existing singleton*.
%
%      mainGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in mainGUI.M with the given input arguments.
%
%      mainGUI('Property','Value',...) creates a new mainGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainGUI

% Last Modified by GUIDE v2.5 11-Aug-2014 23:11:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @mainGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mainGUI is made visible.
function mainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainGUI (see VARARGIN)

% Choose default command line output for mainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonInitialContact.
function buttonInitialContact_Callback(hObject, eventdata, handles)
% hObject    handle to buttonInitialContact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Load Input File Button Clicked!');
inputPath = get(handles.editTextInputFile,'String'); %edit1 being Tag of ur edit box
disp(inputPath);
load(inputPath);
set(handles.labelCurrentFile, 'String', inputPath);

output_dir = get(handles.editTextOutputDIR,'String'); %edit1 being Tag of ur edit box
ic_time_dir = strcat(output_dir, 'IC-Time/');
ic_time_validated_dir = strcat(output_dir, 'IC-Time-Validated/');
ic_range_dir = strcat(output_dir, 'IC-Range/');
ic_svr_dir = strcat(output_dir, 'IC-SVR/');
ic_svr_time = strcat(output_dir, 'IC-SVR-Time/');

mkdir(ic_time_dir);
mkdir(ic_time_validated_dir);
mkdir(ic_range_dir);
mkdir(ic_svr_dir);
mkdir(ic_svr_time);

END_TIME = size(gait.acceleration, 1);

normalize = false;
FeatureInit;

ROOT_DIR = output_dir;
draw = false;
runAlgorithmForIC;

pelvisTimes = load(strcat(ic_time_dir,'PelvisTime-', int2str(i), '.txt'));
shankTimes = load(strcat(ic_time_dir,'ShankTime-', int2str(i), '.txt'));
footTimes = load(strcat(ic_time_dir,'FootTime-', int2str(i), '.txt'));

lens = [length(pelvisTimes), length(shankTimes), length(footTimes)];
	len = min(lens);
	ind = find(lens==min(lens));
	ind = ind(1);

    if(ind == 1) timesToCut = pelvisTimes;
	elseif(ind == 2) timesToCut = shankTimes;
	elseif(ind == 3) timesToCut = footTimes;
    end
    
	OUT = [];
    
	for loop = 1 :3
	
		if(loop == 1) times = pelvisTimes;
		elseif(loop == 2) times = shankTimes;
		elseif(loop == 3) times = footTimes;
		end
		
		% Indent to min length
		RESULT = [0 0];
		for j = 1 : len
			tmp = abs(times - timesToCut(j));
			index = find(tmp == min(tmp));
			RESULT = [RESULT times(index)];
		end
		RESULT = RESULT(3:end);
		% OUT = [OUT; RESULT];
		
		
		
		if(loop == 1) timesAfterPelvis = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'PelvisTime-', int2str(i), '.txt');
		elseif(loop == 2) timesAfterShank = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'ShankTime-', int2str(i), '.txt');
		elseif(loop == 3) timesAfterFoot = RESULT; OUT_FILE_NAME = strcat(OUT_DIR, 'FootTime-', int2str(i), '.txt');
		end
		
		dlmwrite(OUT_FILE_NAME, RESULT);
	end    

% --- Executes on selection change in dropdownSignal.
function dropdownSignal_Callback(hObject, eventdata, handles)
% hObject    handle to dropdownSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dropdownSignal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dropdownSignal


% --- Executes during object creation, after setting all properties.
function dropdownSignal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dropdownSignal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextInputFile_Callback(hObject, eventdata, handles)
% hObject    handle to editTextInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextInputFile as text
%        str2double(get(hObject,'String')) returns contents of editTextInputFile as a double


% --- Executes during object creation, after setting all properties.
function editTextInputFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTextOutputDIR_Callback(hObject, eventdata, handles)
% hObject    handle to editTextOutputDIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTextOutputDIR as text
%        str2double(get(hObject,'String')) returns contents of editTextOutputDIR as a double


% --- Executes during object creation, after setting all properties.
function editTextOutputDIR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTextOutputDIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonLoadInputFile.
function buttonLoadInputFile_Callback(hObject, eventdata, handles)
% hObject    handle to buttonLoadInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buttonPlot.
function buttonPlot_Callback(hObject, eventdata, handles)
% hObject    handle to buttonPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listboxGaitCycles.
function listboxGaitCycles_Callback(hObject, eventdata, handles)
% hObject    handle to listboxGaitCycles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxGaitCycles contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxGaitCycles


% --- Executes during object creation, after setting all properties.
function listboxGaitCycles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxGaitCycles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over buttonInitialContact.
function buttonInitialContact_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to buttonInitialContact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on buttonLoadInputFile and none of its controls.
function buttonLoadInputFile_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to buttonLoadInputFile (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over buttonLoadInputFile.
function buttonLoadInputFile_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to buttonLoadInputFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
