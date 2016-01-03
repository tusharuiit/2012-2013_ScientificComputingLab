function [y]=ana( functionfstring , stepsize , endtime )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

t = 0:stepsize:endtime;
functionf = inline(functionfstring);
y=functionf(t);
    
plot(t,y);
hold all
         


end

