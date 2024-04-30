function f = f3(t,vector)
%function to verify by using ode45 (problem 3)
    global g ve cd rho A mc mpo;

    v = vector(1); z = vector(2);

    out_v = -g + (mp(t)*ve - 1/2*cd*rho*v*abs(v)*A)/(mc + mp(t));
    out_z = v;

    f = [out_v; out_z];
end