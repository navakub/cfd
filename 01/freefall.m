function out = freefall(t,y)
    v = y(1);
    out = [f(v); v];
end

