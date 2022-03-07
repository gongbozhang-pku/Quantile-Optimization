function [x] = QG3(alpha,x,K,b1,b2,b3,c)
for k=1:K
    rho = 1/(k^(b1));
    delta = 1/(k^(b2));
    n = floor(k^(b3));
    mu=zeros(2,n);
    mu(1,:)=1;
    mu(2,:)=2;
    sigma=[2,2.25];
    rhoo=0.1;
    R=zeros(2,n);
    R(1,:)=normrnd(0,1,1,n);
    R(2,:)=normrnd(0,1,1,n);
    
    J=zeros(2,n);
    J(1,:)=random('Poisson',1,1,n);
    J(2,:)=random('Poisson',1,1,n);
    
    W=zeros(2,n);
    W(1,:)=mu(1,:)+sigma(1).*R(1,:)+sigma(1).*sqrt(rhoo).*R(2,:)+J(1,:);
    W(2,:)=mu(2,:)+sigma(2).*R(2,:)+sigma(2).*sqrt(rhoo).*R(1,:)+J(2,:);
    
    Z(1:n) = cos(x)^2.*W(1,:) + sin(x)^2.*W(2,:);
    
    [~,index] = sort(Z);
    RR = R(:,index(floor(n*alpha)+1));
    JJ = J(:,index(floor(n*alpha)+1));
    
    A1 = cos(x+delta)^2*(mu(1)+sigma(1)*RR(1)+sigma(1)*sqrt(rhoo)*RR(2)+JJ(1)) + sin(x+delta)^2*(mu(2)+sigma(2)*RR(2)+sigma(2)*sqrt(rhoo)*RR(1)+JJ(2));
    A2 = cos(x-delta)^2*(mu(1)+sigma(1)*RR(1)+sigma(1)*sqrt(rhoo)*RR(2)+JJ(1)) + sin(x-delta)^2*(mu(2)+sigma(2)*RR(2)+sigma(2)*sqrt(rhoo)*RR(1)+JJ(2));
    
    D = (A1-A2)/(2*delta);
    
    x = x + c*rho*D;
    
    if x<0.01
        x=0.01;
    end
    if x>pi/2-0.01
        x=pi/2-0.01;
    end
end
end