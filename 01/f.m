function slope = f(v)
    global A B C d nu;
    c = cDrag(v);
    slope = 1/A * (B - C*c*abs(v)*v);
end

