clc;clear
%complex potential

n=50;
z0=0+0i;
x=linspace(-10,10,n);y=x;[X,Y]=meshgrid(x,y);

Z=X+1i*Y;
Z0=z0*ones(n);

w=Z*exp(1i*pi/6);
phi=real(w);psi=imag(w);

w_=(1i*w)^0.66;
phi_=real(w_);psi_=imag(w_);

subplot(121);contour(X,Y,phi,10,'black');hold on;contour(X,Y,psi,10,'red');title('before mapping');legend('\phi','\psi');
subplot(122);contour(X,Y,phi_,10,'black');hold on;contour(X,Y,psi_,10,'red');title('after mapping');legend('\phi','\psi');