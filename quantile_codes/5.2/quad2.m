f=[-1 -2 -3];
H=[4 -2 -4;-2 5 0;-4 0 6];
A=[];
b=[];
Aeq=[1,1,1];
beq=1;
lb=[0;0;0];
ub=[];
[x,fval] = quadprog(H,f,A,b,Aeq,beq,lb,ub);