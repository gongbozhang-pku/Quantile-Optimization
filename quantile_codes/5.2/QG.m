function [x] = QG(alpha,x,K,b1,b2,b3,c)
for k=1:K
    rho = 1/k^(b1);
    delta = 1/k^(b2);
    n = floor(k^(b3));
    mu=[0 0 0];
    S=[4 -2 -4;-2 5 0;-4 0 6];
    R=mvnrnd(mu,S,n);
    
    Z(1:n)=cos(x(1))^2*R((1:n),1)+cos(x(2))^2*sin(x(1))^2*R((1:n),2)+sin(x(2))^2*sin(x(1))^2*R((1:n),3);
    
    [~,index] = sort(Z);
    RR = R(index(floor(n*alpha)+1),:);
    
    A1 = cos(x(1)+delta)^2*RR(1)+cos(x(2))^2*sin(x(1)+delta)^2*RR(2)+sin(x(2))^2*sin(x(1)+delta)^2*RR(3);
    A2 = cos(x(1)-delta)^2*RR(1)+cos(x(2))^2*sin(x(1)-delta)^2*RR(2)+sin(x(2))^2*sin(x(1)-delta)^2*RR(3);
    
    A3 = cos(x(1))^2*RR(1)+cos(x(2)+delta)^2*sin(x(1))^2*RR(2)+sin(x(2)+delta)^2*sin(x(1))^2*RR(3);
    A4 = cos(x(1))^2*RR(1)+cos(x(2)-delta)^2*sin(x(1))^2*RR(2)+sin(x(2)-delta)^2*sin(x(1))^2*RR(3);
    
    e1=[1,0];
    e2=[0,1];
    
    D = ((A1-A2)*e1'+(A3-A4)*e2')/(2*delta);
    
    x=x + c*rho*D;
    
    if x(1)<0.01
        x(1)=0.01;
    end
    if x(2)<0.01
        x(2)=0.01;
    end
    if x(1)>pi/2-0.01
        x(1)=pi/2-0.01;
    end
    if x(2)>pi/2-0.01
        x(2)=pi/2-0.01;
    end
end
end