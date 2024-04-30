clear;clc
D=.1;h=1;dt=1;alpha=D*dt/h^2;
beta=-alpha;
gamma = 1+2*alpha;
n=100; u=zeros(n,1); u(50)=1; plot(u);pause(.1);

A=zeros(n,n);
A(1,1)=gamma;A(1,1)=beta;
A(end,end)=gamma;A(end,end-1)=beta;
for i=2:n-1
    A(i,i)=gamma;A(i,i-1)=beta;A(i,i+1)=beta;
end
A=sparse(A);
for it=1:50
    u=A\u;
    plot(u);title("it="+it);axis([0 100 0 1])
    pause(.1)
end