function varargout = Nastya(varargin)
% NASTYA MATLAB code for Nastya.fig
%      NASTYA, by itself, creates a new NASTYA or raises the existing
%      singleton*.
%
%      H = NASTYA returns the handle to a new NASTYA or the handle to
%      the existing singleton*.
%
%      NASTYA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NASTYA.M with the given input arguments.
%
%      NASTYA('Property','Value',...) creates a new NASTYA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Nastya_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Nastya_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Nastya

% Last Modified by GUIDE v2.5 27-Nov-2017 21:49:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Nastya_OpeningFcn, ...
                   'gui_OutputFcn',  @Nastya_OutputFcn, ...
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


% --- Executes just before Nastya is made visible.
function Nastya_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Nastya (see VARARGIN)

% Choose default command line output for Nastya
handles.output = hObject;

ShowTab(handles,1);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Nastya wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Nastya_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



 function ShowTab(handles, tab)
         switch tab
             case 1
                 set(handles.tab1, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.tab2, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab3, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.uipanel3, 'Visible', 'On');
                 set(handles.uipanel4, 'Visible', 'Off');
                 set(handles.uipanel5, 'Visible', 'Off');
             case 2
                 set(handles.tab1, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab2, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.tab3, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.uipanel3, 'Visible', 'Off');
                 set(handles.uipanel4, 'Visible', 'On');
                 set(handles.uipanel5, 'Visible', 'Off');

             case 3
                 set(handles.tab1, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab2, 'BackgroundColor', [0.94,0.94,0.94]);
                 set(handles.tab3, 'BackgroundColor', [0.3,0.75,0.93]);
                 set(handles.uipanel3, 'Visible', 'Off');
                 set(handles.uipanel4, 'Visible', 'Off');
                 set(handles.uipanel5, 'Visible', 'On');
         end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fd=500;
T=1/Fd;
f1=7;
f2=20;
f3= 14;
t=0:T:5;
A1=8;
A2=3;
A3=4;
AN1=20;
AN2=1;
AN3=4;
AN4=25;

fc = 40;
fs = 500;

[b,a] = butter(6,fc/(fs/2));


noise1 = AN1*randn(1, length(t));
noise1 = filter(b,a,noise1);

x1 = A1*sin(2*pi*f1*t)+A2*sin(2*pi*f2*t)+A3*sin(2*pi*f3*t)+noise1;
axes(handles.axes1);
plot(t,x1);
title('EEG before anestezia')
xlabel('Time, s')
ylabel('Amp, mV')

noise2 = AN2*randn(1, length(t));
noise2 = filter(b,a,noise2);
x2 = A1*sin(2*pi*f1*t)+A2*sin(2*pi*f2*t)+A3*sin(2*pi*f3*t)+noise2;
axes(handles.axes2);
plot(t,x2);
title('Deep anestezia')
xlabel('Time, s')
ylabel('Amp, mV')


noise3 = AN3*randn(1, length(t));
noise3 = filter(b,a,noise3);
x3 = A1*sin(2*pi*f1*t)+A2*sin(2*pi*f2*t)+A3*sin(2*pi*f3*t)+noise3;
axes(handles.axes3);
plot(t,x3);
title('While operation')
xlabel('Time, s')
ylabel('Amp, mV')


noise4 = AN4*randn(1, length(t));
noise4 = filter(b,a,noise4);
x4 = A1*sin(2*pi*f1*t)+A2*sin(2*pi*f2*t)+A3*sin(2*pi*f3*t)+noise4;
axes(handles.axes4);
plot(t,x4);
title('After operation, awake')
xlabel('Time, s')
ylabel('Amp, mV')

axes(handles.axes5)
[fx1,px1]=PlotSp(x1, Fd);
title('EEG before anestezia')
xlabel('F, Hz')
ylabel('SPM, mV^2/Hz')
E1=Entropy(px1,fx1);
S1=SEF95(px1,fx1);
txt11=['E1 = ', num2str(E1), ' %'];
txt12=['SEF95 = ', num2str(S1),' Hz'];
set(handles.text4, 'String', txt11);
set(handles.text5, 'String', txt12);

axes(handles.axes6)
[fx2,px2]=PlotSp(x2, Fd);
title('Deep anestezia')
xlabel('F, Hz')
ylabel('SPM, mV^2/Hz')

E2=Entropy(px2,fx2);
S2=SEF95(px2,fx2);
txt11=['E1 = ', num2str(E2), ' %'];
txt12=['SEF95 = ', num2str(S2),' Hz'];
set(handles.text2, 'String', txt11);
set(handles.text3, 'String', txt12);


axes(handles.axes7)
[fx3,px3]=PlotSp(x3, Fd);
title('While operation')
xlabel('F, Hz')
ylabel('SPM, mV^2/Hz')
E3=Entropy(px3,fx3);
S3=SEF95(px3,fx3);
txt11=['E1 = ', num2str(E3), ' %'];
txt12=['SEF95 = ', num2str(S3),' Hz'];
set(handles.text6, 'String', txt11);
set(handles.text7, 'String', txt12);

axes(handles.axes8)
[fx4,px4]=PlotSp(x4, Fd);
title('After operation, awake')
xlabel('F, Hz')
ylabel('SPM, mV^2/Hz')
E4=Entropy(px4,fx4);
S4=SEF95(px4,fx4);
txt11=['E1 = ', num2str(E4), ' %'];
txt12=['SEF95 = ', num2str(S4),' Hz'];
set(handles.text8, 'String', txt11);
set(handles.text9, 'String', txt12);

% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in tab1.
function tab1_Callback(hObject, eventdata, handles)
% hObject    handle to tab1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 1);


% --- Executes on button press in tab2.
function tab2_Callback(hObject, eventdata, handles)
% hObject    handle to tab2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 2);


% --- Executes on button press in tab3.
function tab3_Callback(hObject, eventdata, handles)
% hObject    handle to tab3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowTab(handles, 3);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SavePNG();
