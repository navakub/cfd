function z_ = joukowski(a,b,yp)
xp = b-sqrt(a^2-yp^2);
theta=0:0.01:2*pi;
zp=xp+1i*yp;
%-----------------Joukowski Transformation--------------------------------
z=a*exp(1i*theta)+zp; %outer circle
z_=z+b^2./z; %airfoil
end

