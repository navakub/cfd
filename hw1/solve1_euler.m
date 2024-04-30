function [t,x] = solve1_euler(x0,h,t1,t2)
%solve DE for problem1 (x'=-ln(x) with x(0)=10)
%using Euler method
    n = (t2-t1)/h; 
    x=zeros(n,1); x(1)=x0;
    t=zeros(n,1); t(1)=t1;
    for i=1:n
        x(i+1) = x(i) - h*log(x(i));
        t(i+1) = t(i) + h;
    end
end