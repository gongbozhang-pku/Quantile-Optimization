function [x]=SA3(alpha,x,d,q,a1,a2,a3,b1,b2,b3,K)
for k=1:K
    R=gprnd(1,1,1,[1,1]);
    RR=log(R-1);
    Z=(2*x-x^2)*RR;
    d=d+b1*(Z<q)*(((2-2*x)*RR*(1-2*exp(RR)/(exp(RR)+1))+2-2*x)/x/(2-x)-d*(1-2*exp(RR)/(exp(RR)+1))/x/(2-x))/k^a1;
    q=q+b2*(alpha-1*(Z<q))/k^a2;
    x=x+b3*d/k^a3;
    if x<0.01
        x=0.01;
    end
    if x>2-0.01
        x=2-0.01;
    end
end
end