%functionfstring = input('f in terms of y = ', 's');
functionfstring = '7*(1-(y/10))*y';
initvalue = 20;
stepsize = [1/2 1/4 1/8 1/16 1/32];
endtime=5;

impliciteulerfunction(functionfstring,initvalue,stepsize,endtime);
