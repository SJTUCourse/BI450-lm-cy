% StaticAO.m
%
% Example Category:
%    AO
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Static AO  voltage function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device. 
%    2. Set the 'channelStart' as the first channel for  analog data
%       Output. 
%    3. Set the 'channelCount' to decide how m any sequential channels to
%       output analog data. 
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.

function StaticAO(hObject,handles,wave_type)

% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq');

% Define how many data to makeup a waveform period.
oneWavePointCount = int32(handles.samplescount);  
                                     %一个周期的信号点数

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can set other devices 
% according to their needs. 

% deviceDescription = 'DemoDevice,BID#0';
deviceDescription = 'USB-4704,BID#0';  %设备名称
% channelStart = int32(0);
% channelCount = int32(1);

checktemp1 = get(handles.checkbox1,'value');
checktemp2 = get(handles.checkbox2,'value');
if checktemp1 == 1
  channelStart = int32(0);    %起始通道
else 
   if checktemp2 == 1
       channelStart = int32(1);
   end
end
channelCount = int32(checktemp1 + checktemp2);

% Declare the type of signal. If you want to specify the type of output 
% signal, please change 'style' parameter in the GenerateWaveform function.
parent_id = H5T.copy('H5T_NATIVE_UINT');
WaveStyle = H5T.enum_create(parent_id);
H5T.enum_insert(WaveStyle, 'Sine', 0);    %三种不同的波形
H5T.enum_insert(WaveStyle, 'Sawtooth', 1);
H5T.enum_insert(WaveStyle, 'Square', 2);
H5T.enum_insert(WaveStyle, 'Level', 3);
H5T.enum_insert(WaveStyle, 'Filesignal', 4);
H5T.close(parent_id);

errorCode = Automation.BDaq.ErrorCode.Success;

% Step 1: Create a 'InstantAoCtrl' for Instant AO function.
instantAoCtrl = Automation.BDaq.InstantAoCtrl();

try
    % Step 2: Select a device by device number or device description and 
    % specify the access mode. In this example we use 
    % AccessWriteWithReset(default) mode so that we can fully control the 
    % device, including configuring, sampling, etc.
    instantAoCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    
    % Step 3: Output data. 
    % Generate waveform data.
    scaledWaveForm = NET.createArray('System.Double', channelCount * ...
        oneWavePointCount);                       
    errorCode = GenerateWaveform(instantAoCtrl, channelStart, ...
        channelCount, scaledWaveForm, channelCount * oneWavePointCount, ...
        H5T.enum_nameof(WaveStyle, int32(wave_type - 1)),handles);   
                                          %产生目标信号波形
    if BioFailed(errorCode)    
        throw Exception();
    end

    % Output data
    scaleData = NET.createArray('System.Double', int32(64));
    

    t = timer('TimerFcn',{@TimerCallback, instantAoCtrl, ...
        oneWavePointCount, scaleData, scaledWaveForm, channelStart, ...
        channelCount, handles},'busymode','queue', 'period', handles.timeperpoint , 'executionmode', 'fixedrate', ...
        'StartDelay', 1);                
                                         %设置信号输出时钟
    handles.AOtimer = t;
    guidata(hObject,handles)
    start(t);
%     input('Outputting data...Press Enter key to quit!', 's');
    while isvalid(t)
%      disp('StaticAO is completed compulsorily!');
       pause(1);
%      stop(t);
%      delete(t); 
    end
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

instantAoCtrl.Dispose();
H5T.close(WaveStyle);

end

function errorcode = GenerateWaveform(instantAoCtrl, channelStart,...
    channelCount, waveBuffer, SamplesCount, style, handles)

errorcode = Automation.BDaq.ErrorCode.Success;
chanCountMax = int32(instantAoCtrl.Features.ChannelCountMax);
oneWaveSamplesCount = int32(SamplesCount / channelCount);

description = System.Text.StringBuilder();
unit = Automation.BDaq.ValueUnit;
ranges = NET.createArray('Automation.BDaq.MathInterval', chanCountMax); 

% get every channel's value range ,include external reference voltage
% value range which you should key it in manually.
channels = instantAoCtrl.Channels;
for i = 1:chanCountMax
    channel = channels.Get(i - 1);
    valRange = channel.ValueRange;
    if Automation.BDaq.ValueRange.V_ExternalRefBipolar == valRange ...
            || valRange == Automation.BDaq.ValueRange.V_ExternalRefUnipolar
        if instantAoCtrl.Features.ExternalRefAntiPolar
            if valRange == Automation.BDaq.ValueRange.V_ExternalRefBipolar
                referenceValue = double(...
                    instantAoCtrl.ExtRefValueForBipolar);
                if referenceValue >= 0
                    ranges(i).Max = referenceValue;
                    ranges(i).Min = 0 - referenceValue;
                else
                    ranges(i).Max = 0 - referenceValue;
                    ranges(i).Min = referenceValue;                    
                end
            else
               referenceValue = double(...
                   instantAoCtrl.ExtRefValueForUnipolar); 
               if referenceValue >= 0
                   ranges(i).Max = 0;
                   ranges(i).Min = 0 - referenceValue;
               else
                   ranges(i).Max = 0 - referenceValue;
                   ranges(i).Min = 0;
               end 
            end
        else
            if valRange == Automation.BDaq.ValueRange.V_ExternalRefBipolar
                referenceValue = double(...
                    instantAoCtrl.ExtRefValueForBipolar);
                if referenceValue >= 0
                    ranges(i).Max = referenceValue;
                    ranges(i).Min = 0 - referenceValue;
                else
                    ranges(i).Max = 0 - referenceValue;
                    ranges(i).Min = referenceValue;                    
                end
            else
                referenceValue = double(...
                    instantAoCtrl.ExtRefValueForUnipolar);
                if referenceValue >= 0
                    ranges(i).Max = referenceValue;
                    ranges(i).Min = 0;
                else
                    ranges(i).Max = 0;
                    ranges(i).Min = 0 - referenceValue;
                end
            end
        end
    else     
        [errorcode, ranges(i), unit] = ...
            Automation.BDaq.BDaqApi.AdxGetValueRangeInformation(...
            valRange, int32(0), description);
        if BioFailed(errorcode)
            return
        end
    end
end

% generate waveform data and put them into the buffer which the parameter
% 'waveBuffer' give in, the Amplitude these waveform
for i = 0:(oneWaveSamplesCount - 1)
    for j = channelStart:(channelStart + channelCount - 1)
        % pay attention to channel rollback(when startChannel+
        % channelCount>chanCountMax)
        channel = int32(rem(j, chanCountMax));
        
        amplitude = handles.amplitude;
        offset = handles.offset;
        level = handles.level;
                                   % amplituede = vpp/2;
                                   % offset 为偏置
                                   % 电压输出范围固定为0-5V
       switch style
           case  'Sine'
                waveBuffer.Set(i * channelCount + j - channelStart,...
                    amplitude * sin(double(i) * 2.0 * pi / ...
                    double(oneWaveSamplesCount)) + offset);
            case 'Sawtooth'
                if (i >= 0) && (i < (oneWaveSamplesCount / 4.0))
                    waveBuffer.Set(i * channelCount + j - channelStart,...
                        amplitude * (double(i) / ...
                        (double(oneWaveSamplesCount) / 4.0)) + offset);
                else
                    if (i >= (oneWaveSamplesCount / 4.0)) && ...
                            (i < 3 * (oneWaveSamplesCount / 4.0))
                        waveBuffer.Set(i * channelCount + j - ...
                            channelStart, amplitude * ((2.0 * ...
                            (double(oneWaveSamplesCount) / 4.0) - ...
                            double(i)) / (double(oneWaveSamplesCount) ...
                            / 4.0)) + offset);
                    else
                        waveBuffer.Set(i * channelCount + j - ...
                            channelStart, amplitude * ((double(i) - ...
                            double(oneWaveSamplesCount)) / ...
                            (double(oneWaveSamplesCount) / 4.0)) + offset);
                    end
                end
            case 'Square'
                if (i >= 0) && (i < (oneWaveSamplesCount / 2))
                    waveBuffer.Set(i * channelCount + j - channelStart, ...
                        amplitude * 1.0 + offset);
                else
                     waveBuffer.Set(i * channelCount + j - channelStart,...
                         amplitude * (-1.0) + offset);
                end
           case 'Level'
                waveBuffer.Set(i * channelCount + j - channelStart,...
                    level); 
           case 'Filesignal'
                waveBuffer.Set(i * channelCount + j - channelStart,...
                    handles.filesignal(i+1)); 
        end
    end
end

end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantAoCtrl, oneWavePointCount, ...
    scaleData, scaledWaveForm, channelStart, channelCount, handles)
persistent i ;
persistent counter;
if isempty(i)
    i = 0;
    counter = 0;
else
    i = i + 1;
    counter = counter + 1;
end
j = 0;
if i <= (oneWavePointCount - 1)
    if j <= (channelCount - 1)
        scaleData.Set(j, scaledWaveForm.Get(channelCount * i + j));
%         tic
        errorCode = instantAoCtrl.Write(channelStart,...
            channelCount, scaleData);
%         toc
        if BioFailed(errorCode)
            e = MException('DAQWarning:Notcompleted', ...
                'StaticAO is completed compulsorily!');
            throw (e);
        end
    end
else
     if get(handles.checkbox3,'value') == 1
       if counter == handles.pointnumber
         fprintf('\nStaticAO is completed, and press Enter key to quit!');
         clear functions;
         stop(obj);
         delete(obj);
       end
     end
     i = 0;
end

end
 



















