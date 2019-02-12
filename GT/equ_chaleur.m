function [ma,u]=equ_chaleur(N,u0,delta)
n=size(u0);
u=u0;
r=size(u0);
n=sqrt(r(1))-1;
ma=zeros(N,1);
for i=1:N
    u=(sparse(eye((n+1)^2))-delta*laplacien(n))\u;
    ma(i)=max(u);
end
end