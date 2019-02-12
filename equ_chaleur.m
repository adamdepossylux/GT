function res=equ_chaleur(N,u0,delta)
res=u0;
r=size(u0);
n=sqrt(r(1))-1;
for i=1:N
    res=inv((sparse(eye((n+1)^2))-delta*laplacien(n)))*res;
end
end