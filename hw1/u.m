% solve f'=a(1+cos(x))^2
clear;clc
f0=1.5; ti=0; tf=10;
e=2;a=1;b=a*(1-e^2);h=10;
[t,f] = ode45(@(t,f) h/b^2*(1+e*cos(f))^2,[ti tf],f0);
plot(t,f);

