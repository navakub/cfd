clear;clc
x = linspace(-10,10,100); y = x;
[X,Y] = meshgrid(x,y);

% uniform flow
U = 1; alpha = 0;
psi = U*(Y*cosd(alpha)-X*sind(alpha));
subplot(221);contour(x,y,psi,20,'Color','k');
vx = U*cosd(alpha)*ones(size(X));
vy = U*sind(alpha)*ones(size(X));
subplot(222);quiver(X,Y,vx,vy)

% doublet flow
k = 40; x0 = 0; y0 = 0;
R2 = (X-x0).^2+(Y-y0).^2;
psi = -k/(2*pi)*(Y-y0)./R2;
subplot(223);contour(x,y,psi,100,'Color','k');

psi = U*(Y*cosd(alpha)-X*sind(alpha));
psi = psi-k/(2*pi)*(Y-y0)./R2;
subplot(224);contour(x,y,psi,50,'Color','k');
hold on;contour(x,y,psi,[0,0],'Color','k');hold off
axis image