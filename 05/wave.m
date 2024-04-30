clear;clc

%1d wave
v=1;dx=.1;dt=dx/v;c=v*dt/dx;
x=0:dx:1;nx=length(x);

tf=2; nt=floor(tf/dt);
u=zeros(nt,nx);
%u(x,0)
u(1,x>=.2&x<=.6)=sin(2*pi*(x(x>=.2&x<=.6)-.2)/.4);
u(1,x<.2&x>.6)=zeros(length(length(x<.2&x>.6)),1);

u(2,:)=u(1,:); %ut(x,0)=0
u(:,1)=0; %u(0,t)=0

for it=2:nt
    for ix=2:nx-1
        u(it+1,ix)=2*u(it,ix) + c^2*(u(it,ix+1) - 2*u(it,ix) + u(it,ix-1)) - u(it-1,ix);
    end
end


plot(x,u(end,:)');title(['t=' num2str(t)]);