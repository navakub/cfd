clc;clear
h=0.05;
x=-3:h:3;y=-2:h:2;[X,Y]=meshgrid(x,y);
m=length(x);n=length(y);

q=zeros(n,m); omega=1;
q(y==1,x==-1)=-1;
q(y==1,x==1)=1; %omega=1 at (1,1)
q=-q;
it_max=20000;

psi=zeros(n,m); psi_j=psi;
%jacobi
for it=1:it_max
    r=norm(psi(:));
    for ix=2:m-1
        for iy=2:n-1
            psi_j(iy,ix) = 1/4*(psi(iy,ix-1) + psi(iy,ix+1) + psi(iy-1,ix) + psi(iy+1,ix)) - 1/4*h^2*q(iy,ix); 
        end
    end
    psi=psi_j;
    r1=norm(psi_j(:));
    if abs(r-r1)<1e-10
        break
    end
    r=r1;
end

% %gauss-seidel
% psi=zeros(n,m); psi_g=psi;
% for it=1:it_max
%     for ix=2:m-1
%         for iy=2:n-1
%             psi_g(iy,ix) = 1/4*(psi_g(iy,ix-1) + psi(iy,ix+1) + psi_g(iy-1,ix) + psi(iy+1,ix)) - 1/4*h^2*q(iy,ix); 
%         end
%     end
%     psi=psi_g;
% end
% 
% %SOR
% psi=zeros(n,m); psi_s=psi;
% alpha=cos(pi/m)+cos(pi/n);beta=(8-4*sqrt(4-alpha^2))/alpha^2;
% for it=1:it_max
%     for ix=2:m-1
%         for iy=2:n-1
%             psi_s(iy,ix) = psi(iy,ix) + beta/4*(psi_s(iy,ix-1) + psi(iy,ix+1) + psi_s(iy-1,ix) + psi(iy+1,ix) -4*psi(iy,ix) - h^2*q(iy,ix)); 
%         end
%     end
%     psi=psi_g;
% end


figure(1);colormap 'parula';
imagesc(x,y,psi_j);colorbar();axis xy;hold on;contour(x,y,psi_j,20,'red');
[px,py]=gradient(psi_j,h);vx=py;vy=-px;
v=quiver(X,Y,vx,vy,'magenta');set(v,'AutoScale','on', 'AutoScaleFactor', 3);hold off;


% subplot(131);imagesc(x,y,psi_j);colorbar();title('jacobi');
% subplot(132);imagesc(x,y,psi_g);colorbar();title('gauss-seidel');
% subplot(133);imagesc(x,y,psi_s);colorbar();title('SOR');