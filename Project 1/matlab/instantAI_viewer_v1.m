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

% Last Modified by GUIDE v2.5 31-Oct-2019 13:59:55

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


% =========================================================================
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: initiate and set parameters
global temp;   
global temp2;
global time;
global data_show;
global time1;
global data_show1;
global graph_show;
global graph_show1;
global p;   
global q;
global sample_f;
global instantAiCtrl;
global t;
global voltage_min;
global voltage_max;
global time_scale;
global A;
user_string = get(handles.edit2,'String');
sample_frequency = str2double(user_string);
sample_f = 1/sample_frequency;

if sample_frequency > 1000 || sample_frequency < 0 
    warndlg('采样率范围为（0,1000）Hz','Warning');
    return;
end
user_string = get(handles.edit3,'String');
voltage_min = str2double(user_string);

user_string = get(handles.edit4,'String');
voltage_max = str2double(user_string);

user_string = get(handles.edit5,'String');
time_scale = str2double(user_string);

temp = zeros(2,100);
temp2 = zeros(2,100);

p(1) = 1;
p(2) = 1;
q(1) = 1;
q(2) = 1;
A = 0;

set(handles.figure1,'HandleVisibility','on');
set(handles.axes1,'NextPlot','add');
set(handles.axes5,'NextPlot','add');
axis(handles.axes1);
axis(handles.axes5);
% =========================================================================
% if parameters are to be reset, delete the template data in memory
if ~exist('data1.txt','file') == 0 
    delete('data1.txt');
end

if ~exist('data2.txt','file') == 0 
    delete('data2.txt');
end

if ~exist('data3.txt','file') == 0 
    delete('data3.txt');
end

if ~exist('data4.txt','file') == 0 
    delete('data4.txt');
end

% =========================================================================
% set the properties of axes
axes(handles.axes1);
cla 

set(gca,'Xlim',[0 time_scale]); 
set(gca,'Ylim',[voltage_min voltage_max]);

xlabel('Time/s');
ylabel('Voltage/V');

axes(handles.axes5);
cla 
%     set(gca,'Xtick',0:50*sample_f:500*sample_f);
    set(gca,'Xlim',[0 time_scale]); 
    set(gca,'Ylim',[voltage_min voltage_max]);
%     set(gca,'Xtick',0:time_scale/10:time_scale);

xlabel('Time/s');
ylabel('Voltage/V');
% ========================================================================
% preset the properties of axis
handles.sample_frequency = sample_frequency;

axes(handles.axes1);
time = zeros(1,time_scale * sample_frequency + 1);
data_show = zeros(1,time_scale * sample_frequency + 1);
graph_show = plot(time,data_show,'EraseMode','background','MarkerSize',5);

axes(handles.axes5);
time1 = zeros(1,time_scale * sample_frequency + 1);
data_show1 = zeros(1,time_scale * sample_frequency + 1);
graph_show1 = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);

% ================================================================
%DAQ Navi SDK
BDaq = NET.addAssembly('Automation.BDaq4');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other 
% devices according to their needs. 
deviceDescription = 'USB-4704,BID#0'; 
startChannel = int32(0);
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
    channelCount, data, handles, 1/sample_frequency , time_scale*sample_frequency}, 'period', 1/sample_frequency, 'executionmode', 'fixedrate', ...
   'StartDelay', 1);
set(handles.pushbutton1,'enable','on');
% =========================================================================

% =========================================================================
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO) 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Function: start timer
global t;
start(t)
set(handles.pushbutton2,'enable','on');
set(handles.pushbutton1,'enable','off');
% =========================================================================

% =========================================================================
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: stop timer and save the data from cache to the memory
global instantAiCtrl;
global t;
global q;
global temp;
global temp2;
stop(t);
delete(t);
% save data
if q(1) ~= 1 
   fp = fopen('data1.txt','a');
   fprintf(fp,'%d ',temp(1,1:q(1)-1));
   fclose(fp);
   fp = fopen('data2.txt','a');
   fprintf(fp,'%d ',temp(2,1:q(1)-1));
   fclose(fp);

   fp = fopen('data3.txt','a');
   fprintf(fp,'%d ',temp2(1,1:q(2)-1));
   fclose(fp);
   fp = fopen('data4.txt','a');
   fprintf(fp,'%d ',temp2(2,1:q(2)-1));
   fclose(fp);
end
instantAiCtrl.Dispose();
set(handles.pushbutton2,'enable','off');
set(handles.pushbutton8,'enable','on');
set(handles.pushbutton4,'enable','on');
set(handles.pushbutton5,'enable','on');
% =========================================================================

% =========================================================================
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: fft

global data_show;
global time;
global temp2;
global p;
global t;
global sample_f;
val = get(handles.popupmenu1,'value');
% 


% set the window width
if isempty(get(handles.edit11,'String'))
    sample_window = 1/(2*sample_f);
else 
    user_string = get(handles.edit11,'String');
    sample_window = str2double(user_string);
end 

if sample_window <= 0 || sample_window > 1/(2*sample_f)
    warndlg('显示范围错误','warning');
    return;
end
% set axes
axes(handles.axes3);
cla
% fft
switch val 
   case 1
     if p(1) == 1
        warndlg('通道选择错误','warning');
        return;
     end
     m = textread('data1.txt');
     n = textread('data2.txt');
     len = length(m);
     xi = 0:sample_f:n(len-1);%linear interpolation
     yi = spline(n(1:len-1),m(1:len-1),xi);
     len1 = length(xi);
     fft_x = linspace(0,1/(2*sample_f),ceil(len1/2));
     point = ceil(sample_window * len1 * sample_f);
     
     %label the maximum     
     h = abs(fft(yi)/len1)*2;
     max_scale = max(h(1:point));
     index = find( h(1:point) == max_scale );
     
     %plot
     plot(fft_x,h(1:ceil(len1/2)),'r');
     axis([0 sample_window 0 max_scale*1.5])
     text(fft_x(index),max_scale,['(',num2str(fft_x(index)),',',num2str(max_scale),')'],'color','b');
     xlabel('Frequency/Hz');
     ylabel('Amplitude');
     
  case 2
     if p(2) == 1
        warndlg('通道选择错误','warning');
        return;
     end
     m = textread('data3.txt');
     n = textread('data4.txt');
     len = length(m);
     xi = 0:sample_f:n(len-1);
     yi = spline(n(1:len-1),m(1:len-1),xi);%linear interpolation
     len1 = length(xi);
     fft_x = linspace(0,1/(2*sample_f),ceil(len1/2));
     point = ceil(sample_window * len1 * sample_f);
     % label the maximum
     h = abs(fft(yi)/len1)*2;
     max_scale = max(h(1:point));
     index = find( h(1:point) == max_scale );
     %plot
     plot(fft_x,h(1:ceil(len1/2)),'r');
     axis([0 sample_window 0 max_scale*1.5])
     text(fft_x(index),max_scale,['(',num2str(fft_x(index)),',',num2str(max_scale),')'],'color','b');
     xlabel('Frequency/Hz');
     ylabel('Amplitude');
end
% =========================================================================

% =========================================================================
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: filter
global p;
global data_show;
global time;
global time1;
global graph_show;
global graph_show1;
global data_show1;
global sample_f;

%set the parameter of butterworth filter
user_string = get(handles.edit2,'String');
sample_frequency = str2double(user_string);
user_string = get(handles.edit6,'string');
Wp = str2double(user_string);
user_string = get(handles.edit7,'string');
Ws = str2double(user_string);

if isnan(Wp) || isnan(Ws)
    warndlg('Please input the parameter','warning');
    return;
end

filtertype = 0;
if get(handles.radiobutton1,'value') == 1
    filtertype = 1;
end
if get(handles.radiobutton3,'value') == 1
    filtertype = 3;
end
if filtertype == 0
    warndlg('please choose the filtertype','warning');
    return;
end
% set the parameter of filter
Wp = Wp * 2 / sample_frequency;
Ws = Ws * 2 / sample_frequency;
Rp = 1;
Rs = 25;
[N,Wn] = buttord(Wp,Ws,Rp,Rs);

%choose the type of filter
switch filtertype
  case 1
    if Wp > Ws 
        warndlg('通带阻带频率设置错误','warning');
        return;
    end
    [b,a] = butter(N,Wn,'low');
  case 3
    if Wp < Ws 
        warndlg('通带阻带频率设置错误','warning');
        return;
    end
    [b,a] = butter(N,Wn,'high');
end

val = get(handles.popupmenu1,'value');
switch val
  case 1
     if p(1) == 1
        warndlg('通道选择错误','warning');
        return;
     end
    m = textread('data1.txt');
    n = textread('data2.txt');

    len = length(m);
    xi = 0:sample_f:n(len-1);
    yi = spline(n(1:len-1),m(1:len-1),xi);
     
    filter_yi = filter(b,a,yi);    
    axes(handles.axes1);
    cla      
   

    graph_show = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);
    set(graph_show,'XData',time(1:p(1)-1),'YData',data_show(1:p(1)-1));
    hold on
    graph_show2 = plot(xi,filter_yi,'EraseMode','background','MarkerSize',5);
    set(graph_show2,'color','red');

    axes(handles.axes4);
    cla
    
    % if the editbox of bandwidth is empty
    if isempty(get(handles.edit11,'String'))
       sample_window = 1/(2*sample_f);
    else 
       user_string = get(handles.edit11,'String');
       sample_window = str2double(user_string);
    end 
    
    %fft,show the specrum of filtered signal
    ylength = length(xi);
    point = ceil(sample_window * ylength * sample_f);
    fft_x = linspace(0,1/(2*sample_f),ceil(ylength/2));
    h = abs(fft(filter_yi)/ylength)*2;
    max_scale = max(h(1:point));
    index = find( h(1:point) == max_scale );
    plot(fft_x,h(1:ceil(ylength/2)),'r');
    axis([0 sample_window 0 max_scale*1.5])
    text(fft_x(index),max_scale,['(',num2str(fft_x(index)),',',num2str(max_scale),')'],'color','b');
    xlabel('Frequency/Hz');
    ylabel('Amplitude');
%          --------------------------
  case 2
     if p(2) == 1
        warndlg('通道选择错误','warning');
        return;
     end
    m = textread('data3.txt');
    n = textread('data4.txt');
    len = length(m);
    xi = 0:sample_f:n(len-1);
    yi = spline(n(1:len-1),m(1:len-1),xi);%linear interpolation

    % show the filtered data
    filter_yi = filter(b,a,yi);    
    axes(handles.axes5);
    cla          
    graph_show1 = plot(time1,data_show1,'EraseMode','background','MarkerSize',5);
    set(graph_show1,'XData',time1(1:p(2)-1),'YData',data_show1(1:p(2)-1));
    hold on
    graph_show2 = plot(xi,filter_yi,'EraseMode','background','MarkerSize',5);
    set(graph_show2,'color','red');
         
    % if the editbox of bandwidth is empty
    axes(handles.axes4);
    cla
    if isempty(get(handles.edit11,'String'))
       sample_window = 1/(2*sample_f);
    else 
       user_string = get(handles.edit11,'String');
       sample_window = str2double(user_string);
    end 
         
    %fft,show the specrum of filtered signal        
    ylength = length(xi);
    point = ceil(sample_window * ylength * sample_f);
    fft_x = linspace(0,1/(2*sample_f),ceil(ylength/2));
    h = abs(fft(filter_yi)/ylength)*2;
    max_scale = max(h(1:point));
    index = find( h(1:point) == max_scale );
    plot(fft_x,h(1:ceil(ylength/2)),'r');
    axis([0 sample_window 0 max_scale*1.5])
    text(fft_x(index),max_scale,['(',num2str(fft_x(index)),',',num2str(max_scale),')'],'color','b');
    xlabel('Frequency/Hz');
    ylabel('Amplitude');
end
% =========================================================================

% =========================================================================
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: change the scale of y-axis
global voltage_min;
voltage_min = str2double(get(handles.edit3,'string'));
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
% =========================================================================

% =========================================================================
function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: change the scale of y-axis
global voltage_max;
voltage_max = str2double(get(handles.edit4,'string'));
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
% =========================================================================

% =========================================================================
function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a
%        double

%change the sacle of x-axis
global time_scale;
time_scale = str2double(get(handles.edit5,'string'));

% =========================================================================


% =========================================================================
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: save data
global p;
 val = get(handles.popupmenu1,'value');
 switch val
     case 1     
      if p(1) == 1
         warndlg('通道选择错误','warning');
         return;
      end
      m = textread('data1.txt');
      n = textread('data2.txt');
      csvwrite(strcat('channel_1.csv'),[n;m],0,0);
     case 2
      if p(2) == 1
         warndlg('通道选择错误','warning');
         return;
      end
      m = textread('data3.txt');
      n = textread('data4.txt');    
      csvwrite(strcat('channel_2.csv'),[n;m],0,0);
 end
% =========================================================================

% =========================================================================
% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: show the data near the position you click
global time;
global data_show;
global time1;
global data_show1;

handles = guidata(gcbo);
X=get(gca,'Xlim');
Xmin = X(1);
Xmax = X(2);

Y=get(gca,'Ylim');
Ymin = Y(1);
Ymax = Y(2);

hTX = findobj(gcf, 'tag' , ['TX1']);
hTY = findobj(gcf, 'tag' , ['TY1']);

curpos = get(gca, 'CurrentPoint');
pX = max ([Xmin curpos(1,1)]);
pX = min ([Xmax pX]);
pY = max ([Ymin curpos(1,2)]);
pY = min ([Ymax pY]);
if gca == handles.axes1
   [~,index] = min(abs(time-pX));
   pX = time(index);
   pY = data_show(index);
else 
   [~,index] = min(abs(time1-pX));
   pX = time1(index);
   pY = data_show1(index);
end
set(hTX,'string',pX);
set(hTY,'string',pY);

guidata(gcbo,handles);
% =========================================================================



% =========================================================================
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: open file and show the data
global time_scale;
global voltage_min;
global voltage_max;
global filename;
[filename, pathname] = uigetfile( ...
      {'*.csv'},'Pick a file');
if filename ~= 0
   m = csvread(filename);
   val = get(handles.popupmenu1,'value');
   switch val
     case 1         
       axes(handles.axes1);
       cla
     case 2
       axes(handles.axes5);
       cla          
  end
  len = size(m,2);
  plot(m(1,1:len-1),m(2,1:len-1));
  axis([0 time_scale voltage_min voltage_max])
end
% =========================================================================

% =========================================================================
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: drag the slider to move the axis
global time_scale;
global voltage_min;
global voltage_max;
global filename;
if filename ~= 0
   m = csvread(filename); 
   len = size(m,2);
   k = m(1,len-1) - time_scale;
   axes(handles.axes1);
   cla
   plot(m(1,1:len-1),m(2,1:len-1));
   axis([get(handles.slider1,'value')*k time_scale+get(handles.slider1,'value')*k voltage_min voltage_max]);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% =========================================================================

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% =========================================================================
% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: drag the slider to move the axis
global time_scale;
global voltage_min;
global voltage_max;
global filename;
if filename ~= 0
   m = csvread(filename);
   len = size(m,2);
   k = m(1,len-1) - time_scale;
   axes(handles.axes5);
   plot(m(1,1:len-1),m(2,1:len-1));
   axis([get(handles.slider3,'value')*k time_scale+get(handles.slider3,'value')*k voltage_min voltage_max]);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% =========================================================================

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% =========================================================================
% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Function: template data in memory before exit.
if ~exist('data1.txt','file') == 0 
    delete('data1.txt');
end

if ~exist('data2.txt','file') == 0 
    delete('data2.txt');
end

if ~exist('data3.txt','file') == 0 
    delete('data3.txt');
end

if ~exist('data4.txt','file') == 0 
    delete('data4.txt');
end
% =========================================================================


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

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton3,'value',0);


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
set(handles.radiobutton1,'value',0);

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



% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
