function errorheun( functionfstring,initvalue,stepsize,endtime )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(stepsize) 

  tt=0;
  yy=initvalue;

  t = 0;
  y = initvalue;

  functionf = inline(functionfstring);
  while tt <= endtime
    
    tt=tt+stepsize(i);
    yy=yy + (stepsize(i)/2)*(functionf(yy) + functionf(yy +  stepsize(i)*functionf(yy)));
    
    t = [t, tt];
    y=[y, yy];
    
  end
  errorfunctionnonlinear( y,initvalue,'200./(20.-10.*exp(-7 .* t))',stepsize(i),t);
 
         
end



end







