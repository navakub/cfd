clc;clear
% problem 2: solve x'' + 0.1x' + sin(x) = 0 with x(0)=1.5 and x'(0)=0
% system:  x' = y, y' = -0.1y - sin(x)
% x = theta and y = omega: in this problem

x0 = 1.5;
y0 = 0;
ti = 0; tf = 40;

h1 = 0.1; t1 = ti:h1:tf;
[x1e, y1e] = solve2_euler(x0,y0,h1,ti,tf);
[x1h, y1h] = solve2_heun(x0,y0,h1,ti,tf);

h2 = 0.01; t2 = ti:h2:tf;
[x2e, y2e] = solve2_euler(x0,y0,h2,ti,tf);
[x2h, y2h] = solve2_heun(x0,y0,h2,ti,tf);

h3 = 0.001; t3 = ti:h3:tf;
[x3e, y3e] = solve2_euler(x0,y0,h3,ti,tf);
[x3h, y3h] = solve2_heun(x0,y0,h3,ti,tf);

[t_, v] = ode45(@f2, [ti tf], [x0 y0]);
x_ = v(:,1); y_ = v(:,2);

figure(1);sgtitle('h=0.1');plot2(t1,x1e,x1h,y1e,y1h,t_,x_,y_);
figure(2);sgtitle('h=0.01');plot2(t2,x2e,x2h,y2e,y2h,t_,x_,y_);
figure(3);sgtitle('h=0.001');plot2(t3,x3e,x3h,y3e,y3h,t_,x_,y_);