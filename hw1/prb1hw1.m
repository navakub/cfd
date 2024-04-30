clc;clear
% solve x' = -ln(x) with x(0)=10

x0 = 10;
ti = 0; tf = 10;

h1 = 1;
[t1e,x1e] = solve1_euler(x0,h1,ti,tf);
[t1h,x1h] = solve1_heun(x0,h1,ti,tf);

h2 = 0.1;
[t2e,x2e] = solve1_euler(x0,h2,ti,tf);
[t2h,x2h] = solve1_heun(x0,h2,ti,tf);

[t,x] = ode45(@(t,x) -log(x),[ti tf],x0);

subplot(211);
plot(t1e, x1e);hold on;
plot(t1h, x1h);
plot(t,x);
xlabel('t'); ylabel('x');
legend('euler','heun','exact');
title('h = 1');

subplot(212);
plot(t2e, x2e);hold on;
plot(t2h, x2h);
plot(t,x);
xlabel('t'); ylabel('x');
legend('euler','heun','exact');
title('h = 0.1');