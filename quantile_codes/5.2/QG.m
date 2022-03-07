function [Y] = QG(alpha,x,K,b1,b2,b3,cc,p,c)
Y=zeros(1,K);
for k=1:K
    Y(:,k)=x;
    rho = 1/k^(b1);
    delta = 1/k^(b2);
    n = floor(k^(b3));
    R=gprnd(2,2,1,[1,n]);
    Z=p*min(x,R)-c*x;
    [~,index] = sort(Z);
    RR = R(index(floor(n*alpha)+1));
    A1 = p*min((x+delta),RR)-c*(x+delta);
    A2 = p*min((x-delta),RR)-c*(x-delta);
    D = (A1-A2)/(2*delta);
    x = x + cc*rho*D;
    if x < 400
        x = 400;
    end
    if x > 800
        x = 800;
    end
end
end