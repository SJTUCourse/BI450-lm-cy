
function TimerCallback_v1(obj, event, instantAiCtrl, startChannel, ...
    channelCount, data, handles,f)

global temp;
global temp2;
global p;
global data_show;
global graph_show;
global time;
global time1;
global data_show1;
global graph_show1;
global sample_enabled;
global sample_enabled1;
global voltage_min;
global voltage_max;
global time_scale;

errorCode = instantAiCtrl.Read(startChannel, channelCount, data); 
if BioFailed(errorCode)
    throw Exception();
end
% fprintf('\n');


for j = 0 :(channelCount - 1)
%      fprintf('channel %d : %5f ', j, data.Get(j));
       switch j
           case 0
            if (get(handles.checkbox1,'value') == 1)   
                 axes(handles.axes1);
                 temp(1,p(j+1))=data.Get(j);
                 time(j+1,p(j+1)) = f*p(j+1);
                 data_show(j+1,p(j+1)) = data.Get(j);
                 set(graph_show,'XData',time(j+1,:),'YData',data_show(j+1,:))
%      drawnow
                if get(handles.radiobutton4,'Value') == 1
                 if (f*p(j+1)<500*f) 
                   axis([0 500*f voltage_min voltage_max]) 
                 else
                   axis([f*p(j+1)-500*f f*p(j+1) voltage_min voltage_max]);
                 end
                else 
                 if (f*p(j+1)<time_scale) 
                  axis([0 time_scale voltage_min voltage_max]) 
                 else
                     axis([f*p(j+1)-time_scale f*p(j+1) voltage_min voltage_max]);
                 end
                end
                  p(j+1) = p(j+1) + 1;
            end

           case 1
             if (get(handles.checkbox3,'value') == 1)
               axes(handles.axes5);
               temp2(1,p(j+1))=data.Get(j);
               time1(1,p(j+1)) = f*p(j+1);
               data_show1(1,p(j+1)) = data.Get(j);
     set(graph_show1,'XData',time1(1,:),'YData',data_show1(1,:))
%      drawnow
% --------------------------------------------------------
     if get(handles.radiobutton4,'Value')==1
      if (f*p(j+1)<500*f) 
         axis([0 500*f voltage_min voltage_max]) 
      else
         axis([f*p(j+1)-500*f f*p(j+1) voltage_min voltage_max]);
      end
     else 
      if (f*p(j+1)<time_scale) 
         axis([0 time_scale voltage_min voltage_max]) 
      else
         axis([f*p(j+1)-time_scale f*p(j+1) voltage_min voltage_max]);
      end
     end
% --------------------------------------------------------
         p(j+1) = p(j+1) + 1;       
       end
   end
end
end