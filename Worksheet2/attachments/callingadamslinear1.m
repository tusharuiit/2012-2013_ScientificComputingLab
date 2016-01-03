%functionfstring = input('f in terms of y = ', 's');

initvalue = 20;
stepsize = [1/2 1/4 1/8 1/16 1/32];
endtime=5;

[t, y]=adamslinear1function(initvalue,stepsize,endtime);
