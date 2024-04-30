clear;clc
x = linspace(-10,10,10); y = x;
[X,Y] = meshgrid(x,y);

% uniform flow
U = 1; alpha = 0;
psi = U*(Y*cosd(alpha)-X*sind(alpha));
subplot(221);contour(x,y,psi,20,'Color','k');
vx = U*cosd(alpha)*ones(size(X));
vy = U*sind(alpha)*ones(size(X));
subplot(222);quiver(X,Y,vx,vy)

% source flow
L = 10; x0 = 0; y0 = 0;
R2 = (X-x0).^2+(Y-y0).^2;
vx = L/(2*pi)*(X-x0)./R2;
vy = L/(2*pi)*(Y-y0)./R2;
subplot(224);quiver(X,Y,vx,vy)
x = linspace(-10,10,100); y = x;
[X,Y] = meshgrid(x,y);
psi = L/(2*pi)*atan2(Y-y0,X-x0);
psi2 = L/(2*pi)*mod(atan2(Y-y0,X-x0),2*pi);
subplot(223);contour(x,y,psi,20,'Color','k');
subplot(223);imagesc(psi);colorbar
subplot(224);imagesc(psi2);colorbar
return

% uniform flow + source
x = linspace(-10,10,1000); y = x;
[X,Y] = meshgrid(x,y);
psi = U*(Y*cosd(alpha)-X*sind(alpha)) + L/(2*pi)*mod(atan2(Y-y0,X-x0),2*pi);
subplot(223);contour(x,y,psi,20,'Color','k');
hold on;contour(x,y,psi,[5,5],'Color','k');hold off
subplot(224);imagesc(psi);colorbar