function errorfunctionnonlinear( yapprox,initvalue,analsolu,stepsize,t)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

yexact=initvalue;
func=inline(analsolu);
for i = 2:length(t)
    yy=func(t(i)); 
    yexact=[yexact, yy];
end
squares=(yexact - yapprox).^2;
sumofsquares=sum(squares,2);
root=sqrt(sumofsquares);
E=sqrt(stepsize/5) .* root;

disp('error for stepsize '),disp(stepsize),disp('is'),disp(E)

end
