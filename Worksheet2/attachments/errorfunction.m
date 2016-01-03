function errorfunction( yapprox,initvalue,endtime,analsolu,stepsize)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
tt=0;
t = 0;
yexact=initvalue;
func=inline(analsolu);
while tt <= endtime
    tt=tt+stepsize;
    yy=func(tt); 
    
    t=[t, tt];
    yexact=[yexact, yy];
end
squares=(yexact - yapprox).^2;
sumofsquares=sum(squares,2);
root=sqrt(sumofsquares);
E=sqrt(stepsize/5) .* root;

disp('error for stepsize '),disp(stepsize),disp('is'),disp(E)

end

