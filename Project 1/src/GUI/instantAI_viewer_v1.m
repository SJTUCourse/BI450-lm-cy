function varargout = instantAI_viewer_v1(varargin)
% INSTANTAI_VIEWER_V1 M-file for instantAI_viewer_v1.fig
%      INSTANTAI_VIEWER_V1, by itself, creates a new INSTANTAI_VIEWER_V1 or raises the existing
%      singleton*.
%
%      H = INSTANTAI_VIEWER_V1 returns the handle to a new INSTANTAI_VIEWER_V1 or the handle to
%      the existing singleton*.
%
%      INSTANTAI_VIEWER_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INSTANTAI_VIEWER_V1.M with the given input arguments.
%
%      INSTANTAI_VIEWER_V1('Property','Value',...) creates a new INSTANTAI_VIEWER_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before instantAI_viewer_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to instantAI_viewer_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help instantAI_viewer_v1

% Last Modified by GUIDE v2.5 06-Oct-2019 16:08:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @instantAI_viewer_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @instantAI_viewer_v1_OutputFcn, ...
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


% --- Executes just before instantAI_viewer_v1 is made visible.
function instantAI_viewer_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to instantAI_viewer_v1 (see VARARGIN)

% Choose default command line output for instantAI_viewer_v1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes instantAI_viewer_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = instantAI_viewer_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: place code in OpeningFcn to populate axes1

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO) 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
start(t)


% graph_fft=fft(temp,1024);
% axes(handles.axes3);
% plot(graph_fft);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global instantAiCtrl;
global t;
stop(t);
delete(t);
instantAiCtrl.Dispose();

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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;
global temp2;
global p;
global sample_f;
val = get(handles.popupmenu1,'value');
axes(handles.axes3);
cla
switch val
    case 1
     b = linspace(-1/(2*sample_f),1/(2*sample_f),p(1)-1);
     plot(b,abs(fftshift(fft(temp))),'r');
    case 2
     b = linspace(-1/(2*sample_f),1/(2*sample_f),p(2)-1);
     plot(b,abs(fftshift(fft(temp2))),'r');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
global temp;
global temp2;
global time;
global time1;
global graph_show;
global graph_show1;
global data_show1;
global voltage_min;
global voltage_max;
global time_scale;
global sample_f;

user_string = get(handles.edit2,'String');
sample_frequency = str2double(user_string);
user_string = get(handles.edit6,'string');
Wp = str2double(user_string);
user_string = get(handles.edit7,'string');
Ws = str2double(user_string);

if get(handles.radiobutton1,'value') == 1
    filtertype = 1;
end
if get(handles.radiobutton2,'value') == 1
    filtertype = 2;
end
if get(handles.radiobutton3,'value') == 1
    filtertype = 3;
end
Wp = Wp * 2 / sample_frequency;
Ws = Ws * 2 / sample_frequency;

Rp = 1;
Rs = 25;

[N,Wn] = buttord(Wp,Ws,Rp,Rs);
switch filtertype
    case 1
        [b,a] = butter(N,Wn,'low');
    case 3
        [b,a] = butter(N,Wn,'high');
end

val = get(handles.popupmenu1,'value');
switch val
    case 1
        temp_filter = filter(b,a,temp);
        axes(handles.axes1);
        cla
        set(graph_show,'XData',time,'YData',temp_filter,'color','red');
%         -----------------------------
         if get(handles.radiobutton4,'Value') == 1
            if (sample_f*p(1)<500*sample_f) 
               axis([0 500*sample_f voltage_min voltage_max]) 
            else
               axis([sample_f*p(1)-500*sample_f sample_f*p(1) voltage_min voltage_max]);
            end
         else 
            if (sample_f*p(1)<time_scale) 
               axis([0 time_scale voltage_min voltage_max]) 
            else
               axis([sample_f*p(1)-time_scale sample_f*p(1) voltage_min voltage_max]);
            end
         end
%          --------------------------
    case 2
        temp2_filter = filter(b,a,temp2);
        axes(handles.axes5);
%         cla
          graph_show1 = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);
          set(graph_show1,'XData',time1,'YData',data_show1);
          hold on
          graph_show2 = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);
          set(graph_show2,'XData',time1,'YData',temp2_filter,'color','red');
          
%         -----------------------------
         if get(handles.radiobutton4,'Value') == 1
            if (sample_f*p(2)<500*sample_f) 
               axis([0 500*sample_f voltage_min voltage_max]) 
            else
               axis([sample_f*p(2)-500*sample_f sample_f*p(2) voltage_min voltage_max]);
            end
         else 
            if (sample_f*p(2)<time_scale) 
               axis([0 time_scale voltage_min voltage_max]) 
            else
               axis([sample_f*p(2)-time_scale sample_f*p(2) voltage_min voltage_max]);
            end
         end
%          ------------------------------------
         axes(handles.axes4);
         cla
         b = linspace(-1/(2*sample_f),1/(2*sample_f),p(2)-1);
         plot(b,abs(fftshift(fft(temp2_filter))),'r');

end



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;   
global temp2;
global time;
global data_show;
global time1;
global data_show1;
global graph_show;
global graph_show1;
global p;    
global sample_f;
global instantAiCtrl;
global t;
global voltage_min;
global voltage_max;
global time_scale;

user_string = get(handles.edit2,'String');
sample_frequency = str2double(user_string);
sample_f = 1/sample_frequency;

user_string = get(handles.edit3,'String');
voltage_min = str2double(user_string);

user_string = get(handles.edit4,'String');
voltage_max = str2double(user_string);

user_string = get(handles.edit5,'String');
time_scale = str2double(user_string);

temp = [];
temp2 = [];
p(1) = 1;
p(2) = 1;

set(handles.figure1,'HandleVisibility','on');
set(handles.axes1,'NextPlot','add');
set(handles.axes5,'NextPlot','add');
axis(handles.axes1);
axis(handles.axes5);
% =========================================================================
axes(handles.axes1);
cla 
if get(handles.radiobutton4,'Value')==1
    set(gca,'Xlim',[0 500*sample_f]);
    set(gca,'Ylim',[voltage_min voltage_max]);
else
    set(gca,'Xlim',[0 time_scale]); 
    set(gca,'Ylim',[voltage_min voltage_max]);
end
axes(handles.axes5);
cla 
if get(handles.radiobutton4,'Value')==1
    set(gca,'Xlim',[0 500*sample_f]);
    set(gca,'Ylim',[voltage_min voltage_max]);
else
    set(gca,'Xlim',[0 time_scale]); 
    set(gca,'Ylim',[voltage_min voltage_max]);
end
% ========================================================================
time = [0];
data_show = [0];
time1 = [0];
data_show1 = [0];

axes(handles.axes1);
graph_show = plot(time,data_show,'EraseMode','background','MarkerSize',5);
axes(handles.axes5);
graph_show1 = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);
% instantAI();
% ================================================================
BDaq = NET.addAssembly('Automation.BDaq4');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other 
% devices according to their needs. 
deviceDescription = 'DemoDevice,BID#0'; 
startChannel = int32(1);
channelCount = int32(2);

% Step 1: Create a 'InstantAiCtrl' for Instant AI function.
instantAiCtrl = Automation.BDaq.InstantAiCtrl();

% Step 2: Select a device by device number or device description and 
% specify the access mode. In this example we use
% AccessWriteWithReset(default) mode so that we can fully control the 
% device, including configuring, sampling, etc.
    instantAiCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    data = NET.createArray('System.Double', channelCount);
    
    % Step 3: Read samples and do post-process, we show data here.
    errorCode = Automation.BDaq.ErrorCode();
    


t = timer('TimerFcn', {@TimerCallback_v1, instantAiCtrl, startChannel, ...
    channelCount, data, handles, 1/sample_frequency}, 'period', 1/sample_frequency, 'executionmode', 'fixedrate', ...
   'StartDelay', 1);
% ==================================================================


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp;
global temp2;

csvwrite('data_channel0.csv',temp');
csvwrite('data_channel1.csv',temp2');


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(gcbo);
X=get(gca,'Xlim');
Xmin = X(1);
Xmax = X(2);

Y=get(gca,'Ylim');
Ymin = Y(1);
Ymax = Y(2);

AxName = get(gca,'Tag');
hTX = findobj(gcf, 'tag' , ['TX1']);
hTY = findobj(gcf, 'tag' , ['TY1']);

curpos = get(gca, 'CurrentPoint');
pX = max ([Xmin curpos(1,1)]);
pX = min ([Xmax pX]);
pY = max ([Ymin curpos(1,2)]);
pY = min ([Ymax pY]);
set(hTX,'string',pX);
set(hTY,'string',pY);

guidata(gcbo,handles);



function TX1_Callback(hObject, eventdata, handles)
% hObject    handle to TX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TX1 as text
%        str2double(get(hObject,'String')) returns contents of TX1 as a double


% --- Executes during object creation, after setting all properties.
function TX1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TX1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TY1_Callback(hObject, eventdata, handles)
% hObject    handle to TY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TY1 as text
%        str2double(get(hObject,'String')) returns contents of TY1 as a double


% --- Executes during object creation, after setting all properties.
function TY1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TY1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% X=get(gca,'Xlim');
% Xmin = X(1);
% Xmax = X(2);
% 
% Y=get(gca,'Ylim');
% Ymin = Y(1);
% Ymax = Y(2);
% 
% AxName = get(gca,'Tag');
% hTX = findobj(gcf, 'Tag' , 'TX1');
% hTY = findobj(gcf, 'Tag' , 'TY1');
% 
% curpos = get(gca, 'CurrentPoint');
% pX = max ([Xmin curpos(1,1)]);
% pX = min ([Xmax pX]);
% pY = max ([Ymin curpos(1,2)]);
% pY = min ([Ymax pY]);
% set(hTX,'string',pX);
% set(hTY,'string',pY);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% X=get(gca,'Xlim');
% Xmin = X(1);
% Xmax = X(2);
% 
% Y=get(gca,'Ylim');
% Ymin = Y(1);
% Ymax = Y(2);
% 
% AxName = get(gca,'Tag');
% hTX = findobj(gcf, 'tag' , ['TX1']);
% hTY = findobj(gcf, 'tag' , ['TY1']);
% 
% curpos = get(gca, 'CurrentPoint');
% pX = max ([Xmin curpos(1,1)]);
% pX = min ([Xmax pX]);
% pY = max ([Ymin curpos(1,2)]);
% pY = min ([Ymax pY]);
% set(hTX,'string',pX);
% set(hTY,'string',pY);
