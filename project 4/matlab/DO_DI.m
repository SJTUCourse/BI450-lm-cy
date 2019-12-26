function varargout = DO_DI(varargin)
% DO_DI M-file for DO_DI.fig
%      DO_DI, by itself, creates a new DO_DI or raises the existing
%      singleton*.
%
%      H = DO_DI returns the handle to a new DO_DI or the handle to
%      the existing singleton*.
%
%      DO_DI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DO_DI.M with the given input arguments.
%
%      DO_DI('Property','Value',...) creates a new DO_DI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DO_DI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DO_DI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DO_DI

% Last Modified by GUIDE v2.5 19-Dec-2019 14:45:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DO_DI_OpeningFcn, ...
                   'gui_OutputFcn',  @DO_DI_OutputFcn, ...
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


% --- Executes just before DO_DI is made visible.
function DO_DI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DO_DI (see VARARGIN)

% Choose default command line output for DO_DI
handles.output = hObject;
for i = 1 : 8
    handles.btval(i) = 0;
end
handles.kk = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DO_DI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DO_DI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton1,'value');
switch val
    case 1
        set(handles.togglebutton1,'backgroundcolor',[0 0.6 1]);
        handles.btval(1) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton1,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(1) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton2,'value');
switch val
    case 1
        set(handles.togglebutton2,'backgroundcolor',[0 0.6 1]);
        handles.btval(2) = 1;
    case 0
        set(handles.togglebutton2,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(2) = 0;
end
guidata(hObject,handles);
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton3,'value');
switch val
    case 1
        set(handles.togglebutton3,'backgroundcolor',[0 0.6 1]);
        handles.btval(3) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton3,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(3) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);

% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton4,'value');
switch val
    case 1
        set(handles.togglebutton4,'backgroundcolor',[0 0.6 1]);
        handles.btval(4) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton4,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(4) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in togglebutton5.
function togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton5,'value');
switch val
    case 1
        set(handles.togglebutton5,'backgroundcolor',[0 0.6 1]);
        handles.btval(5) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton5,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(5) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton5


% --- Executes on button press in togglebutton6.
function togglebutton6_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton6,'value');
switch val
    case 1
        set(handles.togglebutton6,'backgroundcolor',[0 0.6 1]);
        handles.btval(6) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton6,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(6) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton6


% --- Executes on button press in togglebutton7.
function togglebutton7_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton7,'value');
switch val
    case 1
        set(handles.togglebutton7,'backgroundcolor',[0 0.6 1]);
        handles.btval(7) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton7,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(7) = 0;
        guidata(hObject,handles);
end
Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton7


% --- Executes on button press in togglebutton8.
function togglebutton8_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(handles.togglebutton8,'value');
switch val
    case 1
        set(handles.togglebutton8,'backgroundcolor',[0 0.6 1]);
        handles.btval(8) = 1;
        guidata(hObject,handles);
    case 0
        set(handles.togglebutton8,'backgroundcolor',[0.4 0.8 1]);
        handles.btval(8) = 0;
        guidata(hObject,handles);
end

Calhex(handles);
Digital_Output(handles);
% Hint: get(hObject,'Value') returns toggle state of togglebutton8



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DO_fre = str2double(get(handles.edit3,'string'));
DO_timer =  timer('TimerFcn',{@StaticDO,hObject} ,'busymode','queue', 'period', ...
        double(1/(2*DO_fre)) , 'executionmode', 'fixedrate', ...
        'StartDelay', 2);
% handles = guidata(hObject);
handles.DO_timer = DO_timer;
handles.DO_fre = DO_fre;
guidata(hObject,handles);
start(DO_timer);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(handles.DO_timer,'Running'), 'on')
    stop(handles.DO_timer);
    set(handles.pushbutton2,'string','Continue');
else
    start(handles.DO_timer);
    set(handles.pushbutton2,'string','Pause');
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.DO_timer);
delete(handles.DO_timer);
set(handles.pushbutton2,'string','Pause');

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'value',~get(handles.radiobutton1,'value'));
% Hint: get(hObject,'Value') returns toggle state of radiobutton1



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isempty(handles.DO_timer) && isvalid(handles.DO_timer)
    DO_fre= str2double(get(hObject,'string'));
    stop(handles.DO_timer);
    set(handles.DO_timer,'period',1/(2*DO_fre));
    start(handles.DO_timer);
end
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',~get(handles.radiobutton2,'value'));
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'HandleVisibility','on');
set(handles.axes1,'NextPlot','add');
axes(handles.axes1);
xlabel('time/s');
ylabel('voltage/V');
set(gca,'ytick',[-3 -2 -1 0 1 2 3]);
axis([0 1 -3.1 3+0.1])
StaticDI(handles,hObject);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.DI_timer);
delete(handles.DI_timer);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = gcf;
prj4;
close(h);
