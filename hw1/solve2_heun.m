function [x, y] = solve2_heun(x0,y0,h,t1,t2)
% solve x'' + 0.1x' + sin(x) = 0 with x(0)=1.5 and x'(0)=0
% system:  x' = y, y' = -0.1y - sin(x)
% using Heun method
    n = (t2-t1)/h ;
    x = zeros(n,1); x(1) = x0;
    y = zeros(n,1); y(1) = y0;
    
    for i=1:n
        %predictor
        x_ = x(i) + h*y(i);
        y_ = y(i) + h*(-0.1*y(i) - sin(x(i)));
    
        fy = -0.1*y(i) - sin(x(i));
        fy_ = -0.1*y_ - sin(x_);
        y(i+1) = y(i) + h/2*(fy + fy_);
        
        fx = y(i);
        fx_ = y_;
        x(i+1) = x(i) + h/2*(fx + fx_);
    end

end