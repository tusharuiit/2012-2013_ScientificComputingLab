function expliciteuler(functionfstring,initvalue,stepsize,endtime)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(stepsize) 

  yy=initvalue;
  tt=0;

  t = 0;
  y = initvalue;


  functionf = inline(functionfstring);
  while tt <= endtime
    
    tt=tt+stepsize(i);
    yy=yy+stepsize(i)*functionf(yy);
        
    t=[t, tt];
    y=[y, yy];
   
  end
  plot(t,y);
  hold all

end
ana( '200./(20.-10.*exp(-7 .* t))' , stepsize(i) , endtime )
axis([0 5 0 20])
legend('1/2','1/4','1/8','1/16','1/32','ana');
 
end

