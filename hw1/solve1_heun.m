function [t,x] = solve1_heun(x0,h,t1,t2)
% solve DE for problem1 (x'=-ln(x) with x(0)=10)
% using Heun method
    n = (t2-t1)/h;  
    x=zeros(n,1); x(1)=x0;
    t=zeros(n,1); t(1)=t1;
    for i=1:n
        f = -log(x(i));
        x_ = x(i) - h*log(x(i)); f_ = -log(x_); %predictor
        x(i+1) = x(i) + h/2*(f + f_); %iteration
    
        t(i+1) = t(i) + h;
    end
end