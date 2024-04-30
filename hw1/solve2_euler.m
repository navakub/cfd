function [x, y] = solve2_euler(x0,y0,h,t1,t2)
% solve x'' + 0.1x' + sin(x) = 0 with x(0)=1.5 and x'(0)=0
% system:  x' = y, y' = -0.1y - sin(x)
% using Euler method

    n = (t2-t1)/h;   
    x = zeros(n,1); x(1) = x0;
    y = zeros(n,1); y(1) = y0;
    for i=1:n
        y(i+1) = y(i) + h*(-0.1*y(i) - sin(x(i)));
        x(i+1) = x(i) + h*y(i);
    end
end