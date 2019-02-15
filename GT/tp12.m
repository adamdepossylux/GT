%question 2
tic
n=201;
N=n+1;
alpha=1;
beta=1;
x1=sparse(linspace(0,1,N));
x2=sparse(linspace(0,1,N));
x2=x2';
f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
bord=sparse(4*N,1);
xh=sparse(linspace(0.5,1,N/2));
xb=sparse(linspace(0,0.5,N/2));
bord(1:N/2)=alpha*xb.*(1/2-xb);
bord(2*N+N/2+1:3*N)=beta*(xh-1/2).*(1-xh);

b=sparse(N,N);
b(1,1:N)=bord(1:N);%bas
b(1:N,N)=bord(N+1:2*N);%droite
b(N,1:N)=bord(2*N+1:3*N);%haut
b(1:N,1)=bord(3*N+1:4*N);%gauche
plot(x1,b(1,:))

uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
[X,err]=fct(f,bord,uex);
X=reshape(X',N,N);

figure
plot(x1,X(N/2,:))
err;
toc