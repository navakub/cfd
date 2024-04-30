function m = mp(t)
% mass of propellant at time t (problem 3)
    global mpo;
    if(t>=0)
        if(t<=1)
            dm = mpo*t^2/8;
        elseif(t>1 && t<=4)
            dm = mpo/8 + (t-1)*mpo/4;
        elseif(t>=4 && t<=5)
            dm = mpo - mpo/8*(5-t)^2;
        else
            dm = mpo;
        end
    end
    m = mpo - dm;
end