%question 1
n=[10,20,40,80,160,320];
d=5;
err=zeros(d,1);
for i=1:d
    N=n(i)+1;
    x1=linspace(0,1,N);
    x2=linspace(0,1,N);
    x2=x2';
    f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
    bord=zeros(4*N);
    uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
    [X,err(i)]=fct(f,bord,uex);
end
%plot(n(1:d),-2*log(n(1:d)))
loglog(n(1:d),err)

%question 2
n=39;
N=n+1;
x1=linspace(0,1,N);
x2=linspace(0,1,N);
x2=x2';
f=6*(1-3*x1+2*x1.^2).*(x2-1).^3.*x2+6*(1-3*x2+2*x2.^2).*(x1-1).^3.*x1;
bord=zeros(4*N);
x=linspace(0,0.5,N/2);
bord(1:N/2)=x.^2;
x=linspace(0.5,1,N/2+1);
bord(N/2:N)=x.^2;
uex=x1.*x2.*(x1-1).^3.*(x2-1).^3;
[X,err2]=fct(f,bord,uex);
X=reshape(X',N,N);
err;

%question 3
N=1;
n=200;
delta=0.2;
x1=linspace(0,1,n+1);
x2=linspace(0,1,n+1);
x2=x2';
u0=zeros((n+1)^2,1);
u0=x1.*x2.*(x1-1).^3.*(x2-1).^3;
u0=reshape(u0',(n+1)^2,1);
u=equ_chaleur(N,u0,delta);
u=reshape(u',n+1,n+1);