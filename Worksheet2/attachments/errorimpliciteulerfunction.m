function [ t,yapprox ] = errorimpliciteulerfunction( functionfstring,initvalue,stepsize,endtime)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

 for i = 1:length(stepsize) 

   yy=initvalue;
   tt=0;

   t = 0;
   yapprox = initvalue;
   syms y;

   while tt <= endtime
    
      tt=tt+stepsize(i);
      a=(stepsize(i))*0.7;
      b=1-7*stepsize(i);
      c=-yy;
      if (b^2 - 4*a*c)>=0
         m=1;
      else
         m=0;disp(stepsize(i)),disp('  what the fish !!')
         break
      end
      x1=yy;
      x2=x1+1; 
    
      newtoncheck=0;
    
      while abs((x2-x1))>10^(-4)
        symofgofx1 = sym(y) - sym(yy) - sym(stepsize(i))*sym(functionfstring);
        gofx1 = inline(char(symofgofx1));
        gdashofx1 = inline(char(diff(symofgofx1)));
        x2=x1-(gofx1(x1))/(gdashofx1(x1));
        x1=x2;
        newtoncheck=newtoncheck+1;
        if newtoncheck>1000
          disp('newtoncheck became greater than 1000 when stepsize is  '),disp(stepsize(i))
          break
        end
      end
      if newtoncheck>1000
          break
      end
      
      yy=x2;
      t=[t, tt];
      yapprox=[yapprox, yy];
   
   end
   %plot(t,yapprox);
   %hold all
   if m~=0
      errorfunctionnonlinear( yapprox,initvalue,'200./(20.-10.*exp(-7 .* t))',stepsize(i),t);
   end
 end
 
 %ana( '200./(20-10.*exp(-7.*t))' , 1/32 , endtime )
 %axis([0 5 0 20])
 %legend('1/2','1/4','1/8','1/16','1/32','ana');
end
 

