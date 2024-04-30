clc;clear
% problem 3: solve rocket equation
% v' = g + (mp*ve - 0.5*cd*rho*v*|v|*A)/(mc+mp)
% z' = v

global g ve cd rho A mc mpo;

g = 9.8;
mc = 50;
rho = 1.23;
A = 0.1;
ve = 360;
cd = 0.15;

mpo = 100;

v0 = 0;
z0 = 0;

h = 0.1; 

v(1) = v0;
z(1) = z0;
t(1) = 0;

i = 1; % index
while 1
    t_ = t(i) + h;
    v_ = v(i) + h*fz(t(i),z(i),v(i));
    z_ = z(i) + h*v(i);
    
    v(i+1) = v(i) + h/2*(fz(t(i),z(i),v(i)) + fz(t_,z_,v_));
    z(i+1) = z(i) + h/2*(v(i) + v_);
    t(i+1) = t(i) + h;

    i=i+1;
    %check if the rocket hits the ground
    if(z(i)<0) 
        break; 
    end
end
%numerical
vmax = max(v); % maximum speed
zmax = max(z); % maximum height
tg = t(i); % time that the rocket hits the ground (z=0)
vg = v(i); % velocity that the rocket hits the ground (z=0)

[te, we] = ode45(@f3, [0 100], [v0 z0]);
ve = we(:,1); ze = we(:,2);

%ode45
vmax_ = max(ve); % maximum speed
zmax_ = max(ze); % maximum height
tg_ = te(); % time that the rocket hits the ground (z=0)
vg_ = ve(end); % velocity that the rocket hits the ground (z=0)

subplot(211);plot(t,v);hold on;plot(te,ve);
xlabel('t');ylabel('v');
legend('heun','exact'); title('v');
subplot(212);plot(t,z);hold on;plot(te,ze);
xlabel('t');ylabel('z');
legend('heun','exact'); title('z');

[vmax vmax_] %display vmax
[zmax zmax_] %display zmax
[tg tg_] %display tg
[vg vg_] %display vg