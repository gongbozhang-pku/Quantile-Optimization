function [Y]=SA3(alpha,x,d,q,a1,a2,a3,b1,b2,b3,K,p,c)
Y=zeros(1,K);
for k=1:K
    Y(k) = x;
    R=gprnd(1,1,1,[1,1]);
    RR=log(R-1);
    Z=p*min(x,RR) - c*x;
    d=d+b1*(((p-c)*x)>q)*(q >= (p*RR-c*x))/p*(1-2/3*exp(RR)/(exp(RR)+1))*(-c-d)/k^a1;
    q=q+b2*(alpha-1*(Z<q))/k^a2;
    x=x+b3*d/k^a3;
    if q< - 10^10
        q = - 10^10 ;
    elseif q > 10^10
        q = 10^10;
    end
    
    if x < 20
        x = 20;
    elseif x > 80
        x = 80;
    end
end
end
