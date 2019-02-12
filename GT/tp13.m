%question 3
N=3;
n=200;
delta=0.2;
x1=linspace(0,1,n+1);
x2=linspace(0,1,n+1);
x2=x2';
u0=sparse(zeros((n+1)^2,1));
u0=x1.*x2.*(x1-1).^3.*(x2-1).^3;
u0=reshape(u0',(n+1)^2,1);
u=equ_chaleur(N,u0,delta);
u=reshape(u',n+1,n+1);