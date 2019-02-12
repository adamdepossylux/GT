%distance
epsilon=10^-6;
n=175;
[ma,d]=distance(n,epsilon);
x1=linspace(0,1,n+1);
x2=x1';
contourf(x1,x2,d)