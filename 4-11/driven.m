clc;clear

h=.01;x=0:h:1;y=x;nx=length(x);ny=length(y);
omega=zeros(ny,nx);omega(end,:)=-2/(3*h);
psi=zeros(ny,nx);

alpha=cos(pi/nx)+cos(pi/ny);a2=alpha^2;beta = (8-4*sqrt(4-a2))/a2;%SOR
 
r1=0;
nt=1e4;
for i=1:nt
    for iy=2:ny-1
        omega(iy,1)=1/h^2*(-psi(iy-1,2)+psi(iy,2)*8/3-psi(iy+1,2)-psi(iy,3)*2/3);
        omega(iy,nx)=1/h^2*(-psi(iy-1,nx-1)+psi(iy,nx-1)*8/3-psi(iy+1,nx-1)-psi(iy,nx-2)*2/3);
    end
    for ix=2:nx-1
        omega(1,ix)=1/h^2*(-psi(2,ix-1)+psi(2,ix)*8/3-psi(2,ix+1)-psi(3,ix)*2/3);
        omega(ny,ix)=1/h^2*(-psi(ny-1,ix-1)+psi(ny-1,ix)*8/3-psi(ny-1,ix+1)-psi(ny-2,ix)*2/3) -2/(3*h);
    end
    % laplace eq (omega)
    for iy=2:ny-1
        for ix=2:nx-1
            omega(iy,ix) = omega(iy,ix) + beta/4*(omega(iy,ix+1)+omega(iy,ix-1)+omega(iy+1,ix)+omega(iy-1,ix)-4*omega(iy,ix));
        end
    end
    % poisson eq (psi)
    psi(1,:)=0;psi(end,:)=0;psi(:,end)=0;psi(:,1)=0;
    for iy=2:ny-1
        for ix=2:nx-1
            psi(iy,ix) = psi(iy,ix) + beta/4*(psi(iy,ix+1)+psi(iy,ix-1)+psi(iy+1,ix)+psi(iy-1,ix)-4*psi(iy,ix) + h^2*omega(iy,ix));
        end
    end
        
    r2=norm(omega(:));
    if abs(r2-r1)<1e-6 
        break; 
    end
    r1=r2;
    
    subplot(121);imagesc(x,y,omega);axis xy;title("\omega: n="+i);
    subplot(122);imagesc(x,y,psi);axis xy;title("\psi: n="+i);colorbar();
    drawnow;
end

