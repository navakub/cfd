clear;clc

x = -2:0.01:2;
y = -2:0.01:2;
nx = length(x);
ny = length(y);
x0 = 0;
y0 = 0;
alp = 0;
psi = zeros(ny,nx);
vx = zeros(ny,nx);
vy = zeros(ny,nx);
p_uni = [1 alp];
p_dou = [2*pi x0 y0];
p_vor = [2*pi x0 y0];

for i = 1:nx
    for j = 1:ny
        xx = x(i);
        yy = y(j);
        uni = Psi([xx;yy],"uniform",p_uni);
        dou = Psi([xx;yy],"doublet",p_dou);
        vor = Psi([xx;yy],"line-vortex",p_vor);
        psi(j,i) = uni(1)+dou(1)+vor(1);
        vx(j,i) = uni(2) + dou(2)+vor(2);
        vy(j,i) = uni(3) + dou(3)+vor(3);
    end
end

[X,Y]=meshgrid(x,y);

subplot;
contour(X,Y,psi,'LevelList',-10:0.2:10,'ShowText','on');
hold on
quiver(X,Y,vx,vy);
plot(0,0,'ro');
hold off
