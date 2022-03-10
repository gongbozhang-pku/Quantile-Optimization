function [Y] = signum(alpha,x,K,cc,p,c)
Y = zeros(1,K);
R = gprnd(1,1,1,[1,10]);
Z = p*min(x,R) - c*x; 
[B,~] = sort(Z);
Bb = B(floor(10*0.75)+1);
Bs = B(floor(10*0.25)+1);
sigma = (Bb-Bs)/2;
for k=1:K
    Y(:,k)=x;
    R  = gprnd(1,1,1,[1,1]);
    if x <= R
        x = x + cc*(alpha)*sigma/k;
    else
        x = x - cc*(1 - alpha)*sigma/k;
    end    
    if x < 20
        x = 20;
    end
    if x > 80
        x = 80;
    end
end
end
