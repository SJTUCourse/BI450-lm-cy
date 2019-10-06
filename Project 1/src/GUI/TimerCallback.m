
function TimerCallback(obj, event, instantAiCtrl, startChannel, ...
    channelCount, data, handles,f)

global temp;
global p;
global data_show;
global graph_show;
global time;
global sample_enabled;
global voltage_min;
global voltage_max;
global time_scale;

errorCode = instantAiCtrl.Read(startChannel, channelCount, data); 
if BioFailed(errorCode)
    throw Exception();
end
% fprintf('\n');

axes(handles.axes1);
for j = 0 :(channelCount - 1)
%      fprintf('channel %d : %5f ', j, data.Get(j));
   if (sample_enabled)
     temp(1,p)=data.Get(j);
     time = [time f*p];
     data_show = [data_show data.Get(j)];
     set(graph_show,'XData',time,'YData',data_show)
     drawnow
     if get(handles.radiobutton4,'Value')==1
      if (f*p<500*f) 
         axis([0 500*f voltage_min voltage_max]) 
      else
         axis([f*p-500*f f*p voltage_min voltage_max]);
      end
     else 
      if (f*p<time_scale) 
         axis([0 time_scale voltage_min voltage_max]) 
      else
         axis([f*p-time_scale f*p voltage_min voltage_max]);
      end
     end
     p = p + 1; 
%      pause(0.01);
end
end