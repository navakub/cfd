function cDrag = cDrag(v)
    global d nu;
    
    Re = abs(v)*d/nu;
    if(Re<=1)
        cDrag=24/Re;
    elseif(Re>1 && Re<=400)
        cDrag=24/Re^0.646;
    elseif(Re>400 && Re<=3e5)
        cDrag=0.5;
    elseif(Re>3e5 && Re<=2e6)
        cDrag=0.000366*Re^0.4275;
    elseif(Re>3e5)
        cDrag=0.18;
    end


end

