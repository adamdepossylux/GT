%question 2
n=199;
N=n+1;
alpha=1;
beta=1;
x1=sparse(linspace(0,1,N));
x2=sparse(linspace(0,1,N));
x2=x2';
f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
bord=sparse(zeros(4*N));
x=sparse(linspace(0,0.5,N/2));
bord(1:N/2)=alpha*x.^2;
x=sparse(linspace(0.5,1,N/2+1));
bord(N/2:N)=beta*x.^2;
uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
[X,err2]=fct(f,bord,uex);
X=reshape(X',N,N);
plot(x1,X(100,:))
err;