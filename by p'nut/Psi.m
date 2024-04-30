function ff = Psi(r,typ,p)
x = r(1); y = r(2);

if typ == "uniform"
    U = p(1);
    alp = p(2);
    psi = U*(y*cos(alp) - x*sin(alp));
    vx = U*cos(alp);
    vy = U*sin(alp);
elseif typ == "line-source"
    lam = p(1);
    xr = x - p(2);
    yr = y - p(3);
    r2 = xr^2 + yr^2;
    psi = (lam/(2*pi))*atan(yr/xr);
    vx = (lam/(2*pi))*(xr/r2);
    vy = (lam/(2*pi))*(yr/r2);
elseif typ == "line-vortex"
    gam = p(1);
    xr = x - p(2);
    yr = y - p(3);
    r2 = xr^2 + yr^2;
    psi = (gam/(2*pi))*log(sqrt(r2));
    vx = (gam/(2*pi))*(yr/r2);
    vy = 0 - (gam/(2*pi))*(xr/r2);
elseif typ == "doublet"
    kap = p(1);
    xr = x - p(2);
    yr = y - p(3);
    r2 = xr^2 + yr^2;
    psi = 0 - (kap/(2*pi))*(yr/r2);
    vx = 0 - (kap/(2*pi))*((yr^2 - xr^2)/(r2^2));
    vy = (kap/(2*pi))*(2*xr*yr/(r2^2));
end


ff = [psi; vx; vy];