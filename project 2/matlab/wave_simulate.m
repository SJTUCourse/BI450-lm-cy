function wave_data = wave_simulate(wave_type,amplitude,offset,level,oneWaveSamplesCount)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes her

wave_data = zeros(1,oneWaveSamplesCount);
for i = 0:(oneWaveSamplesCount - 1)
        % pay attention to channel rollback(when startChannel+
        % channelCount>chanCountMax)
                                   % amplituede = vpp/2;
                                   % offset 为偏置
                                   % 电压输出范围固定为0-5V
       switch wave_type
           case  1
                wave_data(i+1) = ...
                    amplitude * sin(double(i) * 2.0 * pi / ...
                    double(oneWaveSamplesCount)) + offset;
            case 2
                if (i >= 0) && (i < (oneWaveSamplesCount / 4.0))
                    wave_data(i+1) = ...
                        amplitude * (double(i) / ...
                        (double(oneWaveSamplesCount) / 4.0)) + offset;
                else
                    if (i >= (oneWaveSamplesCount / 4.0)) && ...
                            (i < 3 * (oneWaveSamplesCount / 4.0))
                        wave_data(i+1)= amplitude * ((2.0 * ...
                            (double(oneWaveSamplesCount) / 4.0) - ...
                            double(i)) / (double(oneWaveSamplesCount) ...
                            / 4.0)) + offset;
                    else
                        wave_data(i+1) = ...
                         amplitude * ((double(i) - ...
                            double(oneWaveSamplesCount)) / ...
                            (double(oneWaveSamplesCount) / 4.0)) + offset;
                    end
                end
            case 3
                if (i >= 0) && (i < (oneWaveSamplesCount / 2))
                    wave_data(i+1) = ...
                        amplitude * 1.0 + offset;
                else
                    wave_data(i+1) = ...
                        amplitude * (-1.0) + offset;
                end
           case 4
                wave_data(i+1) = level;
       end
       if wave_data(i+1) > 5
           wave_data(i+1) = 5;
       else
           if wave_data(i+1) < 0
               wave_data(i+1) = 0;
           end
       end
end

end

