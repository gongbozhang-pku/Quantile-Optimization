function [theta]=SASA11(alpha,theta,D,q,a1,a2,a3,b1,b2,b3,K)
for k=1:K
    mu=[0 0 0];
    S=[4 -2 -4;-2 5 0;-4 0 6];
    x=mvnrnd(mu,S);
    
    Z = cos(theta(1))^2*x(1)+cos(theta(2))^2*sin(theta(1))^2*x(2)+sin(theta(2))^2*sin(theta(1))^2*x(3);
    
    e=[1,0,0];
    %e=[0,1,0];
    %e=[0,0,1];
    
    A(1,:)=-sin(2*theta(1))*x(1)+sin(2*theta(1))*cos(theta(2))^2*x(2)+sin(2*theta(1))*sin(theta(2))^2*x(3);
    A(2,:)=-sin(2*theta(2))*sin(theta(1))^2*x(2)+sin(2*theta(2))*sin(theta(1))^2*x(3);
    B=-e*inv(S)*x';
    %B=-e*inv(S)*(x-mu)';
    C=zeros(2,1);
    C(1,:)=-sin(2*theta(1));
    %C(1,:)=sin(2*theta(1))*cos(theta(2))^2;
    %C(1,:)=sin(2*theta(1))*sin(theta(2))^2;
    %C(2,:)=-sin(2*theta(2))*sin(theta(1))^2;
    %C(2,:)=sin(2*theta(2))*sin(theta(1))^2;
    
    G1=(Z<q)/cos(theta(1))^2*(A*B+C);
    %G1=(Z<q)/(cos(theta(2))^2*sin(theta(1))^2)*(A*B+C);
    %G1=(Z<q)/(sin(theta(2))^2*sin(theta(1))^2)*(A*B+C);
    G2=(Z<q)/cos(theta(1))^2*B;
    %G2=(Z<q)/(cos(theta(2))^2*sin(theta(1))^2)*B;
    %G2=(Z<q)/(sin(theta(2))^2*sin(theta(1))^2)*B;
    D=D+b1*(G1-G2*D)/k^a1;
    
    q=q+b2*(alpha-1*(Z<q))/k^a2;
    
    theta=theta+b3*D/k^a3;
    
    if theta(1)<0.01
        theta(1)=0.01;
    end
    if theta(2)<0.01
        theta(2)=0.01;
    end
    if theta(1)>pi/2-0.01
        theta(1)=pi/2-0.01;
    end
    if theta(2)>pi/2-0.01
        theta(2)=pi/2-0.01;
    end
end
end