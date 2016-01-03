functionfstring = '7*(1-(y/10))*y';

initvalue = 20;
stepsize = [1/2 1/4 1/8 1/16 1/32];
endtime=5;

%erroradamslinear2function(initvalue,stepsize,endtime);
%erroradamslinear1function(initvalue,stepsize,endtime);
%erroradamsmoultonfunction(functionfstring,initvalue,stepsize,endtime);
%errorimpliciteulerfunction(functionfstring,initvalue,stepsize,endtime);
%errorexpliciteuler(functionfstring,initvalue,stepsize,endtime);
%errorheun(functionfstring,initvalue,stepsize,endtime);