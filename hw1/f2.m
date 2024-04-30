function f = f2(~,v)
%function to verify by using ode45 (problem 2)
    x = v(1); y = v(2);
    out_x = y;
    out_y = -0.1*y - sin(x);

    f = [out_x; out_y];
end