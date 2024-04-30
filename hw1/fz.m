function f = fz(t,~,v)
%function to use in heun method (problem 3)
    global g ve cd rho A mc mpo;
    f = -g + (mp(t)*ve - 1/2*cd*rho*v*abs(v)*A)/(mc + mp(t));
end