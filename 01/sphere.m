clc; clear

d = 0.01;
rho = 8000;
rho_f = 1.22;
nu = 1.49e-5;
g = 9.8;

rho_bar = rho_f/rho;
C = .75*rho_bar/d;
B = g*(1 - rho_bar);
A = 1 + .5*rho_bar;


ti = 0; h = 0.1; tf = 10;
n = round(tf/h);
t = linspace(ti,tf,n);

v0 = 0.01; z0 = 0;
ve = zeros(n,1); ve(1) = v0;
ze = zeros(n,1); ze(1) = z0;

vh = zeros(n,1); vh(1) = v0;
zh = zeros(n,1); zh(1) = z0;


for i=1:n-1
    ve(i+1) = ve(i) + h*f(ve(i));
    vh(i+1) = ve(i) + h*.5*(f(vh(i))+f(ve(i+1)));
    
    ze(i+1) = ze(i) + h*ve(i);
    zh(i+1) = zh(i) + h*.5*(vh(i)+ve(i+1));
end

[t, y] = ode45(@freefall, [ti tf], [v0 z0]);


subplot(211); 
plot(t,ve);
hold on;
plot(t,vh);
plot(t,y(:,1));
hold off;
title('v');

subplot(212); 
plot(t,ze);
hold on;
plot(t,zh);
plot(t,y(:,2));
hold off;
title('z');
