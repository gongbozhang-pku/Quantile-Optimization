K=10000;
rho=0.1571739487;
T1=0;
T2=0;
for k=1:K
    W=normrnd(0,1,[2,962]);

    N1=random('Poisson',0.9958774681,1,962);
    N2=random('Poisson',0.9992393287,1,962);
    
    for i=1:962
        J1(i)=sum(exprnd(1/100000.1508591310,1,N1(i)));
    end
    
    for i=1:962
        J2(i)=sum(exprnd(1/100000.0005405420,1,N2(i)));
    end
    
    r1=0.0000629049+0.0054936565*W(1,:)+0.0054936565*sqrt(rho)*W(2,:)+J1;
    
    r2=0.0001954468+0.0020876563*sqrt(rho)*W(1,:)+0.0020876563*W(2,:)+J2;
    
    RSS1=sum((readata(2,:)-r1).^2);
    RSS2=sum((readata(1,:)-r2).^2);
    
    BIC1=962*log(RSS1/963)+5*log(962);
    BIC2=962*log(RSS2/963)+5*log(962);
    
    T1=T1+BIC1/K;
    T2=T2+BIC2/K;
end