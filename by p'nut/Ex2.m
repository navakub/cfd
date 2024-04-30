clear;clc

U = 1; a = 1;
segz = 10;
zmax = 0.8*a; zmin = -0.8*a; hz = (zmax-zmin)/segz;
zs = zmin:hz:zmax;
nz = length(zs);
z = zeros(segz-1,1); r = zeros(segz-1,1);
for i = 1:segz-1
    ang = (10-i)*pi/10;
    r(i) = a*sin(ang);
    z(i) = a*cos(ang);
end

del = zeros(segz,segz);

for i = 1:segz-1
    for j = 1:segz
        dj = sqrt(r(i)^2 + (z(i)-zs(j))^2);
        dj1 = sqrt(r(i)^2 + (z(i)-zs(j+1))^2);
        del(i,j) = dj - dj1;
    end
end
del(segz,:) = hz;
rr = zeros(segz,1);
rr(1:segz-1) = (r.^2)/2; rr(segz) = 0;
Q = del\rr;


r_plot = -1.5:0.01:1.5;
z_plot = r_plot;
n_plot = length(r_plot);
urv = zeros(n_plot,n_plot);
uzv = urv;
pv = urv;
ure = urv;
uze = urv;
pe = urv;
for i = 1:n_plot
    for j = 1:n_plot
        urv(i,j) = ur_von(r_plot(i),z_plot(j),Q,U,zs);
        uzv(i,j) = uz_von(r_plot(i),z_plot(j),Q,U,zs);
        pv(i,j) = psi_von(r_plot(i),z_plot(j),Q,U,zs);
        ure(i,j) = ur_ex(r_plot(i),z_plot(j),U,a);
        uze(i,j) = uz_ex(r_plot(i),z_plot(j),U,a);
        pe(i,j) = psi_ex(r_plot(i),z_plot(j),U,a);
    end
end

[Rp,Zp]=meshgrid(r_plot,z_plot);

fg1 = figure;
subplot;
contour(Rp,Zp,pv,'LevelList',-10:0.1:2,'ShowText','on');
hold on
quiver(Rp,Zp,urv,uzv);
title("von");
hold off


fg2 = figure;
subplot;
contour(Rp,Zp,pe,'LevelList',-10:0.1:2,'ShowText','on');
hold on
quiver(Rp,Zp,ure,uze);
title("exact");
hold off






function urr = ur_von(r,z,Q,U,zs)
seg = length(Q);
sm = 0;
for j = 1:seg
    s1 = U*Q(j)/r;
    s2 = (z-zs(j+1))/sqrt(r^2 + (z-zs(j+1))^2);
    s3 = (z-zs(j))/sqrt(r^2 + (z-zs(j))^2);
    sm = sm + s1*(s2 - s3);
end
urr = 0 - sm;
return
end

function uzz = uz_von(r,z,Q,U,zs)
seg = length(Q);
sm = 0;
for j = 1:seg
    s1 = U*Q(j);
    s2 = 1/sqrt(r^2 + (z-zs(j+1))^2);
    s3 = 1/sqrt(r^2 + (z-zs(j))^2);
    sm = sm + s1*(s2 - s3);
end
uzz = U + sm;
return
end

function pp = psi_von(r,z,Q,U,zs)
seg = length(Q);
qq = U*Q;
sm = 0;
for j = 1:seg
    s1 = qq(j);
    s2 = sqrt(r^2 + (z-zs(j+1))^2);
    s3 = sqrt(r^2 + (z-zs(j))^2);
    sm = sm + s1*(s2 - s3);
end
pp = (U*(r^2)/2) + sm;
return
end

function urr = ur_ex(r,z,U,a)
Rr = sqrt(r^2 + z^2);
urr = -(3*U*r*z/2)*(a^3 / Rr^5);
return
end

function uzz = uz_ex(r,z,U,a)
Rr = sqrt(r^2 + z^2);
uzz = (1/r)*((1-((a/Rr)^3))*U*r + (3*U*(a^3)*(r^3))/(2*(Rr^5)));
return
end

function pp = psi_ex(r,z,U,a)
Rr = sqrt(r^2 + z^2);
nu = U*(a^3)/2;
pp = (U*(r^2)/2) - nu*(r^2)/(Rr^3);
return
end
