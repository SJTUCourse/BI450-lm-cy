
function TimerCallback_v1(obj, event, instantAiCtrl, startChannel, ...
    channelCount, data, handles, f, limit)

%Function: set timer
global temp;
global temp2;
global p;
global q;
global data_show;
global graph_show;
global time;
global time1;
global data_show1;
global graph_show1;
global voltage_min;
global voltage_max;
global time_scale;
global t;

errorCode = instantAiCtrl.Read(startChannel, channelCount, data); 
if BioFailed(errorCode)
    throw Exception();
end

%sample_frequency = handles.sample_frequency;
ins = get(t,'instantperiod');

for j = 0 :(channelCount - 1)
    switch j
       case 0
         if (get(handles.checkbox1,'value') == 1)   
             axes(handles.axes1);            
             if p(1)~= 1 
                time(1,p(1)) = time(1,p(1)-1) + ins;
             end
             %store the data from cache to memory 
             if q(1) > 100
                fp = fopen('data1.txt','a');
                fprintf(fp,'%d ',temp(1,1:100));
                fclose(fp);
                fp = fopen('data2.txt','a');
                fprintf(fp,'%d ',temp(2,1:100));
                fclose(fp);
                q(1) = 1;
             end
                
             temp(1,q(1)) = data.Get(0);
             temp(2,q(1)) = time(p(1));
             %draw
             if (p(1) <= limit)
                data_show(1,p(1)) = data.Get(j);
                set(graph_show,'XData',time(1,1:p(1)),'YData',data_show(1,1:p(1)))
                if time(1,p(1)) >= time_scale 
                   axis([time(1,p(1))-time_scale time(1,p(1)) voltage_min voltage_max]);
                else
                   axis([0 time_scale voltage_min voltage_max]) 
                end
             else              
                data_show(1,p(1)) = data.Get(j);
                data_show(1,1:p(1)-1) = data_show(1,2:p(1));
                time(1,1:p(1)-1) = time(1,2:p(1));
                p(1) = p(1) - 1;
                set(graph_show,'XData',time(1,:),'YData',data_show(1,:));
                drawnow
                axis([time(1,p(1))-time_scale time(1,p(1)) voltage_min voltage_max]);
              end
              p(1) = p(1) + 1;
              q(1) = q(1) + 1;
         end

       case 1
         if (get(handles.checkbox3,'value') == 1)
             axes(handles.axes5);
             if p(2)~= 1 
                time1(1,p(2)) = time1(1,p(2)-1) + ins;
             end
             if q(2) > 100
                fp = fopen('data3.txt','a');
                fprintf(fp,'%d ',temp2(1,1:100));
                fclose(fp);
                fp = fopen('data4.txt','a');
                fprintf(fp,'%d ',temp2(2,1:100));
                fclose(fp);
                q(2) = 1;
             end
                
             temp2(1,q(2)) = data.Get(1);
             temp2(2,q(2)) = time1(p(2));
                
             if (p(2) <= limit)
                data_show1(1,p(2)) = data.Get(j);
                set(graph_show1,'XData',time1(1,1:p(2)),'YData',data_show1(1,1:p(2)))
                     
                if time1(1,p(2)) >= time_scale 
                   axis([time1(1,p(2))-time_scale time1(1,p(2)) voltage_min voltage_max]);
                else
                   axis([0 time_scale voltage_min voltage_max]) 
                end
              else              
                 data_show1(1,p(2)) = data.Get(j);
                 data_show1(1,1:p(2)-1) = data_show1(1,2:p(2));
                 time1(1,1:p(2)-1) = time1(1,2:p(2));
                 p(2) = p(2) - 1;
                 set(graph_show1,'XData',time1(1,:),'YData',data_show1(1,:));
                 axis([time1(1,p(2))-time_scale time(1,p(2)) voltage_min voltage_max]);
              end
                 p(2) = p(2) + 1;
                 q(2) = q(2) + 1;
         end
    end
  end
end