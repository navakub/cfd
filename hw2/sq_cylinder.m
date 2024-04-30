clc;clear

% solve psi_xx + psi_yy =0
% with
% psi_x(x=0)=0
% psi_x(x=6)=1
% psi(y=0)=0=psi(y=4)
% psi(x,y)=0 if (2.5,1.5)<(x,y)<(3.5,2.5) (past cylinder)

H=4;W=6; % width,length
s=1;xl=2.5;yl=1.5; % side_of_square_cylinder,bottom_left_corner_of_cylinder (xl,yl)
h=0.1;
x=0:h:W;nx=length(x);
y=0:h:H;ny=length(y);

nt=500;
psi=zeros(ny,nx);
for it=1:nt
    psi(1,:)=1;psi(ny,:)=1;
    psi(y==H/2,:)=0;
    for ix=2:nx-1
        for iy=2:ny-1 
            if (x(ix)>=xl && x(ix)<=xl+s) && (y(iy)>=yl && y(iy)<=yl+s)
                psi(iy,ix)=0;                
            else
                if y(iy)~=H/2
                    a=cos(pi/nx)+cos(pi/ny);
                    beta = (8 - 4*sqrt(4-a^2))/a^2;
                    psi(iy,ix)=psi(iy,ix)+beta*(psi(iy,ix+1)+ ...
                        psi(iy,ix-1)+psi(iy+1,ix)+psi(iy-1,ix)-4*psi(iy,ix))/4;
                end
            end
        end 
    end
    psi(:,1)=psi(:,2);psi(:,nx)=psi(:,nx-1);
end
u=diff(psi,1,1)/h;u=[u;u(end,:)];
v=-diff(psi,1,2)/h;v=[v v(:,end)];

figure(1);
contour(x,y,psi,50);colorbar();hold on;quiver(x,y,u,v);hold off;
xlabel('x');ylabel('y');title('Flow past square cylinder');