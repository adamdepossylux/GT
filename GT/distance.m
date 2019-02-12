function [ma,d]=distance(n,epsilon)
    N=n+1;
    f=sparse(zeros(N));
    f(1,1:N)=1;%bas
    f(1:N,N)=1;%droite
    f(N,1:N)=1;%haut
    f(1:N,1)=1;%gauche
    f=reshape(f',N^2,1);
    T=laplacien2(n,epsilon)\f;
    d=epsilon*log(1./T);
    ma=max(d);
    d=reshape(d,N,N);
end

