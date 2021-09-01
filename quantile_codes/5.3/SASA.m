function [theta] = SASA(alpha,theta,a1,a2,a3,b1,b2,b3,K)
for k=1:K
    mu=[0.0000629049,0.0001954468];
    sigma=[0.0054936565,0.0020876563];
    rho=0.1571739487;
    W=normrnd(0,1,[1,2]);
    
    N1=random('Poisson',0.9958774681);
    N2=random('Poisson',0.9992393287);
    
    J(1)=sum(exprnd(1/100000.1508591310,1,N1));
    J(2)=sum(exprnd(1/100000.0005405420,1,N2));
    
    R(1)=mu(1)+sigma(1)*W(1)+sigma(1)*sqrt(rho)*W(2)+J(1);
    R(2)=mu(2)+sigma(2)*W(2)+sigma(2)*sqrt(rho)*W(1)+J(2);
    
    Z = cos(theta)^2*R(1) + sin(theta)^2*R(2);
    
    A = -sin(2*(theta))*R(1)+sin(2*(theta))*R(2);
    
    B= -sin(2*(theta))*sigma(1)+sigma(2)*sqrt(rho)*sin(2*(theta));
    %B=-sin(2*(theta))*sigma(1)*sqrt(rho)+sin(2*(theta))*sigma(2);
    
    G1=(Z<q)/(cos(theta)^2*sigma(1)+sigma(2)*sqrt(rho)* sin(theta)^2)*(A*(-W(1))+B);
    % G1=(Z<q)/(cos(theta)^2*sigma(1)*sqrt(rho)+sigma(2)*sin(theta)^2)*(A*(-W(2))+B);
    
    G2=(Z<q)/(cos(theta)^2*sigma(1)+sigma(2)*sqrt(rho)* sin(theta)^2)*(-W(1));
    %G2=(Z<q)/(cos(theta)^2*sigma(1)*sqrt(rho)+sigma(2)*sin(theta)^2)*(-W(2));
    
    D=D+b1*(G1-G2*D)/k^a1;
    
    q=q+b2*(alpha-1*(Z<q))/k^a2;
    
    theta=theta+b3*D/k^a3;
    
    if theta<0.01
        theta=0.01;
    end
    if theta>pi/2-0.01
        theta=pi/2-0.01;
    end
end
end