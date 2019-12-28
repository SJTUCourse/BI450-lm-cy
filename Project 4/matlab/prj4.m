function varargout = prj4(varargin)
% PRJ4 M-file for prj4.fig
%      PRJ4, by itself, creates a new PRJ4 or raises the existing
%      singleton*.
%
%      H = PRJ4 returns the handle to a new PRJ4 or the handle to
%      the existing singleton*.
%
%      PRJ4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRJ4.M with the given input arguments.
%
%      PRJ4('Property','Value',...) creates a new PRJ4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prj4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prj4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prj4

% Last Modified by GUIDE v2.5 19-Dec-2019 14:52:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prj4_OpeningFcn, ...
                   'gui_OutputFcn',  @prj4_OutputFcn, ...
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


% --- Executes just before prj4 is made visible.
function prj4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prj4 (see VARARGIN)

% Choose default command line output for prj4
% stage(1) = instantAI_viewer_v1;
% stage(2) = Static_AO;
% stage(3) = DO_DI;
% set(stage(1),'visible','off');
% set(stage(2),'visible','off');
% set(stage(3),'visible','off');
% assignin('base','stage',stage);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prj4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prj4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = gcf;
instantAI_viewer_v1;
close(h);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = gcf;
Static_AO;
close(h);
 

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = gcf;
DO_DI;
close(h);
