function [t, yapprox ] = erroradamslinear2function(initvalue,stepsize,endtime)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(stepsize) 

   yy=initvalue;
   tt=0;

   t = 0;
   yapprox = initvalue;
   %syms y;

   %functionf = inline(functionfstring);
   while tt <= endtime
    
       tt=tt+stepsize(i);
       yy=(yy+(stepsize(i)/2)*7*yy-(stepsize(i)/2)*7*(yy/10)*yy)/(1-(stepsize(i)/2)*7+7*(stepsize(i)/2)*yy/10);
    
       t=[t, tt];
       yapprox=[yapprox, yy];
   
   end
   %plot(t,yapprox);
   %hold all
   errorfunction( yapprox,initvalue,endtime,'200./(20.-10.*exp(-7 .* t))',stepsize(i));
   
end

%ana( '200./(20.-10.*exp(-7 .* t))' , 1/32 , endtime )
%axis([0 5 0 20])
%legend('1/2','1/4','1/8','1/16','1/32','ana');
end



