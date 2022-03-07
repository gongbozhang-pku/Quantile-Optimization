function [x] = signum(alpha,x,K,c)
R = gprnd(1,2,2,[1,10]);
%R=normrnd(0,1);
RR = log(R-2);
Z = (2*x-x^2)*RR;
[B,~] = sort(Z);
Bb = B(floor(10*0.75)+1);
Bs = B(floor(10*0.25)+1);
sigma = (Bb-Bs)/2;
for k=1:K
    RR = gprnd(1,2,2,[1,1]);
    %R=normrnd(0,1);
    R = log(RR-2);
    if (2-2*x)*R < 0
        if x > 0 && x <=1
            x = x - c*(-alpha)*sigma/k;
        elseif x > 1 && x <2
            x = x - c*(alpha - 1)*sigma/k;
        end
    end
    
    if (2-2*x)*R > 0
        if x > 0 && x <=1
            x = x - c*(1-alpha)*sigma/k;
        elseif x > 1 && x <2
            x = x - c*alpha*sigma/k;
        end
    end
    
    if x<0.01
        x=0.01;
    end
    if x>2-0.01
        x=2-0.01;
    end
end
end