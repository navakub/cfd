clear;clc

%1d wave
h=0.01;z=0:h:1;y=z;
nz=length(z);ny=nz;

u=zeros(ny,nz); un=u; it_max=1000;
%jacobi
for it=1:it_max
    r=norm(u(:));
    un(1,:)=0; %u=0@y=0
    un(:,[1 nz])=0; %u=0@z=0andz=1
    for iy=2:ny-1
        for iz=2:nz-1
            un(iy,iz) = 1/4*(h^2 + u(iy,iz+1) + u(iy,iz-1) + u(iy+1,iz) + u(iy-1,iz)); 
        end
    end
    un(ny,:)=un(ny-1,:); %uy=0@y=1
    u=un;
    rn=norm(un(:));
    if abs(r-rn)<1e-10
        break
    end
    r=rn;
end

figure(1);colormap 'parula';
imagesc(z,y,un);colorbar();axis xy;