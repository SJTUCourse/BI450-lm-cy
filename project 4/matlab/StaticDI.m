% StaticDI.m
%
% Example Category:
%    DIO
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Static DI function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device. 
%    2. Set the 'startPort' as the first port for Di scanning.
%    3. Set the 'portCount' to decide how many sequential ports to 
%       operate Di scanning.
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.

function StaticDI(handles,hObject)

% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq4');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other 
% devices according to their needs. 
deviceDescription = 'USB-4704,BID#0';
startPort = int32(0);
portCount = int32(1);
errorCode = Automation.BDaq.ErrorCode.Success;

% Step 1: Create a 'InstantDiCtrl' for DI function.
instantDiCtrl = Automation.BDaq.InstantDiCtrl();

try
    % Step 2: Select a device by device number or device description and 
    % specify the access mode. In this example we use 
    % AccessWriteWithReset(default) mode so that we can fully control the 
    % device, including configuring, sampling, etc.
    instantDiCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    
    % Step 3: read DI ports' status and show.
    buffer = NET.createArray('System.Byte', int32(64));
    DI_timer = timer('TimerFcn', {@TimerCallback, instantDiCtrl, startPort, ...
        portCount, buffer, handles}, 'period', 1, 'executionmode', 'fixedrate', ...
        'StartDelay', 1);
    handles.DI_timer = DI_timer;
    guidata(hObject,handles);
    start(DI_timer);
    while isvalid(DI_timer)
        pause(1);
    end 
%     fprintf('Reading ports'' status is in progress...');
%     input('Press Enter key to quit!', 's');    
%     stop(t);
%     delete(t);
catch e
    % Something is wrong. 
    if BioFailed(errorCode)    
        errStr = 'Some error occurred. And the last error code is ' ... 
            + errorCode.ToString();
    else
        errStr = e.message;
    end
    disp(errStr);
end   

% Step 4: Close device and release any allocated resource.
instantDiCtrl.Dispose();

end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantDiCtrl, startPort, ...
    portCount, buffer, handles)

errorCode = instantDiCtrl.Read(startPort, portCount, buffer); 
if BioFailed(errorCode)
    throw Exception();
end
for i=0:(portCount - 1)
%     fprintf('\nDI port %d status : 0x%X', startPort + i, ...
%         buffer.Get(i));
    portstr = dec2bin(buffer.Get(i),8);
    DI_switch = bin2dec(portstr(1));
    DI_amp = bin2dec(portstr(2:3));
    DI_fre = bin2dec(portstr(4:8));
    disp([DI_switch DI_amp DI_fre]);
    DI_t = 0:.001:1;
    if DI_switch
       axes(handles.axes1);
       cla
       plot(DI_t,DI_amp * square(2*pi*DI_fre*DI_t));
    else
       axes(handles.axes1);
       cla
    end
end

end






















