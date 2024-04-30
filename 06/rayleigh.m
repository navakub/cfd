clear;clc

%1d wave
nu=1e-6;c=1;dy=.01;
y=0:dy:1;ny=length(y);
dt=.8*dy^2/(2*nu);R=nu*dt/dy^2;

tf=1e6;nt=floor(tf/dt)+1; t=(1:nt-1)*dt;

u=zeros(nt,ny);
u(:,ny)=c;

for it=1:nt
    for iy=2:ny-1
        u(it+1,iy)= u(it,iy) + R*(u(it,iy+1) - 2*u(it,iy) + u(it,iy-1));
    end
end

figure(1);
imagesc(t,y,u);colorbar();axis xy;