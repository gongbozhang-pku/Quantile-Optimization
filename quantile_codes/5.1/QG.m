function [x] = QG(alpha,x,K,b1,b2,b3,c)
for k=1:K
    rho = 1/k^(b1);
    delta = 1/k^(b2);
    n = floor(k^(b3));
    R=gprnd(1,2,2,[1,n]);
    %R=normrnd(0,1);
    Z= (2*x-x^2)*R;
    [~,index] = sort(Z);
    RR = R(index(floor(n*alpha)+1));
    A1 = (2*(x+delta)-(x+delta)^2)*RR;
    A2 = (2*(x-delta)-(x-delta)^2)*RR;
    D = (A1-A2)/(2*delta);
    x = x + c*rho*D;
    if x<0.01
        x=0.01;
    end
    if x>2-0.01
        x=2-0.01;
    end 
end
end