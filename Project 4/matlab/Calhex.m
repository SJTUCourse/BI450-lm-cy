function Calhex(handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   s = 0;
   for i = 1 : 8
       s = s + handles.btval(i)*2^(i-1);
   end
   set(handles.edit1,'string',dec2hex(s,2));
end

